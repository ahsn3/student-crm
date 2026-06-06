#!/usr/bin/env python3
"""Build Arabic name lookup for THK, Lefke, and FSM programs."""
from __future__ import annotations

import json
from pathlib import Path

OUT = Path(__file__).resolve().parent / "thk_lefke_fsm_arabic.json"

# English program name -> Arabic (from agentportal screenshots)
NAME_AR: dict[str, str] = {
    "logistics management": "إدارة اللوجستية",
    "flight training": "التدريب على الطيران",
    "electrical and electronic engineering": "هندسة كهرباء والكترون",
    "aircraft electronics": "إلكترونيات الطائرات",
    "civil aviation and cabin services": "الطيران المدني وخدمات المقصورة",
    "air logistics": "اللوجستيات الجوية",
    "civil air transportation management": "إدارة النقل الجوي المدني",
    "management information systems": "نظم المعلومات الادارية",
    "industrial engineering": "هندسة صناعية",
    "management": "الإدارة",
    "aviation management": "إدارة الطيران",
    "computer engineering": "هندسة كمبيوتر",
    "astronautical engineering": "هندسة الملاحة الفضائية",
    "aerospace engineering": "هندسة الطيران",
    "software engineering": "هندسة البرمجيات",
    "mechanical engineering": "هندسة ميكانيك",
    "business management with thesis": "إدارة الأعمال مع أطروحة",
    "aerospace engineering with thesis": "هندسة الطيران مع أطروحة",
    "electrical and computer engineering with thesis": "الهندسة الكهربائية والحاسوبية مع أطروحة",
    "mechanical and aeronautical engineering with thesis": "هندسة الميكانيكا والطيران مع أطروحة",
    "aviation management with thesis": "إدارة الطيران مع أطروحة",
    "unmanned and autonomous systems engineering with thesis": "هندسة الأنظمة غير المأهولة والمستقلة مع أطروحة",
    "agricultural management": "الإدارة الزراعية",
    "architecture": "هندسة معمارية",
    "banking and finance": "بنوك وتمويل",
    "business administration": "إدارة الأعمال",
    "clinical pharmacy": "الصيدلة السريرية",
    "computer information systems": "أنظمة المعلومات الحاسوبية",
    "digital game design": "تصميم الألعاب الرقمية",
    "economics": "الاقتصاد",
    "english language teaching": "تدريس اللغة الانجليزية",
    "environmental engineering": "هندسة بيئية",
    "gastronomy and culinary arts": "فنون الطهي والمطبخ",
    "industrial product design": "تصميم المنتجات الصناعية",
    "information system and technologies": "نظم وتقنيات المعلومات",
    "interior architecture and environmental design": "العمارة الداخلية والتصميم البيئي",
    "international law": "القانون الدولي",
    "journalism": "صحافة",
    "marketing": "تسويق",
    "media and communications": "الاعلام والاتصالات",
    "molecular biology and genetics": "البيولوجيا الجزيئية وعلم الوراثة",
    "new media and communication": "الإعلام الجديد والاتصالات",
    "nursing": "تمريض",
    "nutrition and dietetics": "التغذية والحمية",
    "pharmacy": "الصيدلة",
    "physiotherapy and rehabilitation": "العلاج الطبيعي وإعادة التأهيل",
    "political science and public administration": "العلوم السياسية والإدارة العامة",
    "psychology": "علم النفس",
    "public relations and advertising": "العلاقات العامة والدعاية والاعلان",
    "tourism management": "إدارة السياحة",
    "visual communication design": "تصميم الاتصالات البصرية",
    "horticulture": "البستنة",
    "international logistics transportation": "النقل اللوجستي الدولي",
    "human resources management": "إدارة الموارد البشرية",
    "electronics and communication engineering": "هندسة الالكترونيات والاتصالات",
    "oral and dental health": "صحة الفم والأسنان",
    "agricultural machinery": "الآلات الزراعية",
    "agricultural technology": "التكنولوجيا الزراعية",
    "alternative energy and sources technology": "تكنولوجيا الطاقة البديلة والمصادر",
    "architectural restoration": "الترميم المعماري",
    "banking and insurance": "الخدمات المصرفية والتأمين",
    "computer aided design and animation": "التصميم بمساعدة الكمبيوتر والرسوم المتحركة",
    "computer programming": "برمجة الكمبيوتر",
    "construction technology": "تكنولوجيا البناء",
    "digital media and marketing": "الوسائط الرقمية والتسويق",
    "environmental protection and control": "حماية البيئة والتحكم فيها",
    "information security technologies": "تقنيات أمن المعلومات",
    "interior design": "تصميم داخلي",
    "tourism and hotel management": "إدارة السياحة والفنادق",
    "pharmaceutical sciences": "العلوم الصيدلانية",
    "health management": "الإدارة الصحية",
    "pedodontics": "طب أسنان الأطفال",
    "orthodontics": "تقويم الأسنان",
    "environmental sciences": "العلوم البيئية",
    "horticultural production": "الإنتاج البستاني",
    "civil engineering": "الهندسة المدنية",
    "communication studies": "دراسات الاتصال",
    "international relations": "علاقات دولية",
    "restorative dentistry": "طب الأسنان الترميمي",
    "prosthetic dentistry": "طب الأسنان الاصطناعي",
    "oral maxillofacial surgery": "جراحة الفم والوجه والفكين",
    "electrical and electronic engineering with thesis": "الهندسة الكهربائية والإلكترونية",
    "horticultural production with thesis": "الإنتاج البستاني مع أطروحة",
    "economics with thesis": "الاقتصاد مع أطروحة",
    "digital media marketing with thesis": "التسويق عبر الوسائط الرقمية مع أطروحة",
    "marketing management with thesis": "إدارة التسويق مع أطروحة",
    "psychology with thesis": "علم نفس مع أطروحة",
    "islamic sciences": "العلوم الإسلامية",
    "basic islamic sciences": "العلوم الإسلامية الأساسية",
    "traditional turkish arts": "الفنون التركية التقليدية",
    "turkish language and literature": "اللغة والأدب التركي",
    "history of islamic science": "تاريخ العلوم الإسلامية",
    "clinical psychology": "علم النفس السريري",
    "preschool education": "التعليم ما قبل المدرسي",
    "history": "التاريخ",
    "educational administration": "الإدارة التربوية",
    "psychological counselling and guidance": "الإرشاد والتوجيه النفسي",
    "interior architecture": "عمارة داخلية",
    "graphic design": "تصميم جرافيك",
    "arabic language teaching": "تدريس اللغة العربية",
    "law": "حقوق",
    "english translation and interpretation": "الترجمة التحريرية ( تركي - إنجليزي )",
    "conservation and restoration of cultural assets": "حفظ وترميم الأصول الثقافية",
    "political science and international relations": "العلوم السياسية والعلاقات الدولية",
    "special education": "التربية الخاصة",
    "turkish language teaching": "تدريس اللغة التركية",
    "civil engineering with thesis": "الهندسة المدنية مع أطروحة",
    "public law with thesis": "قانون عام مع أطروحة",
    "basic islamic sciences with thesis": "العلوم الإسلامية الأساسية مع أطروحة",
    "artificial intelligence and data science": "الذكاء الاصطناعي وعلوم البيانات",
    "artificial intelligence and data science with thesis": "الذكاء الاصطناعي وعلوم البيانات مع أطروحة",
    "preservation and management of cultural heritage with thesis": "الحفاظ على التراث الثقافي وإدارته مع أطروحة",
    "private law with thesis": "القانون الخاص مع أطروحة",
    "international relations with thesis": "علاقات دولية مع أطروحة",
    "business administration with thesis": "إدارة الأعمال مع أطروحة",
    "nutrition and dietetics with thesis": "التغذية وعلم التغذية مع أطروحة",
    "public relations and advertising with thesis": "العلاقات العامة والإعلان مع أطروحة",
    "new media and journalism": "الإعلام الجديد والصحافة",
    "international business commerce": "التجارة الدولية",
    "data science with thesis": "علوم البيانات مع أطروحة",
    "plant sciences and technologies with thesis": "علوم النبات والتقنيات مع أطروحة",
    "public administration with thesis": "الإدارة العامة مع أطروحة",
    "historical sciences": "العلوم التاريخية",
    "child development (evening class)": "تنمية الطفل (فصل مسائي)",
    "civil aviation cabin services": "خدمات مقصورة الطيران المدني",
    "court and office management": "إدارة المحاكم والمكاتب",
    "packaging design program": "برنامج تصميم التعبئة والتغليف",
    "shadow teaching for disabled individuals": "التعليم الظل للأفراد ذوي الإعاقة",
    "arabic language and education with thesis": "اللغة العربية والتعليم مع أطروحة",
    "teaching turkish to foreigners with thesis": "تدريس اللغة التركية للأجانب مع أطروحة",
    "pre-school education with thesis": "التعليم ما قبل المدرسي مع أطروحة",
    "history of science with thesis": "تاريخ العلوم مع أطروحة",
    "history with thesis": "التاريخ مع أطروحة",
    "interior architecture and environmental design": "العمارة الداخلية والتصميم البيئي",
    "conservation and restoration of cultural assets": "حفظ وترميم الأصول الثقافية",
    "architectural conservation restoration with thesis": "الحفاظ المعماري والترميم مع أطروحة",
    "political science and international relations w": "العلوم السياسية والعلاقات الدولية مع أطروحة",
    "preservation and management of cultural heritage with thesis": "الحفاظ على التراث الثقافي وإدارته مع أطروحة",
    "psychological counselling and guidance with thesis": "الاستشارة والتوجيه النفسي مع أطروحة",
    "electrical and computer engineering with thesis": "الهندسة الكهربائية والحاسوبية مع أطروحة",
    "mechanical and aeronautical engineering with thesis": "هندسة الميكانيكا والطيران مع أطروحة",
    "unmanned and autonomous systems enginee": "هندسة الأنظمة غير المأهولة والمستقلة مع أطروحة",
}


def lookup(name: str) -> str | None:
    key = name.lower().strip()
    if key in NAME_AR:
        return NAME_AR[key]
    if key.endswith(" with thesis"):
        base = key.replace(" with thesis", "")
        if base in NAME_AR:
            return NAME_AR[base] + " مع أطروحة"
    if key.endswith(" with the"):
        base = key.replace(" with the", "").replace(" with", "")
        if base in NAME_AR:
            return NAME_AR[base] + " مع أطروحة"
    return None


def main() -> None:
    clean = Path(__file__).resolve().parent / "thk_lefke_fsm_programs_clean.json"
    supp = Path(__file__).resolve().parent / "thk_lefke_fsm_supplement.json"
    rows = json.loads(clean.read_text(encoding="utf-8"))
    if supp.exists():
        rows.extend(json.loads(supp.read_text(encoding="utf-8")))

    out = []
    seen = set()
    for r in rows:
        ar = r.get("name_ar") or lookup(r["name"])
        if not ar:
            continue
        key = (r["university"], r["name"].lower(), r["degree"], r["language"])
        if key in seen:
            continue
        seen.add(key)
        out.append(
            {
                "university": r["university"],
                "name": r["name"],
                "degree": r["degree"],
                "language": r["language"],
                "name_ar": ar,
            }
        )

    OUT.write_text(json.dumps(out, ensure_ascii=False, indent=2), encoding="utf-8")
    print("wrote", len(out), "arabic entries")


if __name__ == "__main__":
    main()
