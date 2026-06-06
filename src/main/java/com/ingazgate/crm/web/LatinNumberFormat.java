package com.ingazgate.crm.web;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import org.springframework.stereotype.Component;

/** Western (0–9) numerals regardless of UI locale. */
@Component("numFmt")
public class LatinNumberFormat {

  private static final Locale LOCALE = Locale.ENGLISH;

  public String decimal(Number value, int fractionDigits) {
    if (value == null) {
      return "";
    }
    DecimalFormat df = (DecimalFormat) NumberFormat.getNumberInstance(LOCALE);
    df.setGroupingUsed(true);
    df.setMinimumFractionDigits(0);
    df.setMaximumFractionDigits(Math.max(0, fractionDigits));
    return df.format(value);
  }

  public String integer(Number value) {
    return decimal(value, 0);
  }
}
