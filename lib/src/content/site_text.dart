enum SiteLanguage { english, hebrew }

class SiteText {
  const SiteText({
    required this.language,
    required this.languageToggleLabel,
    required this.navHome,
    required this.navAbout,
    required this.navServices,
    required this.navWhyUs,
    required this.navContact,
    required this.openNavigation,
    required this.heroEyebrow,
    required this.heroTitle,
    required this.heroSubtitle,
    required this.heroCta,
    required this.aboutEyebrow,
    required this.aboutParagraphs,
    required this.servicesTitle,
    required this.services,
    required this.whyUsTitle,
    required this.whyUsItems,
    required this.contactEyebrow,
    required this.contactTitle,
    required this.contactDescription,
    required this.nameLabel,
    required this.businessLabel,
    required this.emailLabel,
    required this.messageLabel,
    required this.sendInquiry,
    required this.sending,
    required this.successMessage,
    required this.failureMessage,
    required this.requiredField,
    required this.emailRequired,
    required this.emailInvalid,
    required this.messageRequired,
    required this.messageTooShort,
    required this.footerText,
  });

  final SiteLanguage language;
  final String languageToggleLabel;
  final String navHome;
  final String navAbout;
  final String navServices;
  final String navWhyUs;
  final String navContact;
  final String openNavigation;
  final String heroEyebrow;
  final String heroTitle;
  final String heroSubtitle;
  final String heroCta;
  final String aboutEyebrow;
  final List<String> aboutParagraphs;
  final String servicesTitle;
  final List<FeatureText> services;
  final String whyUsTitle;
  final List<FeatureText> whyUsItems;
  final String contactEyebrow;
  final String contactTitle;
  final String contactDescription;
  final String nameLabel;
  final String businessLabel;
  final String emailLabel;
  final String messageLabel;
  final String sendInquiry;
  final String sending;
  final String successMessage;
  final String failureMessage;
  final String requiredField;
  final String emailRequired;
  final String emailInvalid;
  final String messageRequired;
  final String messageTooShort;
  final String footerText;

  bool get isHebrew => language == SiteLanguage.hebrew;
}

class FeatureText {
  const FeatureText({required this.title, required this.description});

  final String title;
  final String description;
}

const siteTextByLanguage = {
  SiteLanguage.english: SiteText(
    language: SiteLanguage.english,
    languageToggleLabel: 'HE',
    navHome: 'Home',
    navAbout: 'About',
    navServices: 'Services',
    navWhyUs: 'Why Us',
    navContact: 'Contact',
    openNavigation: 'Open navigation',
    heroEyebrow: 'Construction Talent Scouting',
    heroTitle:
        'ProForce Finder: Precision Talent Scouting for Global Construction',
    heroSubtitle:
        'Connecting international construction firms with experienced and vetted professionals.',
    heroCta: 'Contact Us',
    aboutEyebrow: 'ABOUT US',
    aboutParagraphs: [
      'ProForce Finder specializes in recruitment for large-scale international construction projects.',
      'We focus on identifying and preparing professional teams for complex global projects.',
      'Our goal is to ensure every worker is technically skilled, culturally prepared, and logistically ready for success abroad.',
    ],
    servicesTitle: 'Our Services',
    services: [
      FeatureText(
        title: 'Custom Workforce Recruitment & On-Site Evaluation',
        description:
            "We identify and recruit construction professionals based on each client's specific needs. Our team conducts on-site evaluations in Portugal to ensure every candidate meets our professional standards before placement.",
      ),
      FeatureText(
        title: 'Comprehensive Pre-Deployment Preparation',
        description:
            'We provide selected workers with full pre-deployment training, including workplace safety instruction, safety procedures, workplace culture orientation, and preparation for certification exams such as the Dutch VCA qualification.',
      ),
      FeatureText(
        title: 'Bureaucratic Pre-Screening',
        description:
            'We manage the bureaucratic preparation process, including document verification, work permits, and medical clearances.',
      ),
    ],
    whyUsTitle: 'Why Choose Us?',
    whyUsItems: [
      FeatureText(
        title: 'Proven Urban Construction Expertise',
        description:
            'We bring extensive experience in urban construction, with proven involvement in advanced building projects in major cities such as Tel Aviv, including work on high-rise developments.',
      ),
      FeatureText(
        title: 'Maximum Efficiency & Peace of Mind',
        description:
            'We provide a complete end-to-end solution, allowing clients to focus on their operations while we handle the recruitment process, documentation, and administrative coordination.',
      ),
    ],
    contactEyebrow: 'Contact',
    contactTitle: "Let's Build Your Next Team",
    contactDescription:
        "Tell us what kind of team you need, and we'll help you find the right professionals.",
    nameLabel: 'Name',
    businessLabel: 'Business / Organization',
    emailLabel: 'Email Address',
    messageLabel: 'Message',
    sendInquiry: 'Send Inquiry',
    sending: 'Sending...',
    successMessage: 'Thank you. Your inquiry has been sent successfully.',
    failureMessage: 'Something went wrong. Please try again.',
    requiredField: 'This field is required.',
    emailRequired: 'Email address is required.',
    emailInvalid: 'Enter a valid email address.',
    messageRequired: 'Message is required.',
    messageTooShort: 'Please add a little more detail.',
    footerText: 'ProForce Finder - Construction staffing for global projects',
  ),
  SiteLanguage.hebrew: SiteText(
    language: SiteLanguage.hebrew,
    languageToggleLabel: 'EN',
    navHome: 'בית',
    navAbout: 'אודות',
    navServices: 'שירותים',
    navWhyUs: 'למה אנחנו',
    navContact: 'צור קשר',
    openNavigation: 'פתח ניווט',
    heroEyebrow: 'איתור כישרונות לענף הבנייה',
    heroTitle: 'ProForce Finder: איתור מדויק של כוח אדם לבנייה גלובלית',
    heroSubtitle:
        'מחברים חברות בנייה בינלאומיות עם אנשי מקצוע מנוסים, בדוקים ומוכנים לעבודה.',
    heroCta: 'צור קשר',
    aboutEyebrow: 'אודותינו',
    aboutParagraphs: [
      'ProForce Finder מתמחה בגיוס כוח אדם לפרויקטי בנייה בינלאומיים רחבי היקף.',
      'אנחנו מתמקדים באיתור ובהכנה של צוותים מקצועיים לפרויקטים גלובליים מורכבים.',
      'המטרה שלנו היא לוודא שכל עובד מגיע עם יכולת טכנית, מוכנות תרבותית והיערכות לוגיסטית להצלחה בחו"ל.',
    ],
    servicesTitle: 'השירותים שלנו',
    services: [
      FeatureText(
        title: 'גיוס כוח אדם מותאם והערכה בשטח',
        description:
            'אנחנו מאתרים ומגייסים אנשי מקצוע לענף הבנייה בהתאם לצרכים המדויקים של כל לקוח. הצוות שלנו מבצע הערכות בשטח בפורטוגל כדי לוודא שכל מועמד עומד בסטנדרטים המקצועיים שלנו לפני השמה.',
      ),
      FeatureText(
        title: 'הכנה מקיפה לפני יציאה לפרויקט',
        description:
            'אנחנו מספקים לעובדים שנבחרו הכשרה מלאה לפני יציאה לפרויקט, כולל הדרכות בטיחות, נהלי עבודה, היכרות עם תרבות העבודה והכנה למבחני הסמכה כגון VCA ההולנדי.',
      ),
      FeatureText(
        title: 'סינון בירוקרטי מקדים',
        description:
            'אנחנו מנהלים את תהליך ההכנה הבירוקרטית, כולל אימות מסמכים, אישורי עבודה ואישורים רפואיים.',
      ),
    ],
    whyUsTitle: 'למה לבחור בנו?',
    whyUsItems: [
      FeatureText(
        title: 'ניסיון מוכח בבנייה עירונית',
        description:
            'אנחנו מביאים ניסיון רחב בבנייה עירונית, כולל מעורבות מוכחת בפרויקטי בנייה מתקדמים בערים מרכזיות כמו תל אביב ועבודה במיזמי מגדלים.',
      ),
      FeatureText(
        title: 'יעילות מקסימלית ושקט תפעולי',
        description:
            'אנחנו מספקים פתרון מלא מקצה לקצה, שמאפשר ללקוחות להתמקד בפעילות שלהם בזמן שאנחנו מטפלים בגיוס, במסמכים ובתיאום האדמיניסטרטיבי.',
      ),
    ],
    contactEyebrow: 'צור קשר',
    contactTitle: 'בואו נבנה את הצוות הבא שלכם',
    contactDescription:
        'ספרו לנו איזה צוות אתם צריכים, ואנחנו נעזור לכם למצוא את אנשי המקצוע המתאימים.',
    nameLabel: 'שם',
    businessLabel: 'עסק / ארגון',
    emailLabel: 'כתובת אימייל',
    messageLabel: 'הודעה',
    sendInquiry: 'שליחת פנייה',
    sending: 'שולח...',
    successMessage: 'תודה. הפנייה שלך נשלחה בהצלחה.',
    failureMessage: 'משהו השתבש. נסו שוב.',
    requiredField: 'זהו שדה חובה.',
    emailRequired: 'כתובת אימייל היא שדה חובה.',
    emailInvalid: 'יש להזין כתובת אימייל תקינה.',
    messageRequired: 'הודעה היא שדה חובה.',
    messageTooShort: 'נא להוסיף עוד מעט פרטים.',
    footerText: 'ProForce Finder - גיוס כוח אדם לבנייה בפרויקטים גלובליים',
  ),
};
