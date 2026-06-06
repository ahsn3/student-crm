#!/usr/bin/env python3
"""Emit Flyway V18 (idempotent seed) and V19 (replace catalog) for Medipol programs."""
from __future__ import annotations

import pathlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT_V18 = ROOT / "src/main/resources/db/migration/V18__seed_medipol_programs.sql"
OUT_V19 = ROOT / "src/main/resources/db/migration/V19__replace_medipol_programs.sql"

UNI = "Medipol University"

# (name_en, name_ar, language, degree, before_discount, after_discount, cash_price_or_none, years)
# cash_price_or_none: None -> SQL NULL (e.g. some Master rows)
ROWS: list[tuple[str, str | None, str, str, int, int, int | None, int]] = [
    # Page 1 (1–20) — Bachelor
    ("Electrical And Electronic Engineering", "هندسة كهرباء والكترون", "English", "Bachelor", 6000, 5400, 6000, 4),
    ("International Trade And Finance", "التجارة الدولية والمالية", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Economics And Finance", "الاقتصاد والتمويل", "English", "Bachelor", 4500, 4050, 4500, 4),
    ("Medicine", "طب بشري", "English", "Bachelor", 44000, 39600, 17000, 6),
    ("Aviation Management", "إدارة الطيران", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Physiotherapy And Rehabilitation", "العلاج الطبيعي وإعادة التأهيل", "Turkish", "Bachelor", 8500, 7650, 1390, 4),
    ("Journalism", "صحافة", "Turkish", "Bachelor", 4500, 4050, 1390, 4),
    ("Psychology", "علم النفس", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Artificial Intelligence Engineering", "هندسة الذكاء الاصطناعي", "English", "Bachelor", 10000, 9000, 10000, 4),
    ("Media And Visual Arts", "الاعلام و الفنون المرئية", "Turkish", "Bachelor", 4500, 4050, 1390, 4),
    ("Logistics Management", "إدارة اللوجستية", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Speech And Language Therapy", "علاج النطق واللغة", "English", "Bachelor", 4750, 4275, 4750, 4),
    # Page 2 — Bachelor
    ("Dentistry", "طب الأسنان", "English", "Bachelor", 36000, 32400, 17000, 5),
    ("Dentistry", "طب الأسنان", "Turkish", "Bachelor", 33000, 29700, 1390, 5),
    ("Health Management", "الإدارة الصحية", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Speech And Language Therapy", "علاج النطق واللغة", "Turkish", "Bachelor", 4500, 4050, 1390, 4),
    ("Preschool Education", "التعليم ما قبل الابتدائي", "Turkish", "Bachelor", 5500, 4950, 1390, 4),
    ("Turkish Music Art", "فن الموسيقى التركية", "Turkish", "Bachelor", 5000, 4500, 1390, 4),
    ("Public Relations And Advertising", "العلاقات العامة والدعاية والإعلان", "English", "Bachelor", 4500, 4050, 4500, 4),
    ("History", "التاريخ", "English", "Bachelor", 6500, 5850, 6500, 4),
    ("Political Science And International Relations", "العلوم السياسية والعلاقات الدولية", "English", "Bachelor", 5500, 4950, 5500, 4),
    ("Primary Mathematics Teaching", "تدريس الرياضيات الابتدائية", "Turkish", "Bachelor", 5500, 4950, 1390, 4),
    ("Interior Architecture And Environmental Design", "العمارة الداخلية والتصميم البيئي", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Social Services", "الخدمة الاجتماعية", "Turkish", "Bachelor", 4500, 4050, 1390, 4),
    ("International Trade And Finance", "التجارة الدولية والمالية", "English", "Bachelor", 4500, 4050, 4500, 4),
    # Page 3 — Bachelor
    ("New Media And Communication", "الإعلام والاتصال الجديد", "Turkish", "Bachelor", 5500, 4950, 1390, 4),
    ("Child Development", "تنمية الطفل", "Turkish", "Bachelor", 6000, 5400, 1390, 4),
    ("English Language Teaching", "تدريس اللغة الإنجليزية", "English", "Bachelor", 5500, 4950, 5500, 4),
    ("Business Administration", "إدارة الأعمال", "English", "Bachelor", 5500, 4950, 5500, 4),
    ("Urban Design And Landscape Architecture", "التصميم الحضري وهندسة المناظر الطبيعية", "Turkish", "Bachelor", 4500, 4050, 1390, 4),
    ("Nursing", "التمريض", "Turkish", "Bachelor", 8750, 7875, 1390, 4),
    ("Banking And Insurance", "المصارف والتأمين", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Ergotherapy", "العلاج الوظيفي", "Turkish", "Bachelor", 4500, 4050, 1390, 4),
    ("Psychology", "علم النفس", "English", "Bachelor", 5500, 4950, 5500, 4),
    ("Psychological Counseling And Guidance", "الإرشاد النفسي والتوجيه", "English", "Bachelor", 4500, 4050, 4500, 4),
    ("Psychological Counseling And Guidance", "الإرشاد النفسي والتوجيه", "Turkish", "Bachelor", 5500, 4950, 1390, 4),
    ("Political Science And Public Administration", "العلوم السياسية والإدارة العامة", "English", "Bachelor", 5500, 4950, 5500, 4),
    # Additional Bachelor (INGAZGATE / mixed pages)
    ("Pharmacy", "الصيدلة", "English", "Bachelor", 18000, 18000, 16200, 5),
    ("Human Resources Management", "إدارة الموارد البشرية", "Turkish", "Bachelor", 5500, 5500, 4950, 4),
    ("Nutrition And Dietetics", "التغذية والحمية", "Turkish", "Bachelor", 4500, 4500, 4050, 4),
    ("Law", "الحقوق", "Turkish", "Bachelor", 8000, 8000, 7200, 4),
    ("Gastronomy And Culinary Arts", "فنون الطهي والطبخ", "Turkish", "Bachelor", 6000, 6000, 5400, 4),
    ("Aviation Management", "إدارة الطيران", "English", "Bachelor", 4500, 4500, 4050, 4),
    ("Physiotherapy And Rehabilitation", "العلاج الطبيعي وإعادة التأهيل", "English", "Bachelor", 9000, 9000, 8100, 4),
    ("Biomedical Engineering", "الهندسة الطبية الحيوية", "English", "Bachelor", 6500, 6500, 5850, 4),
    ("Audiology", "علم السمع", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Architecture", "هندسة معمارية", "Turkish", "Bachelor", 6500, 5850, 1390, 4),
    ("Architecture", "هندسة معمارية", "English", "Bachelor", 5500, 4950, 5500, 4),
    ("Orthotics And Prosthetics", "الأطراف الصناعية والأجهزة التقويمية", "Turkish", "Bachelor", 5000, 5000, 4500, 4),
    ("Midwifery", "القبالة", "Turkish", "Bachelor", 8000, 8000, 7200, 4),
    ("Pharmacy", "الصيدلة", "Turkish", "Bachelor", 15000, 15000, 13500, 5),
    ("Public Relations And Advertising", "العلاقات العامة والدعاية والإعلان", "Turkish", "Bachelor", 5500, 5500, 4950, 4),
    ("Civil Engineering", "الهندسة المدنية", "Turkish", "Bachelor", 7000, 7000, 6300, 4),
    ("Health Management", "الإدارة الصحية", "English", "Bachelor", 4500, 4500, 4050, 4),
    ("Industrial Design", "التصميم الصناعي", "Turkish", "Bachelor", 5000, 5000, 4500, 4),
    ("Interior Architecture And Environmental Design", "العمارة الداخلية والتصميم البيئي", "English", "Bachelor", 5000, 5000, 4500, 4),
    ("Gastronomy And Culinary Arts", "فنون الطهي والطبخ", "English", "Bachelor", 4750, 4750, 4275, 4),
    ("Management Information Systems", "نظم معلومات الإدارة", "Turkish", "Bachelor", 6500, 6500, 5850, 4),
    ("Civil Engineering", "الهندسة المدنية", "English", "Bachelor", 5000, 5000, 4500, 4),
    ("Nursing", "التمريض", "English", "Bachelor", 6000, 6000, 5400, 4),
    ("Logistics Management", "إدارة اللوجستية", "English", "Bachelor", 4500, 4500, 4050, 4),
    ("Political Science And Public Administration", "العلوم السياسية والإدارة العامة", "Turkish", "Bachelor", 6000, 6000, 5400, 4),
    ("Computer Engineering", "هندسة الحاسوب", "English", "Bachelor", 6500, 6500, 5850, 4),
    ("Management Information Systems", "نظم معلومات الإدارة", "English", "Bachelor", 4500, 4500, 4050, 4),
    ("Special Education Teaching", "تربية خاصة", "Turkish", "Bachelor", 5500, 5500, 4950, 4),
    ("Visual Communication Design", "تصميم الاتصال البصري", "Turkish", "Bachelor", 4500, 4500, 4050, 4),
    ("Industrial Engineering", "الهندسة الصناعية", "English", "Bachelor", 4750, 4750, 4275, 4),
    ("Radio Television And Film", "الإذاعة والتلفزيون والسينما", "Turkish", "Bachelor", 5500, 5500, 4950, 4),
    ("Medicine", "طب بشري", "Turkish", "Bachelor", 34000, 34000, 30600, 4),
    # Master
    ("Business Administration", "إدارة الأعمال", "English", "Master", 4500, 4500, None, 1),
    ("Business Administration With Thesis", "إدارة الأعمال مع أطروحة", "English", "Master", 5000, 5000, None, 2),
    # Diploma (2 years) — Turkish / English variants
    ("Anesthesia", "تخدير", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Physiotherapy", "العلاج الطبيعي", "English", "Diploma", 3500, 3150, 3500, 2),
    ("Computer Programming", "برمجة الكمبيوتر", "Turkish", "Diploma", 3500, 3150, 1390, 2),
    ("Biomedical Device Technologies", "تقنيات الأجهزة الطبية الحيوية", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Anesthesia", "تخدير", "English", "Diploma", 3500, 3150, 3500, 2),
    ("Radio And Television Programming", "برمجة الإذاعة والتلفزيون", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Dental Prosthesis", "تعويضات سنية", "English", "Diploma", 4500, 4050, 4500, 2),
    ("Medical Documentation And Secretarial", "التوثيق الطبي والسكرتارية", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Radiotherapy", "العلاج الإشعاعي", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("First And Emergency Aid", "إسعافات أولية", "English", "Diploma", 3500, 3150, 3500, 2),
    ("Business Administration", "إدارة الأعمال", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Cyber Security", "الأمن السيبراني", "English", "Diploma", 3500, 3150, 3500, 2),
    ("Medical Imaging Techniques", "تقنيات التصوير الطبي", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Back-End Software Development", "تطوير برمجيات الخلفية", "English", "Diploma", 3500, 3150, 3500, 2),
    ("Management Of Health Institutions", "إدارة المؤسسات الصحية", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Justice", "عدالة", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Civil Aviation Cabin Services", "خدمات مقصورة الطيران المدني", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Child Development", "تنمية الطفل", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Civil Aviation Transportation Management", "إدارة النقل الجوي المدني", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Pharmacy Services", "خدمات الصيدلة", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Banking And Insurance", "المصارف والتأمين", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Foreign Trade", "تجارة خارجية", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Pathology Laboratory Techniques", "تقنيات مختبر علم الأمراض", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Applied English And Translation", "الإنجليزية التطبيقية والترجمة", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Audiometry", "قياس السمع", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Public Relations And Publicity", "العلاقات العامة والإعلان", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Physiotherapy", "العلاج الطبيعي", "Turkish", "Diploma", 3500, 3500, 3150, 2),
    ("Operating Room Services", "خدمات غرفة العمليات", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Social Services", "الخدمة الاجتماعية", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Robotics And Artificial Intelligence", "الروبوتات والذكاء الاصطناعي", "English", "Diploma", 3500, 3500, 3150, 2),
    ("Accounting And Tax Applications", "تطبيقات المحاسبة والضرائب", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Computer Programming", "برمجة الكمبيوتر", "English", "Diploma", 3500, 3500, 3150, 2),
    ("Logistics", "اللوجستيات", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Occupational Health And Safety", "الصحة والسلامة المهنية", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Human Resources Management", "إدارة الموارد البشرية", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Dialysis", "غسيل الكلى", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Opticianry", "البصريات", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Interior Design", "التصميم الداخلي", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Medical Laboratory Techniques", "تقنيات المختبر الطبي", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Finance", "التمويل", "Turkish", "Diploma", 3250, 3250, 2925, 2),
    ("Architectural Restoration", "الترميم المعماري", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Oral And Dental Health", "صحة الفم والأسنان", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("First And Emergency Aid", "إسعافات أولية", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Electroneurophysiology", "الفسيولوجيا الكهربائية العصبية", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Construction Technology", "تكنولوجيا البناء", "Turkish", "Diploma", 3250, 2925, 1390, 2),
    ("Dental Prosthesis", "تعويضات سنية", "Turkish", "Diploma", 3500, 3150, 1390, 2),
    ("Sports Management", "إدارة الرياضة", "Turkish", "Diploma", 3250, 2925, 1390, 2),
]


def esc(s: str) -> str:
    return s.replace("'", "''")


def insert_sql(with_not_exists: bool) -> str:
    parts: list[str] = []
    uni_sql = esc(UNI)
    for name, name_ar, lang, degree, before, cost, cash, years in ROWS:
        name_sql = esc(name)
        deg_sql = esc(degree)
        lang_sql = esc(lang)
        ar_sql = "NULL" if not name_ar else f"'{esc(name_ar)}'"
        cash_sql = "NULL" if cash is None else str(int(cash))
        not_exists_clause = ""
        if with_not_exists:
            not_exists_clause = f"""
  AND NOT EXISTS (
    SELECT 1 FROM program p
    WHERE p.university_id = u.id
      AND p.name = '{name_sql}'
      AND COALESCE(p.degree, '') = '{deg_sql}'
      AND COALESCE(p.language, '') = '{lang_sql}'
  )"""
        sql = f"""INSERT INTO program (id, university_id, name, degree, language, cost, years, created_at, available, name_ar, before_discount, cash_price, updated_at)
SELECT gen_random_uuid(), u.id,
  '{name_sql}',
  '{deg_sql}',
  '{lang_sql}',
  {cost},
  {years},
  now(),
  true,
  {ar_sql},
  {before},
  {cash_sql},
  '2026-05-04T12:00:00Z'::timestamptz
FROM university u
WHERE u.name = '{uni_sql}'{not_exists_clause};
"""
        parts.append(sql)
    return "\n".join(parts) + "\n"


def main() -> None:
    v18 = (
        "-- Medipol University programs (Turkey). Idempotent per university + name + degree + language.\n"
        + insert_sql(with_not_exists=True)
    )
    OUT_V18.write_text(v18, encoding="utf-8")
    print(f"Wrote {OUT_V18} ({len(ROWS)} programs)")

    v19_header = (
        "-- Replace Medipol University program catalog (clears old/test rows for that university).\n"
        + "-- application.program_id references program(id) ON DELETE SET NULL.\n"
        + "DELETE FROM program p\n"
        + "USING university u\n"
        + f"WHERE p.university_id = u.id AND u.name = '{esc(UNI)}';\n\n"
    )
    OUT_V19.write_text(v19_header + insert_sql(with_not_exists=False), encoding="utf-8")
    print(f"Wrote {OUT_V19} ({len(ROWS)} programs)")


if __name__ == "__main__":
    main()
