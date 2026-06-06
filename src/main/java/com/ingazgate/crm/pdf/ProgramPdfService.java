package com.ingazgate.crm.pdf;

import com.ingazgate.crm.asset.Department;
import com.ingazgate.crm.asset.University;
import com.ibm.icu.text.ArabicShaping;
import com.ibm.icu.text.ArabicShapingException;
import com.ibm.icu.text.Bidi;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.net.URI;
import java.net.http.HttpClient;
import java.nio.charset.StandardCharsets;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class ProgramPdfService {
  private static final Logger log = LoggerFactory.getLogger(ProgramPdfService.class);
  private static final String FONT_LATIN = "/fonts/NotoSans-Regular.ttf";
  private static final String FONT_ARABIC = "/fonts/NotoSansArabic-Regular.ttf";
  private static final String[] BRANDING_LOGO_PATHS = {
    "/static/images/logo.jpg",
    "/static/images/logo.png",
    "/images/logo.jpg",
    "/images/icon.JPG",
  };

  private static final float PAGE_W = PDRectangle.A4.getWidth();
  private static final float PAGE_H = PDRectangle.A4.getHeight();
  private static final float MARGIN = 40f;
  private static final float GAP_AFTER_HEADER = 14f;
  private static final float CARD_V_GAP = 18f;
  private static final float CARD_PAD = 16f;
  private static final float COL_GAP = 10f;
  private static final float BADGE_H = 17f;
  private static final float BADGE_FONT = 7f;
  private static final float LOGO_BOX = 56f;
  private static final float BODY = 6.5f;
  private static final float BODY_SM = 5.8f;
  private static final float TITLE = 11f;
  private static final float LEAD = 9f;
  private static final float INFO_LEAD = 7.8f;
  private static final float COST_SIZE = 8.8f;
  /** Label column width in PROGRAM INFORMATION (values align after this) */
  private static final float INFO_LABEL_COL = 76f;
  /** Rounded corners on each program “card” */
  private static final float CARD_CORNER_R = 18f;
  /** Top/bottom inset inside each PROGRAM INFORMATION grid row */
  private static final float INFO_TABLE_VPAD = 7f;
  /** Space below the last text baseline so descenders clear the row border */
  private static final float INFO_TABLE_ROW_EXTRA_BOTTOM = 9f;
  /** Label / value inset from left and value column from right */
  private static final float INFO_TABLE_CELL_PAD_X = 5f;
  private static final float INFO_TABLE_ROW_GAP = 2f;
  private static final float C_INFO_ROW_FILL_R = 0.97f;
  private static final float C_INFO_ROW_FILL_G = 0.988f;
  private static final float C_INFO_ROW_FILL_B = 1f;
  private static final float C_INFO_GRID_R = 0.68f;
  private static final float C_INFO_GRID_G = 0.76f;
  private static final float C_INFO_GRID_B = 0.90f;

  /** Header strip (column titles) — light blue-gray */
  private static final float C_HEAD_BG_R = 0.91f;
  private static final float C_HEAD_BG_G = 0.933f;
  private static final float C_HEAD_BG_B = 0.953f;

  private static final float C_BLUE_R = 0.12f;
  private static final float C_BLUE_G = 0.47f;
  private static final float C_BLUE_B = 0.94f;
  private static final float C_PRICE_BEFORE_R = 0.86f;
  private static final float C_PRICE_BEFORE_G = 0.28f;
  private static final float C_PRICE_BEFORE_B = 0.28f;
  private static final float C_PRICE_AFTER_R = 0.13f;
  private static final float C_PRICE_AFTER_G = 0.60f;
  private static final float C_PRICE_AFTER_B = 0.33f;

  private static final float C_LINE = 0.88f;
  private static final float C_MUTED = 0.45f;
  /** Light blue program row “card” fill */
  private static final float C_CARD_BLUE_R = 0.93f;
  private static final float C_CARD_BLUE_G = 0.96f;
  private static final float C_CARD_BLUE_B = 1f;
  private static final float C_LOGO_BOX_FILL = 0.985f;
  private static final float C_LOGO_BOX_BORDER = 0.84f;
  private static final int VALUE_STYLE_NORMAL = 0;
  private static final int VALUE_STYLE_BEFORE_DISCOUNT = 1;
  private static final int VALUE_STYLE_AFTER_DISCOUNT = 2;

  private static final DateTimeFormatter HEADER_TIME =
      DateTimeFormatter.ofPattern("MMMM d, yyyy h:mm a", Locale.US);

  @Value("${app.pdf.contact-phone:}")
  private String pdfContactPhone;

  @Value("${app.pdf.contact-email:}")
  private String pdfContactEmail;

  @Value("${app.pdf.display-timezone:Europe/Istanbul}")
  private String pdfDisplayTimezone;

  private record PdfFonts(PDFont latin, PDFont arabic) {
    PDFont forProgramParagraph(int paragraphIndex) {
      if (paragraphIndex > 0 && arabic != null) {
        return arabic;
      }
      return latin;
    }
  }

  public byte[] renderProgramComparisonPdf(
      String companyName, String studentName, List<Department> programsInOrder) throws IOException {
    return renderProgramComparisonPdf(companyName, studentName, programsInOrder, null, null);
  }

  public byte[] renderProgramComparisonPdf(
      String companyName,
      String studentName,
      List<Department> programsInOrder,
      byte[] explicitBrandingLogo)
      throws IOException {
    return renderProgramComparisonPdf(
        companyName, studentName, programsInOrder, explicitBrandingLogo, null);
  }

  public byte[] renderProgramComparisonPdf(
      String companyName,
      String studentName,
      List<Department> programsInOrder,
      byte[] explicitBrandingLogo,
      String brandingContactPhone)
      throws IOException {
    ZoneId zone = pdfZone();
    ZonedDateTime now = ZonedDateTime.now(zone);
    String timeLine = HEADER_TIME.format(now);

    try (PDDocument doc = new PDDocument()) {
      String brandDisplay = stripCrmSuffix(companyName);
      PdfFonts fonts = loadFonts(doc);
      byte[] brandingLogo =
          explicitBrandingLogo != null && explicitBrandingLogo.length > 0
              ? explicitBrandingLogo
              : loadBrandingLogoBytes();
      PDImageXObject brandingImg =
          brandingLogo != null && brandingLogo.length > 0
              ? tryCreateImage(doc, brandingLogo, "brand")
              : null;

      float contentLeft = MARGIN;
      float contentRight = PAGE_W - MARGIN;
      float contentW = contentRight - contentLeft;
      /* Columns must fit inside card inner width (contentW − 2×CARD_PAD), not full contentW */
      float innerColW = contentW - 2f * CARD_PAD;
      float colProg = innerColW * 0.31f;
      float colUni = innerColW * 0.28f;
      float colInfo = innerColW - colProg - colUni - 2f * COL_GAP;

      PDPage page = new PDPage(PDRectangle.A4);
      doc.addPage(page);
      PDPageContentStream cs = new PDPageContentStream(doc, page);
      resetStroke(cs);

      float y =
          drawDocumentHeader(
              doc,
              cs,
              fonts.latin,
              brandingImg,
              contentLeft,
              contentRight,
              PAGE_H - MARGIN,
              timeLine,
              brandDisplay,
              studentName,
              brandingContactPhone);

      y -= GAP_AFTER_HEADER;
      y = drawColumnHeaders(cs, fonts.latin, contentLeft, y, contentW, colProg, colUni, colInfo);
      y -= 4;

      boolean firstCardOnPage = true;
      for (Department d : programsInOrder) {
        float cardH = measureCardHeight(fonts, d, colProg, colUni, colInfo);
        float minY = MARGIN + 52f;
        if (y - cardH < minY) {
          cs.close();
          page = new PDPage(PDRectangle.A4);
          doc.addPage(page);
          cs = new PDPageContentStream(doc, page);
          resetStroke(cs);
          y = PAGE_H - MARGIN;
          y =
              drawContinuedHeader(cs, fonts.latin, contentLeft, contentRight, y, studentName);
          y -= 10;
          y = drawColumnHeaders(cs, fonts.latin, contentLeft, y, contentW, colProg, colUni, colInfo);
          y -= 4;
          firstCardOnPage = true;
        }
        if (!firstCardOnPage) {
          y -= CARD_V_GAP;
        }
        drawProgramCard(
            doc,
            cs,
            fonts,
            d,
            contentLeft,
            y,
            contentW,
            cardH,
            colProg,
            colUni,
            colInfo);
        y -= cardH;
        firstCardOnPage = false;
      }

      drawFooter(cs, fonts.latin, contentLeft, contentW, brandDisplay);

      cs.close();

      ByteArrayOutputStream out = new ByteArrayOutputStream();
      doc.save(out);
      return out.toByteArray();
    }
  }

  private static final PDRectangle LANDSCAPE_A4 =
      new PDRectangle(PDRectangle.A4.getHeight(), PDRectangle.A4.getWidth());
  private static final float CAT_MARGIN = 28f;
  private static final float CAT_HEADER_H = 52f;
  private static final float CAT_TABLE_HEADER_H = 16f;
  private static final float CAT_ROW_MIN_H = 12f;
  private static final float CAT_ROW_LINE_H = 8.4f;
  private static final float CAT_ROW_PAD = 3.5f;
  private static final float CAT_FONT = 6.2f;
  private static final float CAT_FONT_HDR = 6.5f;
  private static final int CAT_PROG_MAX_LINES = 4;
  private static final int CAT_UNI_MAX_LINES = 2;
  private static final float CAT_LOGO_SZ = 12f;
  private static final float CAT_LOGO_GAP = 3f;

  private record CatalogCol(String title, float width) {}

  private static final CatalogCol[] CATALOG_COLS = {
    new CatalogCol("University", 96f),
    new CatalogCol("Program", 196f),
    new CatalogCol("Degree", 48f),
    new CatalogCol("Country", 38f),
    new CatalogCol("Language", 38f),
    new CatalogCol("Before", 42f),
    new CatalogCol("After", 42f),
    new CatalogCol("Cash", 42f),
    new CatalogCol("Yrs", 20f),
    new CatalogCol("Status", 34f),
  };

  /** Compact table export for full program catalogs (no student name). */
  public byte[] renderProgramCatalogTablePdf(
      String companyName, List<Department> programs, byte[] explicitBrandingLogo, long totalCount)
      throws IOException {
    ZoneId zone = pdfZone();
    String timeLine = HEADER_TIME.format(ZonedDateTime.now(zone));
    String brandDisplay = stripCrmSuffix(companyName);

    try (PDDocument doc = new PDDocument()) {
      PdfFonts fonts = loadFonts(doc);
      byte[] brandingLogo =
          explicitBrandingLogo != null && explicitBrandingLogo.length > 0
              ? explicitBrandingLogo
              : loadBrandingLogoBytes();
      PDImageXObject brandingImg =
          brandingLogo != null && brandingLogo.length > 0
              ? tryCreateImage(doc, brandingLogo, "brand")
              : null;

      float pageW = LANDSCAPE_A4.getWidth();
      float pageH = LANDSCAPE_A4.getHeight();
      float left = CAT_MARGIN;
      float right = pageW - CAT_MARGIN;
      float tableW = right - left;
      float[] colX = catalogColumnStarts(left);

      PDPage page = new PDPage(LANDSCAPE_A4);
      doc.addPage(page);
      PDPageContentStream cs = new PDPageContentStream(doc, page);
      resetStroke(cs);

      float y = drawCatalogPageHeader(cs, fonts.latin, brandingImg, left, right, pageH - CAT_MARGIN, timeLine, brandDisplay, totalCount);
      y = drawCatalogTableHeader(cs, fonts.latin, left, y, tableW, colX);
      float minY = CAT_MARGIN + 14f;

      Map<UUID, PDImageXObject> logoCache = new HashMap<>();
      int rowIdx = 0;
      for (Department d : programs) {
        float rowH = measureCatalogRowHeight(doc, fonts, d, colX, logoCache);
        if (y - rowH < minY) {
          cs.close();
          page = new PDPage(LANDSCAPE_A4);
          doc.addPage(page);
          cs = new PDPageContentStream(doc, page);
          resetStroke(cs);
          y = pageH - CAT_MARGIN - 8f;
          y = drawCatalogTableHeader(cs, fonts.latin, left, y, tableW, colX);
        }
        if (rowIdx % 2 == 1) {
          cs.setNonStrokingColor(0.96f, 0.97f, 0.99f);
          cs.addRect(left, y - rowH, tableW, rowH);
          cs.fill();
          resetStroke(cs);
        }
        drawCatalogRow(doc, cs, fonts, d, colX, y, rowH, logoCache);
        y -= rowH;
        rowIdx++;
      }

      cs.close();
      ByteArrayOutputStream out = new ByteArrayOutputStream();
      doc.save(out);
      return out.toByteArray();
    }
  }

  private static float[] catalogColumnStarts(float left) {
    float[] xs = new float[CATALOG_COLS.length + 1];
    xs[0] = left;
    for (int i = 0; i < CATALOG_COLS.length; i++) {
      xs[i + 1] = xs[i] + CATALOG_COLS[i].width();
    }
    return xs;
  }

  private float drawCatalogPageHeader(
      PDPageContentStream cs,
      PDFont font,
      PDImageXObject brandingImg,
      float left,
      float right,
      float yTop,
      String timeLine,
      String company,
      long totalCount)
      throws IOException {
    float y = yTop;
    if (brandingImg != null) {
      float max = 42f;
      float sc = Math.min(max / brandingImg.getWidth(), max / brandingImg.getHeight());
      float dw = brandingImg.getWidth() * sc;
      float dh = brandingImg.getHeight() * sc;
      cs.drawImage(brandingImg, left, y - dh, dw, dh);
      y -= dh + 4f;
    }
    drawTextLineSafe(cs, font, 10f, left, y, clip(forFont(company, font), 80));
    y -= 12f;
    setGray(cs, C_MUTED);
    String sub =
        timeLine
            + "  ·  "
            + String.format(Locale.US, "%,d program%s", totalCount, totalCount == 1 ? "" : "s");
    drawTextLineSafe(cs, font, CAT_FONT, left, y, clip(forFont(sub, font), 120));
    resetStroke(cs);
    return y - CAT_HEADER_H + 28f;
  }

  private float drawCatalogTableHeader(
      PDPageContentStream cs, PDFont font, float left, float yTop, float tableW, float[] colX)
      throws IOException {
    float bottom = yTop - CAT_TABLE_HEADER_H;
    cs.setNonStrokingColor(C_HEAD_BG_R, C_HEAD_BG_G, C_HEAD_BG_B);
    cs.addRect(left, bottom, tableW, CAT_TABLE_HEADER_H);
    cs.fill();
    cs.setStrokingColor(C_INFO_GRID_R, C_INFO_GRID_G, C_INFO_GRID_B);
    cs.setLineWidth(0.35f);
    cs.addRect(left, bottom, tableW, CAT_TABLE_HEADER_H);
    cs.stroke();
    resetStroke(cs);
    cs.setNonStrokingColor(0.18f, 0.2f, 0.24f);
    for (int i = 0; i < CATALOG_COLS.length; i++) {
      drawTextLineSafe(
          cs,
          font,
          CAT_FONT_HDR,
          colX[i] + 2f,
          yTop - 11f,
          clip(CATALOG_COLS[i].title(), 18));
    }
    resetStroke(cs);
    return bottom;
  }

  private float measureCatalogRowHeight(
      PDDocument doc, PdfFonts fonts, Department d, float[] colX, Map<UUID, PDImageXObject> logoCache)
      throws IOException {
    University u = d.getUniversity();
    String uni = u != null ? nz(u.getName()) : "—";
    String prog = nz(d.getName());
    float uniTextW = catalogUniTextWidth(colX, u, doc, logoCache);
    int uniLines = wrapCatalogCell(uni, fonts.latin, uniTextW, CAT_UNI_MAX_LINES).size();
    int progLines =
        wrapCatalogCell(prog, fonts.latin, colWidth(colX, 1), CAT_PROG_MAX_LINES).size();
    String nameAr = d.getNameAr() != null ? d.getNameAr().trim() : "";
    if (!nameAr.isBlank() && fonts.arabic != null) {
      PDFont af = fonts.arabic;
      String en = (d.getName() != null ? d.getName().trim() : "").toLowerCase(Locale.ROOT);
      if (en.isEmpty() || !nameAr.toLowerCase(Locale.ROOT).equals(en)) {
        progLines +=
            wrapCatalogCell(nameAr, af, colWidth(colX, 1), CAT_PROG_MAX_LINES - (int) progLines)
                .size();
      }
    }
    int lineCount = (int) Math.max(1, Math.max(uniLines, progLines));
    float logoH = catalogUniLogoHeight(u, doc, logoCache);
    float textH = CAT_ROW_PAD * 2 + lineCount * CAT_ROW_LINE_H;
    return Math.max(CAT_ROW_MIN_H, Math.max(textH, logoH + CAT_ROW_PAD * 2));
  }

  private float catalogUniTextWidth(
      float[] colX, University u, PDDocument doc, Map<UUID, PDImageXObject> logoCache) {
    float w = colWidth(colX, 0);
    if (u != null && resolveUniversityLogoForCatalog(doc, u, logoCache) != null) {
      return Math.max(20f, w - CAT_LOGO_SZ - CAT_LOGO_GAP);
    }
    return w;
  }

  private float catalogUniLogoHeight(
      University u, PDDocument doc, Map<UUID, PDImageXObject> logoCache) {
    if (u == null) {
      return 0f;
    }
    PDImageXObject img = resolveUniversityLogoForCatalog(doc, u, logoCache);
    if (img == null) {
      return 0f;
    }
    float sc = Math.min(CAT_LOGO_SZ / img.getWidth(), CAT_LOGO_SZ / img.getHeight());
    return img.getHeight() * sc;
  }

  private static float colWidth(float[] colX, int index) {
    return colX[index + 1] - colX[index] - 4f;
  }

  private List<String> wrapCatalogCell(String text, PDFont font, float maxW, int maxLines)
      throws IOException {
    String prepared = containsArabic(text) ? shapeArabicForPdf(text) : forFont(text, font);
    List<String> lines =
        containsArabic(text)
            ? wrapArabicLines(prepared, font, CAT_FONT, maxW)
            : wrapLines(prepared, font, CAT_FONT, maxW);
    if (lines.size() <= maxLines) {
      return lines;
    }
    return lines.subList(0, maxLines);
  }

  private void drawCatalogRow(
      PDDocument doc,
      PDPageContentStream cs,
      PdfFonts fonts,
      Department d,
      float[] colX,
      float yTop,
      float rowH,
      Map<UUID, PDImageXObject> logoCache)
      throws IOException {
    University u = d.getUniversity();
    String sym = moneySymbol(u);
    String[] cells = {
      u != null ? nz(u.getName()) : "—",
      nz(d.getName()),
      blankToDash(d.getDegree()),
      u != null ? blankToDash(u.getCountry()) : "—",
      blankToDash(d.getLanguage()),
      fmtMoney(d.getBeforeDiscount(), sym),
      fmtMoney(d.getCost(), sym),
      fmtMoneyOrBlank(d.getCashPrice(), sym),
      d.getYears() != null ? String.valueOf(d.getYears()) : "—",
      d.isAvailable() ? "Available" : "Full",
    };

    List<String> progEnLines =
        wrapCatalogCell(cells[1], fonts.latin, colWidth(colX, 1), CAT_PROG_MAX_LINES);
    List<String> progArLines = List.of();
    String nameAr = d.getNameAr() != null ? d.getNameAr().trim() : "";
    if (!nameAr.isBlank()
        && fonts.arabic != null
        && progEnLines.size() < CAT_PROG_MAX_LINES) {
      String en = (d.getName() != null ? d.getName().trim() : "").toLowerCase(Locale.ROOT);
      if (en.isEmpty() || !nameAr.toLowerCase(Locale.ROOT).equals(en)) {
        progArLines =
            wrapCatalogCell(
                nameAr,
                fonts.arabic,
                colWidth(colX, 1),
                CAT_PROG_MAX_LINES - progEnLines.size());
      }
    }

    float uniX = colX[0] + 2f;
    float uniTextW = catalogUniTextWidth(colX, u, doc, logoCache);
    PDImageXObject uniLogo = resolveUniversityLogoForCatalog(doc, u, logoCache);
    if (uniLogo != null) {
      float sc = Math.min(CAT_LOGO_SZ / uniLogo.getWidth(), CAT_LOGO_SZ / uniLogo.getHeight());
      float dw = uniLogo.getWidth() * sc;
      float dh = uniLogo.getHeight() * sc;
      float ly = yTop - CAT_ROW_PAD - dh;
      cs.drawImage(uniLogo, uniX, ly, dw, dh);
      uniX += dw + CAT_LOGO_GAP;
    }

    List<String> uniLines = wrapCatalogCell(cells[0], fonts.latin, uniTextW, CAT_UNI_MAX_LINES);

    float textTop = yTop - CAT_ROW_PAD - 6f;
    drawCatalogMultilineCell(cs, fonts.latin, uniLines, uniX, textTop);
    float progBaseline = textTop;
    drawCatalogMultilineCell(cs, fonts.latin, progEnLines, colX[1] + 2f, progBaseline);
    if (!progArLines.isEmpty()) {
      progBaseline -= progEnLines.size() * CAT_ROW_LINE_H;
      drawCatalogMultilineCell(cs, fonts.arabic, progArLines, colX[1] + 2f, progBaseline);
    }

    float singleBaseline = yTop - CAT_ROW_PAD - 6f;
    for (int i = 2; i < cells.length; i++) {
      PDFont cellFont = fonts.latin;
      float maxW = colWidth(colX, i);
      String text = fitCell(forFont(cells[i], cellFont), cellFont, CAT_FONT, maxW);
      if (i == 5) {
        cs.setNonStrokingColor(C_PRICE_BEFORE_R, C_PRICE_BEFORE_G, C_PRICE_BEFORE_B);
      } else if (i == 6) {
        cs.setNonStrokingColor(C_PRICE_AFTER_R, C_PRICE_AFTER_G, C_PRICE_AFTER_B);
      } else {
        cs.setNonStrokingColor(0, 0, 0);
      }
      drawTextLineSafe(cs, cellFont, CAT_FONT, colX[i] + 2f, singleBaseline, text);
    }
    resetStroke(cs);
  }

  private void drawCatalogMultilineCell(
      PDPageContentStream cs, PDFont font, List<String> lines, float x, float firstBaseline)
      throws IOException {
    float y = firstBaseline;
    cs.setNonStrokingColor(0, 0, 0);
    for (String line : lines) {
      drawTextLineSafe(cs, font, CAT_FONT, x, y, line);
      y -= CAT_ROW_LINE_H;
    }
  }

  private static String fitCell(String text, PDFont font, float fontSize, float maxW)
      throws IOException {
    if (text == null || text.isEmpty()) {
      return "";
    }
    if (textWidth(text, font, fontSize) <= maxW) {
      return text;
    }
    String ell = "...";
    for (int len = text.length(); len >= 1; len--) {
      String sub = text.substring(0, len) + ell;
      if (textWidth(sub, font, fontSize) <= maxW) {
        return sub;
      }
    }
    return ell;
  }

  private ZoneId pdfZone() {
    try {
      return ZoneId.of(
          pdfDisplayTimezone != null && !pdfDisplayTimezone.isBlank()
              ? pdfDisplayTimezone.trim()
              : "Europe/Istanbul");
    } catch (Exception e) {
      return ZoneId.of("Europe/Istanbul");
    }
  }

  /** Stored logos only (cached) — keeps full-catalog export fast. */
  private PDImageXObject resolveUniversityLogoForCatalog(
      PDDocument doc, University u, Map<UUID, PDImageXObject> cache) {
    if (u == null || u.getId() == null) {
      return null;
    }
    return cache.computeIfAbsent(
        u.getId(),
        id -> {
          byte[] stored = loadStoredLogoBytes(u.getLogoUrl());
          if (stored == null || stored.length == 0) {
            return null;
          }
          return createPdfImage(doc, stored, "u" + id.toString().replace("-", ""));
        });
  }

  private float drawContinuedHeader(
      PDPageContentStream cs, PDFont font, float left, float right, float yTop, String student)
      throws IOException {
    setGray(cs, C_MUTED);
    drawTextLineSafe(cs, font, BODY_SM, left, yTop - 8, "Programs (continued)");
    resetStroke(cs);
    String name = clip(forFont(student, font), 80);
    String prefix = "Student: ";
    float prefSize = BODY_SM;
    float nameSize = 11f;
    float tw =
        textWidth(prefix, font, prefSize) + textWidth(name, PDType1Font.HELVETICA_BOLD, nameSize);
    float xStart = right - tw;
    setGray(cs, C_MUTED);
    drawTextLineSafe(cs, font, prefSize, xStart, yTop - 8, prefix);
    float nx = xStart + textWidth(prefix, font, prefSize);
    cs.setNonStrokingColor(C_BLUE_R, C_BLUE_G, C_BLUE_B);
    drawTextLineSafe(cs, PDType1Font.HELVETICA_BOLD, nameSize, nx, yTop - 8.5f, name);
    resetStroke(cs);
    return yTop - 22;
  }

  private void drawFooter(PDPageContentStream cs, PDFont font, float x, float w, String company)
      throws IOException {
    setGray(cs, C_MUTED);
    String line =
        "Prepared by "
            + clip(forFont(company, font), 60)
            + ". Details are indicative; confirm tuition and availability with the institution.";
    List<String> lines = wrapLines(forFont(line, font), font, 5.5f, w);
    float baseline = MARGIN + 10f;
    for (int i = 0; i < lines.size(); i++) {
      drawTextLineSafe(cs, font, 5.5f, x, baseline + i * 7f, lines.get(i));
    }
    resetStroke(cs);
  }

  private float drawDocumentHeader(
      PDDocument doc,
      PDPageContentStream cs,
      PDFont font,
      PDImageXObject brandingImg,
      float left,
      float right,
      float yTop,
      String timeLine,
      String company,
      String student,
      String brandingContactPhone)
      throws IOException {
    float y = yTop;

    setGray(cs, C_MUTED);
    drawTextLineSafe(cs, font, BODY_SM, left, y - 6, timeLine);
    resetStroke(cs);
    y -= 16;

    float logoBottom = y - 6f;
    if (brandingImg != null) {
      float max = 68f;
      float iw = brandingImg.getWidth();
      float ih = brandingImg.getHeight();
      float sc = Math.min(max / iw, max / ih);
      float dw = iw * sc;
      float dh = ih * sc;
      float lx = left;
      float ly = y - dh - 2;
      cs.drawImage(brandingImg, lx, ly, dw, dh);
      logoBottom = ly;
    }

    float blockTop = y;
    String brandWord = company != null ? company.trim() : "Student CRM";
    drawTextLineSafe(cs, font, 9.5f, left, logoBottom - 10, brandWord.toUpperCase(Locale.ROOT));

    float ry = blockTop - 6;
    String c1 = clip(forFont(company, font), 80);
    float w1 = textWidth(c1, font, TITLE);
    drawTextLineSafe(cs, font, TITLE, right - w1, ry, c1);
    ry -= 14;
    String headerPhone =
        StringUtils.hasText(brandingContactPhone)
            ? brandingContactPhone.trim()
            : (StringUtils.hasText(pdfContactPhone) ? pdfContactPhone.trim() : null);
    if (StringUtils.hasText(headerPhone)) {
      String ph = clip(forFont(headerPhone, font), 40);
      float wp = textWidth(ph, font, BODY);
      drawTextLineSafe(cs, font, BODY, right - wp, ry, ph);
      ry -= 12;
    }
    if (StringUtils.hasText(pdfContactEmail)) {
      String em = clip(pdfContactEmail.trim(), 48);
      setGray(cs, C_MUTED);
      float we = textWidth(em, font, BODY_SM);
      drawTextLineSafe(cs, font, BODY_SM, right - we, ry, em);
      resetStroke(cs);
      ry -= 12;
    }

    float headerBottom = Math.min(logoBottom - 22, ry - 4);
    float yStud = headerBottom - 6f;
    String pref = "Student name: ";
    String nm = clip(forFont(student, font), 90);
    float prefSize = 9f;
    float nameSize = 12f;
    setGray(cs, C_MUTED);
    drawTextLineSafe(cs, font, prefSize, left, yStud, pref);
    float nx = left + textWidth(pref, font, prefSize);
    cs.setNonStrokingColor(C_BLUE_R, C_BLUE_G, C_BLUE_B);
    drawTextLineSafe(cs, PDType1Font.HELVETICA_BOLD, nameSize, nx, yStud + 0.5f, nm);
    resetStroke(cs);
    return yStud - 20f;
  }

  private float drawColumnHeaders(
      PDPageContentStream cs,
      PDFont font,
      float left,
      float yTop,
      float totalW,
      float wProg,
      float wUni,
      float wInfo)
      throws IOException {
    float h = 22f;
    float bottom = yTop - h;
    cs.setNonStrokingColor(C_HEAD_BG_R, C_HEAD_BG_G, C_HEAD_BG_B);
    cs.addRect(left, bottom, totalW, h);
    cs.fill();
    cs.setNonStrokingColor(0.22f, 0.24f, 0.27f);
    float x = left + CARD_PAD;
    drawTextLineSafe(cs, font, 7f, x, yTop - 8, "PROGRAM");
    x += wProg + COL_GAP;
    drawTextLineSafe(cs, font, 7f, x, yTop - 8, "UNIVERSITY");
    x += wUni + COL_GAP;
    drawTextLineSafe(cs, font, 7f, x, yTop - 8, "PROGRAM INFORMATION");
    resetStroke(cs);
    return bottom;
  }

  private float measureCardHeight(PdfFonts fonts, Department d, float wProg, float wUni, float wInfo)
      throws IOException {
    University u = d.getUniversity();
    float innerProg = wProg - 8;
    float innerUni = wUni - 8;
    float p1 = measureProgramColHeight(fonts, innerProg, d);
    float p2 = measureUniColHeight(fonts.latin, u, innerUni);
    float p3 = measureInfoColHeight(fonts.latin, wInfo - 8, d, u);
    float inner = Math.max(Math.max(p1, p2), p3) + 8;
    return inner + 2 * CARD_PAD;
  }

  private float measureProgramColHeight(PdfFonts fonts, float maxW, Department d) throws IOException {
    float h = BADGE_H + 12;
    String en = nz(d.getName());
    List<String> enLines = wrapLines(forFont(en, fonts.latin), fonts.latin, BODY + 0.5f, maxW);
    h += enLines.size() * LEAD;
    if (d.getNameAr() != null && !d.getNameAr().isBlank()) {
      h += 4;
      List<String> arLines =
          wrapLines(
              forFont(d.getNameAr().trim(), fonts.arabic != null ? fonts.arabic : fonts.latin),
              fonts.arabic != null ? fonts.arabic : fonts.latin,
              BODY,
              maxW);
      if (containsArabic(d.getNameAr())) {
        arLines =
            wrapArabicLines(
                shapeArabicForPdf(d.getNameAr().trim()),
                fonts.arabic != null ? fonts.arabic : fonts.latin,
                BODY,
                maxW);
      }
      h += arLines.size() * LEAD;
    }
    return h;
  }

  private float measureUniColHeight(PDFont font, University u, float maxW) throws IOException {
    float boxEst = Math.max(36f, Math.min(LOGO_BOX, maxW - 4f));
    float h = boxEst + 16;
    if (u != null) {
      String name = nz(u.getName());
      h += wrapLines(forFont(name, font), font, BODY, maxW).size() * LEAD;
      h += 6;
      if (StringUtils.hasText(u.getWebsite())) {
        String site = normalizeWebsiteDisplay(u.getWebsite());
        h += wrapLines(forFont(site, font), font, BODY_SM, maxW).size() * (LEAD - 1.2f);
      }
    }
    return h;
  }

  private float measureInfoColHeight(PDFont font, float maxW, Department d, University u)
      throws IOException {
    float vW = Math.max(40f, maxW - INFO_LABEL_COL - INFO_TABLE_CELL_PAD_X);
    String sym = moneySymbol(u);
    float h = 2;
    h += measureInfoTableRowHeight(nz(d.getLanguage()), font, BODY, vW, false);
    h += INFO_TABLE_ROW_GAP;
    h += measureInfoTableRowHeight(yearsLabel(d), font, BODY, vW, false);
    h += INFO_TABLE_ROW_GAP;
    h += measureInfoTableRowHeight(fmtMoney(d.getBeforeDiscount(), sym), font, COST_SIZE, vW, true);
    h += INFO_TABLE_ROW_GAP;
    h += measureInfoTableRowHeight(fmtMoney(d.getCost(), sym), font, COST_SIZE, vW, true);
    h += INFO_TABLE_ROW_GAP;
    h += measureInfoTableRowHeight(fmtMoneyOrBlank(d.getCashPrice(), sym), font, COST_SIZE, vW, true);
    h += 12;
    return h;
  }

  private float measureInfoTableRowHeight(
      String value, PDFont font, float fontSize, float valueMaxW, boolean money) throws IOException {
    List<String> lines =
        wrapLines(clip(forFont(value, font), 200), font, fontSize, valueMaxW);
    int n = Math.max(1, lines.size());
    float lineStep = money ? INFO_LEAD + 1.9f : INFO_LEAD + 1.05f;
    float valueBlockH = n * lineStep;
    float labelH = BODY_SM + 2f;
    float contentH = Math.max(labelH, valueBlockH);
    return INFO_TABLE_VPAD * 2 + contentH + INFO_TABLE_ROW_EXTRA_BOTTOM;
  }

  private static String yearsLabel(Department d) {
    return d.getYears() != null ? d.getYears() + " yrs" : "—";
  }

  private void drawProgramCard(
      PDDocument doc,
      PDPageContentStream cs,
      PdfFonts fonts,
      Department d,
      float left,
      float yTop,
      float totalW,
      float cardH,
      float wProg,
      float wUni,
      float wInfo)
      throws IOException {
    float bottom = yTop - cardH;

    cs.setNonStrokingColor(C_CARD_BLUE_R, C_CARD_BLUE_G, C_CARD_BLUE_B);
    fillRoundRect(cs, left, bottom, totalW, cardH, CARD_CORNER_R);
    cs.setStrokingColor(C_BLUE_R, C_BLUE_G, C_BLUE_B);
    cs.setLineWidth(0.75f);
    strokeRoundRect(cs, left, bottom, totalW, cardH, CARD_CORNER_R);
    resetStroke(cs);

    float innerTop = yTop - CARD_PAD;
    float x0 = left + CARD_PAD;
    float x1 = x0 + wProg + COL_GAP;
    float x2 = x1 + wUni + COL_GAP;
    float innerBottom = bottom + CARD_PAD;
    float vLineLow = innerBottom + CARD_CORNER_R * 0.35f;
    float vLineHigh = innerTop - 2f;

    strokeVLine(cs, x1 - COL_GAP / 2, vLineLow, vLineHigh);
    strokeVLine(cs, x2 - COL_GAP / 2, vLineLow, vLineHigh);

    drawProgramColumn(cs, fonts, d, x0, innerTop, wProg - 8);
    drawUniversityColumn(doc, cs, fonts.latin, d.getUniversity(), x1, innerTop, wUni - 8);
    drawInfoColumn(cs, fonts.latin, d, d.getUniversity(), x2, innerTop, wInfo - 8);
  }

  private void drawProgramColumn(PDPageContentStream cs, PdfFonts fonts, Department d, float x, float yTop, float maxW)
      throws IOException {
    float y = yTop;
    String deg = clip(blankToDash(d.getDegree()), 28);
    PDFont badgeFont = PDType1Font.HELVETICA_BOLD;
    float badgeW =
        Math.min(maxW - 4, textWidth(deg, badgeFont, BADGE_FONT) + 16);
    badgeW = Math.max(40, badgeW);
    float yBottom = y - BADGE_H;
    cs.setNonStrokingColor(C_BLUE_R, C_BLUE_G, C_BLUE_B);
    fillPill(cs, x, yBottom, badgeW, BADGE_H);
    cs.setNonStrokingColor(1f, 1f, 1f);
    float textW = textWidth(deg, badgeFont, BADGE_FONT);
    float bx = x + (badgeW - textW) / 2f;
    float baseline = yBottom + BADGE_H / 2f - BADGE_FONT / 3f;
    drawTextLineSafe(cs, badgeFont, BADGE_FONT, bx, baseline, deg);
    resetStroke(cs);
    y -= BADGE_H + 10;

    String en = nz(d.getName());
    List<String> enLines = wrapLines(forFont(en, fonts.latin), fonts.latin, BODY + 0.5f, maxW);
    cs.setNonStrokingColor(0, 0, 0);
    for (String line : enLines) {
      drawTextLineSafe(cs, fonts.latin, BODY + 0.5f, x, y, line);
      y -= LEAD;
    }
    if (d.getNameAr() != null && !d.getNameAr().isBlank()) {
      y -= 2;
      PDFont af = fonts.arabic != null ? fonts.arabic : fonts.latin;
      String arText = shapeArabicForPdf(d.getNameAr().trim());
      List<String> arLines =
          containsArabic(arText)
              ? wrapArabicLines(forFont(arText, af), af, BODY, maxW)
              : wrapLines(forFont(arText, af), af, BODY, maxW);
      for (String line : arLines) {
        drawTextLineSafe(cs, af, BODY, x, y, line);
        y -= LEAD;
      }
    }
  }

  private void drawUniversityColumn(
      PDDocument doc, PDPageContentStream cs, PDFont font, University u, float x, float yTop, float maxW)
      throws IOException {
    float y = yTop;
    if (u == null) {
      drawTextLineSafe(cs, font, BODY, x, y - 6, "—");
      return;
    }

    float boxSz = Math.max(36f, Math.min(LOGO_BOX, maxW - 4f));
    PDImageXObject uniImg = resolveUniversityLogo(doc, u);
    float boxLeft = x;
    float boxBottom = y - boxSz;
    cs.setNonStrokingColor(C_LOGO_BOX_FILL, C_LOGO_BOX_FILL, C_LOGO_BOX_FILL);
    fillRoundRect(cs, boxLeft, boxBottom, boxSz, boxSz, 10f);
    cs.setStrokingColor(C_LOGO_BOX_BORDER, C_LOGO_BOX_BORDER, C_LOGO_BOX_BORDER);
    cs.setLineWidth(0.55f);
    strokeRoundRect(cs, boxLeft, boxBottom, boxSz, boxSz, 10f);
    resetStroke(cs);

    if (uniImg != null) {
      float iw = uniImg.getWidth();
      float ih = uniImg.getHeight();
      float sc = Math.min((boxSz - 8) / iw, (boxSz - 8) / ih);
      float dw = iw * sc;
      float dh = ih * sc;
      float lx = boxLeft + (boxSz - dw) / 2f;
      float ly = boxBottom + (boxSz - dh) / 2f;
      cs.drawImage(uniImg, lx, ly, dw, dh);
    }

    y = boxBottom - 12;
    String name = nz(u.getName());
    for (String line : wrapLines(forFont(name, font), font, BODY, maxW)) {
      drawTextLineSafe(cs, font, BODY, x, y, line);
      y -= LEAD;
    }
    if (StringUtils.hasText(u.getWebsite())) {
      y -= 3;
      setGray(cs, C_MUTED);
      String site = normalizeWebsiteDisplay(u.getWebsite());
      for (String line : wrapLines(forFont(site, font), font, BODY_SM, maxW)) {
        drawTextLineSafe(cs, font, BODY_SM, x, y, line);
        y -= LEAD - 1.2f;
      }
      resetStroke(cs);
    }
  }

  private static String normalizeWebsiteDisplay(String website) {
    String w = website.trim();
    if (!w.contains("://")) {
      w = "https://" + w;
    }
    return clip(w, 120);
  }

  private PDImageXObject resolveUniversityLogo(PDDocument doc, University u) throws IOException {
    if (u == null) {
      return null;
    }
    String logoName = "u" + u.getId().toString().replace("-", "");
    String rawLogo = u.getLogoUrl();
    boolean uploadedDataUri =
        StringUtils.hasText(rawLogo) && rawLogo.trim().startsWith("data:image/");

    if (StringUtils.hasText(rawLogo)) {
      byte[] stored = loadStoredLogoBytes(rawLogo);
      if (stored != null && stored.length > 0) {
        PDImageXObject img = createPdfImage(doc, stored, logoName);
        if (img != null) {
          return img;
        }
      }
      if (uploadedDataUri) {
        log.warn("Could not render uploaded university logo for {} ({})", u.getName(), u.getId());
        return null;
      }
    }

    List<String> urls = buildExternalLogoUrlCandidates(u);
    byte[] bestBody = null;
    int bestArea = 0;
    for (String url : urls) {
      byte[] body = fetchUrlBytes(url);
      if (body == null || body.length < 24) {
        continue;
      }
      if (looksLikeSvgOrHtml(body)) {
        continue;
      }
      int area = rasterPixelArea(body);
      if (area <= 0) {
        continue;
      }
      if (area > bestArea) {
        bestArea = area;
        bestBody = body;
      }
    }
    if (bestBody == null) {
      return null;
    }
    return createPdfImage(doc, bestBody, logoName);
  }

  private byte[] loadStoredLogoBytes(String raw) {
    if (!StringUtils.hasText(raw)) {
      return null;
    }
    String value = raw.trim();
    byte[] fromData = decodeStoredLogoBytes(value);
    if (fromData != null) {
      return fromData;
    }
    String url = value;
    if (url.startsWith("//")) {
      url = "https:" + url;
    }
    if (url.startsWith("http://") || url.startsWith("https://")) {
      return fetchUrlBytes(url);
    }
    return null;
  }

  private static PDImageXObject createPdfImage(PDDocument doc, byte[] data, String name) {
    if (data == null || data.length == 0) {
      return null;
    }
    byte[] raster = toPdfRasterBytes(data);
    if (raster != null) {
      PDImageXObject img = tryCreateImage(doc, raster, name);
      if (img != null) {
        return img;
      }
    }
    return tryCreateImage(doc, data, name);
  }

  /** Decode any ImageIO-supported format (incl. WebP) to PNG for PDFBox. */
  private static byte[] toPdfRasterBytes(byte[] data) {
    try (InputStream in = new ByteArrayInputStream(data)) {
      BufferedImage bi = ImageIO.read(in);
      if (bi == null) {
        return null;
      }
      int w = bi.getWidth();
      int h = bi.getHeight();
      if (w <= 0 || h <= 0) {
        return null;
      }
      BufferedImage rgb = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
      Graphics2D g = rgb.createGraphics();
      g.setColor(Color.WHITE);
      g.fillRect(0, 0, w, h);
      g.drawImage(bi, 0, 0, null);
      g.dispose();
      ByteArrayOutputStream out = new ByteArrayOutputStream();
      ImageIO.write(rgb, "png", out);
      return out.toByteArray();
    } catch (IOException e) {
      return null;
    }
  }

  /** Prefer the largest decoded raster so we scale down (sharp) instead of up (blocky). */
  private static int rasterPixelArea(byte[] data) {
    try {
      BufferedImage bi = ImageIO.read(new ByteArrayInputStream(data));
      if (bi != null && bi.getWidth() > 0 && bi.getHeight() > 0) {
        return bi.getWidth() * bi.getHeight();
      }
    } catch (IOException ignored) {
    }
    try (PDDocument probe = new PDDocument()) {
      PDImageXObject img = PDImageXObject.createFromByteArray(probe, data, "probe");
      return img.getWidth() * img.getHeight();
    } catch (Exception ignored) {
      return 0;
    }
  }

  private static List<String> buildExternalLogoUrlCandidates(University u) {
    Set<String> ordered = new LinkedHashSet<>();
    addHighResLogoFallbackUrls(ordered, u.getWebsite());
    return new ArrayList<>(ordered);
  }

  private static void addHighResLogoFallbackUrls(Set<String> out, String website) {
    if (!StringUtils.hasText(website)) {
      return;
    }
    try {
      String href = website.trim().contains("://") ? website.trim() : "https://" + website.trim();
      URI uri = URI.create(href);
      String host = uri.getHost();
      if (host == null || host.isBlank()) {
        return;
      }
      String bare = host.startsWith("www.") ? host.substring(4) : host;
      if (!bare.isEmpty()) {
        out.add("https://logo.clearbit.com/" + bare);
        out.add(
            "https://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://"
                + bare
                + "&size=256");
      }
      out.add("https://www.google.com/s2/favicons?domain=" + host + "&sz=256");
      out.add("https://www.google.com/s2/favicons?domain=" + host + "&sz=128");
      if (host.startsWith("www.")) {
        if (!bare.isEmpty()) {
          out.add("https://www.google.com/s2/favicons?domain=" + bare + "&sz=256");
          out.add("https://www.google.com/s2/favicons?domain=" + bare + "&sz=128");
        }
      } else {
        out.add("https://www.google.com/s2/favicons?domain=www." + host + "&sz=256");
        out.add("https://www.google.com/s2/favicons?domain=www." + host + "&sz=128");
      }
      out.add("https://icons.duckduckgo.com/ip3/" + host + ".ico");
    } catch (IllegalArgumentException ignored) {
    }
  }

  private static boolean looksLikeSvgOrHtml(byte[] data) {
    int n = Math.min(data.length, 512);
    String head = new String(data, 0, n, StandardCharsets.UTF_8).trim();
    if (head.startsWith("<!") || head.startsWith("<?") || head.startsWith("<html")) {
      return true;
    }
    return head.startsWith("<svg") || head.contains("<svg");
  }

  private void drawInfoColumn(
      PDPageContentStream cs, PDFont font, Department d, University u, float x, float yTop, float maxW)
      throws IOException {
    float labelX = x;
    float valueRight = x + maxW;
    String sym = moneySymbol(u);
    float y = yTop - 2f;

    y = drawInfoTableRow(cs, font, labelX, valueRight, y, "Language", nz(d.getLanguage()), false, VALUE_STYLE_NORMAL);
    y -= INFO_TABLE_ROW_GAP;
    y = drawInfoTableRow(cs, font, labelX, valueRight, y, "Years", yearsLabel(d), false, VALUE_STYLE_NORMAL);
    y -= INFO_TABLE_ROW_GAP;
    y =
        drawInfoTableRow(
            cs,
            font,
            labelX,
            valueRight,
            y,
            "Before discount",
            fmtMoney(d.getBeforeDiscount(), sym),
            true,
            VALUE_STYLE_BEFORE_DISCOUNT);
    y -= INFO_TABLE_ROW_GAP;
    y =
        drawInfoTableRow(
            cs,
            font,
            labelX,
            valueRight,
            y,
            "After discount",
            fmtMoney(d.getCost(), sym),
            true,
            VALUE_STYLE_AFTER_DISCOUNT);
    y -= INFO_TABLE_ROW_GAP;
    drawInfoTableRow(
        cs,
        font,
        labelX,
        valueRight,
        y,
        "Cash",
        fmtMoneyOrBlank(d.getCashPrice(), sym),
        true,
        VALUE_STYLE_NORMAL);
  }

  /**
   * One grid row: light fill, border, label | value divider, content. Returns the bottom Y of the row
   * (PDF coordinates).
   */
  private float drawInfoTableRow(
      PDPageContentStream cs,
      PDFont font,
      float lx,
      float rx,
      float yTop,
      String label,
      String value,
      boolean money,
      int valueStyle)
      throws IOException {
    float valueStart = lx + INFO_LABEL_COL;
    float valueMaxW =
        Math.max(32f, rx - valueStart - INFO_TABLE_CELL_PAD_X);
    float valueSize = money ? COST_SIZE : BODY;
    List<String> valueLines =
        wrapLines(clip(forFont(value, font), 200), font, valueSize, valueMaxW);
    float lineStep = money ? INFO_LEAD + 1.9f : INFO_LEAD + 1.05f;
    float valueBlockH = valueLines.size() * lineStep;
    float labelH = BODY_SM + 2f;
    float contentH = Math.max(labelH, valueBlockH);
    float rowH = INFO_TABLE_VPAD * 2 + contentH + INFO_TABLE_ROW_EXTRA_BOTTOM;
    float rowBottom = yTop - rowH;
    float dividerX = lx + INFO_LABEL_COL - 2f;

    cs.setNonStrokingColor(C_INFO_ROW_FILL_R, C_INFO_ROW_FILL_G, C_INFO_ROW_FILL_B);
    cs.addRect(lx, rowBottom, rx - lx, rowH);
    cs.fill();
    cs.setStrokingColor(C_INFO_GRID_R, C_INFO_GRID_G, C_INFO_GRID_B);
    cs.setLineWidth(0.4f);
    cs.addRect(lx, rowBottom, rx - lx, rowH);
    cs.stroke();
    strokeVLineColored(cs, dividerX, rowBottom, yTop, C_INFO_GRID_R, C_INFO_GRID_G, C_INFO_GRID_B, 0.4f);
    resetStroke(cs);

    float labelBaseline = yTop - INFO_TABLE_VPAD - 0.9f;
    setGray(cs, C_MUTED);
    drawTextLineSafe(
        cs, font, BODY_SM, lx + INFO_TABLE_CELL_PAD_X, labelBaseline, clip(label, 22));
    resetStroke(cs);

    float vy = yTop - INFO_TABLE_VPAD - 0.9f;
    for (String line : valueLines) {
      if (valueStyle == VALUE_STYLE_BEFORE_DISCOUNT) {
        cs.setNonStrokingColor(C_PRICE_BEFORE_R, C_PRICE_BEFORE_G, C_PRICE_BEFORE_B);
      } else if (valueStyle == VALUE_STYLE_AFTER_DISCOUNT) {
        cs.setNonStrokingColor(C_PRICE_AFTER_R, C_PRICE_AFTER_G, C_PRICE_AFTER_B);
      } else {
        cs.setNonStrokingColor(0, 0, 0);
      }
      drawTextLineSafe(cs, font, money ? COST_SIZE : BODY, valueStart, vy, line);
      vy -= lineStep;
    }
    cs.setNonStrokingColor(0, 0, 0);
    return rowBottom;
  }

  /**
   * Strips a trailing "CRM" from branding (e.g. "IngazGate CRM" → "IngazGate") for student-facing PDFs.
   */
  private static String stripCrmSuffix(String s) {
    if (s == null) {
      return "";
    }
    String t = s.trim().replaceAll("(?i)\\s*crm\\s*$", "").trim();
    return t.isEmpty() ? s.trim() : t;
  }

  /**
   * Horizontal “stadium” / pill shape (fully rounded ends). {@code yBottom} is the lower edge; height
   * extends upward in PDF coordinates.
   */
  private static void fillPill(PDPageContentStream cs, float x, float yBottom, float w, float h)
      throws IOException {
    float r = Math.min(h / 2f, w / 2f);
    float x0 = x;
    float y0 = yBottom;
    float x1 = x + w;
    float y1 = yBottom + h;
    float k = 0.5522847498f * r;
    cs.moveTo(x0 + r, y0);
    cs.lineTo(x1 - r, y0);
    cs.curveTo(x1 - r + k, y0, x1, y0 + r - k, x1, y0 + r);
    cs.curveTo(x1, y0 + r + k, x1 - r + k, y1, x1 - r, y1);
    cs.lineTo(x0 + r, y1);
    cs.curveTo(x0 + r - k, y1, x0, y1 - r + k, x0, y0 + r);
    cs.curveTo(x0, y0 + r - k, x0 + r - k, y0, x0 + r, y0);
    cs.closePath();
    cs.fill();
  }

  private static void pathRoundRect(
      PDPageContentStream cs, float x, float yBottom, float w, float h, float radius)
      throws IOException {
    float r = Math.min(radius, Math.min(w / 2f, h / 2f));
    if (r <= 0.5f) {
      cs.addRect(x, yBottom, w, h);
      return;
    }
    float x0 = x;
    float y0 = yBottom;
    float x1 = x + w;
    float y1 = yBottom + h;
    float k = 0.5522847498f * r;
    cs.moveTo(x0 + r, y0);
    cs.lineTo(x1 - r, y0);
    cs.curveTo(x1 - r + k, y0, x1, y0 + r - k, x1, y0 + r);
    cs.lineTo(x1, y1 - r);
    cs.curveTo(x1, y1 - r + k, x1 - r + k, y1, x1 - r, y1);
    cs.lineTo(x0 + r, y1);
    cs.curveTo(x0 + r - k, y1, x0, y1 - r + k, x0, y1 - r);
    cs.lineTo(x0, y0 + r);
    cs.curveTo(x0, y0 + r - k, x0 + r - k, y0, x0 + r, y0);
    cs.closePath();
  }

  private static void fillRoundRect(
      PDPageContentStream cs, float x, float yBottom, float w, float h, float radius) throws IOException {
    pathRoundRect(cs, x, yBottom, w, h, radius);
    cs.fill();
  }

  private static void strokeRoundRect(
      PDPageContentStream cs, float x, float yBottom, float w, float h, float radius) throws IOException {
    pathRoundRect(cs, x, yBottom, w, h, radius);
    cs.stroke();
  }

  private void strokeHLine(PDPageContentStream cs, float x0, float x1, float y) throws IOException {
    cs.setStrokingColor(0.2f, 0.21f, 0.23f);
    cs.setLineWidth(0.8f);
    cs.moveTo(x0, y);
    cs.lineTo(x1, y);
    cs.stroke();
    resetStroke(cs);
  }

  private void strokeHLineThin(PDPageContentStream cs, float x0, float x1, float y) throws IOException {
    cs.setStrokingColor(C_LINE, C_LINE, C_LINE);
    cs.setLineWidth(0.35f);
    cs.moveTo(x0, y);
    cs.lineTo(x1, y);
    cs.stroke();
    resetStroke(cs);
  }

  private void strokeVLine(PDPageContentStream cs, float x, float yLow, float yHigh) throws IOException {
    cs.setStrokingColor(C_LINE, C_LINE, C_LINE);
    cs.setLineWidth(0.35f);
    cs.moveTo(x, yLow);
    cs.lineTo(x, yHigh);
    cs.stroke();
    resetStroke(cs);
  }

  private void strokeVLineColored(
      PDPageContentStream cs,
      float x,
      float yLow,
      float yHigh,
      float r,
      float g,
      float b,
      float lineWidth)
      throws IOException {
    cs.setStrokingColor(r, g, b);
    cs.setLineWidth(lineWidth);
    cs.moveTo(x, yLow);
    cs.lineTo(x, yHigh);
    cs.stroke();
  }

  private void setGray(PDPageContentStream cs, float g) throws IOException {
    cs.setNonStrokingColor(g, g, g);
  }

  private void resetStroke(PDPageContentStream cs) throws IOException {
    cs.setNonStrokingColor(0, 0, 0);
    cs.setStrokingColor(0, 0, 0);
    cs.setLineWidth(1f);
  }

  private PdfFonts loadFonts(PDDocument doc) throws IOException {
    PDFont latin = null;
    try (InputStream in = ProgramPdfService.class.getResourceAsStream(FONT_LATIN)) {
      if (in != null) {
        latin = PDType0Font.load(doc, in, true);
      }
    } catch (IOException e) {
      log.warn("Could not load Noto Sans (Latin): {}", e.getMessage());
    }
    if (latin == null) {
      latin = PDType1Font.HELVETICA;
    }
    PDFont arabic = null;
    try (InputStream in = ProgramPdfService.class.getResourceAsStream(FONT_ARABIC)) {
      if (in != null) {
        arabic = PDType0Font.load(doc, in, true);
      }
    } catch (IOException e) {
      log.warn("Could not load Noto Sans Arabic: {}", e.getMessage());
    }
    return new PdfFonts(latin, arabic);
  }

  private byte[] loadBrandingLogoBytes() {
    for (String path : BRANDING_LOGO_PATHS) {
      try (InputStream in = ProgramPdfService.class.getResourceAsStream(path)) {
        if (in != null) {
          return in.readAllBytes();
        }
      } catch (IOException ignored) {
      }
    }
    return null;
  }

  private static PDImageXObject tryCreateImage(PDDocument doc, byte[] data, String name) {
    try {
      return PDImageXObject.createFromByteArray(doc, data, name);
    } catch (Exception e) {
      log.debug("Skip image {}: {}", name, e.getMessage());
      return null;
    }
  }

  private byte[] fetchUrlBytes(String url) {
    if (!StringUtils.hasText(url)) {
      return null;
    }
    String u = url.trim();
    if (!u.startsWith("http://") && !u.startsWith("https://")) {
      return null;
    }
    try {
      HttpRequest req =
          HttpRequest.newBuilder(URI.create(u))
              .GET()
              .timeout(Duration.ofSeconds(12))
              .header("User-Agent", "Mozilla/5.0 (compatible; Student-CRM/1.0; +pdf-export)")
              .header(
                  "Accept",
                  "image/avif,image/webp,image/apng,image/png,image/jpeg,image/*;q=0.8,*/*;q=0.5")
              .build();
      HttpResponse<byte[]> resp =
          HttpClient.newBuilder()
              .connectTimeout(Duration.ofSeconds(6))
              .followRedirects(HttpClient.Redirect.NORMAL)
              .build()
              .send(req, HttpResponse.BodyHandlers.ofByteArray());
      if (resp.statusCode() != 200) {
        return null;
      }
      byte[] body = resp.body();
      if (body == null || body.length == 0 || body.length > 4_000_000) {
        return null;
      }
      return body;
    } catch (Exception e) {
      log.debug("Could not fetch logo URL: {}", url);
      return null;
    }
  }

  private void drawTextLineSafe(
      PDPageContentStream cs, PDFont font, float size, float x, float baseline, String text)
      throws IOException {
    String t = text == null ? "" : text;
    cs.beginText();
    cs.setFont(font, size);
    cs.newLineAtOffset(x, baseline);
    try {
      cs.showText(t);
    } catch (IllegalArgumentException ex) {
      cs.endText();
      cs.beginText();
      cs.setFont(PDType1Font.HELVETICA, size);
      cs.newLineAtOffset(x, baseline);
      cs.showText(latin1Safe(t));
    }
    cs.endText();
  }

  private static String nz(String s) {
    if (s == null || s.isBlank()) {
      return "—";
    }
    return s.trim();
  }

  private static String blankToDash(String s) {
    if (s == null || s.isBlank()) {
      return "—";
    }
    return s.trim();
  }

  private static String moneySymbol(University u) {
    if (u == null || u.getCurrency() == null || u.getCurrency().isBlank()) {
      return "$";
    }
    return "EUR".equalsIgnoreCase(u.getCurrency().trim()) ? "\u20AC" : "$";
  }

  private static String fmtMoney(BigDecimal v, String sym) {
    if (v == null) {
      return "—";
    }
    DecimalFormat df =
        new DecimalFormat("#,##0.##", DecimalFormatSymbols.getInstance(Locale.US));
    return sym + df.format(v);
  }

  private static String fmtMoneyOrBlank(BigDecimal v, String sym) {
    if (v == null) {
      return "";
    }
    return fmtMoney(v, sym);
  }

  private String forFont(String s, PDFont font) {
    if (s == null) {
      return "";
    }
    if (font instanceof PDType1Font) {
      return latin1Safe(s);
    }
    return s;
  }

  private static String latin1Safe(String s) {
    StringBuilder sb = new StringBuilder(s.length());
    for (int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      if (c == '\n') {
        sb.append(' ');
      } else if (c <= 0xff) {
        sb.append(c);
      } else {
        sb.append('?');
      }
    }
    return sb.toString();
  }

  private static String clip(String s, int maxChars) {
    if (s.length() <= maxChars) {
      return s;
    }
    return s.substring(0, Math.max(0, maxChars - 3)) + "...";
  }

  private static byte[] decodeStoredLogoBytes(String raw) {
    if (!StringUtils.hasText(raw)) {
      return null;
    }
    String value = raw.trim();
    if (value.startsWith("data:image/") && value.contains(";base64,")) {
      int idx = value.indexOf(";base64,");
      if (idx < 0 || idx + 8 >= value.length()) {
        return null;
      }
      try {
        String payload = value.substring(idx + 8).replaceAll("\\s", "");
        return Base64.getDecoder().decode(payload);
      } catch (IllegalArgumentException ex) {
        return null;
      }
    }
    return null;
  }

  private static boolean containsArabic(String text) {
    if (text == null || text.isEmpty()) {
      return false;
    }
    for (int i = 0; i < text.length(); i++) {
      char c = text.charAt(i);
      if (c >= 0x0600 && c <= 0x06FF) {
        return true;
      }
    }
    return false;
  }

  private static String shapeArabicForPdf(String text) {
    if (!StringUtils.hasText(text) || !containsArabic(text)) {
      return text;
    }
    try {
      String shaped =
          new ArabicShaping(ArabicShaping.LETTERS_SHAPE | ArabicShaping.TEXT_DIRECTION_LOGICAL)
              .shape(text);
      Bidi bidi = new Bidi(shaped, Bidi.RTL);
      return bidi.writeReordered(Bidi.DO_MIRRORING);
    } catch (ArabicShapingException e) {
      return text;
    }
  }

  private static List<String> wrapArabicLines(String text, PDFont font, float fontSize, float maxWidth)
      throws IOException {
    List<String> out = new ArrayList<>();
    if (text == null || text.isEmpty()) {
      out.add("");
      return out;
    }
    StringBuilder line = new StringBuilder();
    for (int i = 0; i < text.length(); i++) {
      String trial = line.toString() + text.charAt(i);
      if (textWidth(trial, font, fontSize) <= maxWidth) {
        line.append(text.charAt(i));
      } else {
        if (!line.isEmpty()) {
          out.add(line.toString());
          line = new StringBuilder().append(text.charAt(i));
        } else {
          out.add(String.valueOf(text.charAt(i)));
          line = new StringBuilder();
        }
      }
    }
    if (!line.isEmpty()) {
      out.add(line.toString());
    }
    if (out.isEmpty()) {
      out.add("");
    }
    return out;
  }

  private static List<String> wrapLines(String text, PDFont font, float fontSize, float maxWidth)
      throws IOException {
    List<String> out = new ArrayList<>();
    if (text == null || text.isEmpty()) {
      out.add("");
      return out;
    }
    String normalized = text.replace('\r', ' ').replace('\n', '\u0001');
    for (String paragraph : normalized.split("\u0001", -1)) {
      if (paragraph.isBlank()) {
        out.add("");
        continue;
      }
      String[] words = paragraph.split("\\s+");
      StringBuilder line = new StringBuilder();
      for (String word : words) {
        String trial = line.isEmpty() ? word : line + " " + word;
        if (textWidth(trial, font, fontSize) <= maxWidth) {
          line = new StringBuilder(trial);
        } else {
          if (!line.isEmpty()) {
            out.add(line.toString());
          }
          if (textWidth(word, font, fontSize) <= maxWidth) {
            line = new StringBuilder(word);
          } else {
            out.add(hardClipWord(word, font, fontSize, maxWidth));
            line = new StringBuilder();
          }
        }
      }
      if (!line.isEmpty()) {
        out.add(line.toString());
      }
    }
    if (out.isEmpty()) {
      out.add("");
    }
    return out;
  }

  private static String hardClipWord(String word, PDFont font, float fontSize, float maxWidth)
      throws IOException {
    if (word.isEmpty()) {
      return "";
    }
    if (textWidth(word, font, fontSize) <= maxWidth) {
      return word;
    }
    String ell = "...";
    float ellW = textWidth(ell, font, fontSize);
    for (int len = word.length(); len >= 1; len--) {
      String sub = word.substring(0, len);
      String out = len < word.length() ? sub + ell : sub;
      if (textWidth(out, font, fontSize) <= maxWidth) {
        return out;
      }
    }
    if (ellW <= maxWidth) {
      return ell;
    }
    return "";
  }

  private static float textWidth(String text, PDFont font, float fontSize) throws IOException {
    try {
      return font.getStringWidth(text) / 1000f * fontSize;
    } catch (IllegalArgumentException e) {
      return Float.POSITIVE_INFINITY;
    }
  }
}
