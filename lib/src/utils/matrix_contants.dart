class MatrixConstants {
  static bool isValidPhoneNumber(String phoneNumber) {
    // Define the acceptable length range
    const int minLength = 7; // Minimum number of digits
    const int maxLength = 15; // Maximum number of digits

    // Define the regex pattern for valid phone numbers
    final RegExp phoneRegex =
        RegExp(r'^(?:\+|[(][0-9]{1,3}[)]|[0-9])?(?:[ ()\-\.\+/]*[0-9]){7,15}$');

    // Define the regex pattern for dates
    final RegExp dateRegex = RegExp(r'\b\d{1,2}/\d{1,2}/\d{2,4}\b');

    // Check if the phone number matches the phone regex
    if (!phoneRegex.hasMatch(phoneNumber)) {
      return false; // Invalid format
    }

    // Check if the phone number contains a date pattern
    if (dateRegex.hasMatch(phoneNumber)) {
      return false; // Contains a date pattern
    }

    // Remove all non-digit characters to count digits
    final String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check the length of the digits
    if (digitsOnly.length < minLength || digitsOnly.length > maxLength) {
      return false; // Invalid length
    }

    return true; // Valid phone number
  }

  /// accepted punctuation within a phone number
  static const String _punctuation = r' ()\[\]\-\.\/\\';
  static const String _plus = r'+＋';

  /// Westhen and easthern arabic numerals
  static const String _digits = r'0-9０-９٠-٩۰-۹';

  /// Regex to find possible phone number candidates in a string.
  ///
  /// This regex tries to match all phone numbers. It doesn't match special
  /// numbers like the 100.
  ///
  /// The regex must start by either a + or a digit, then be followed by at least 6 digits.
  /// The digits are formed of westhern and easthern numerals.
  /// There can also be punctuation between the digts.
  /// Regex to find possible phone number candidates in a string.
  /// This regex tries to match all phone numbers.
  static const String phoneRegExp = r'\(?[' +
      _plus +
      _digits +
      r'](?:[' +
      _punctuation +
      r']{0,3}[' +
      _digits +
      r']){7,15}';

  static String urlRegExp = r'((?:' +
      kAllSchemes.join('|') +
      r'):\/\/)?(?:www\.)?[a-zA-Z0-9@:%._\+~#=]{2,256}\.(?:' +
      kAllTlds.join('|') +
      r')\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)';

  static const String hashtagRegExp =
      r'#[a-zA-Z\u00C0-\u01B4\w_\u1EA0-\u1EF9!$%^&]{1,}(?=\s|$)';

  static const String userTagRegExp =
      r'@[a-zA-Z\u00C0-\u01B4\w_\u1EA0-\u1EF9!$%^&]{1,}(?=\s|$)';
  static const String emailRegExp =
      r"([a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+)";

// whole regex:
// (?<=\b|(?<=\W)(?=[#!+$@])|^)(?:(?<![#!+$@=])(?:([a-z0-9]+):(?:\/\/(?:[^\s\x{200b}]+(?::[^\s\x{200b}]*)?@)?(?:[a-z\d\x{00a1}-\x{ffff}](?:\.?[a-z\d\x{00a1}-\x{ffff}-])*\.[a-z\x{00a1}-\x{ffff}][a-z\x{00a1}-\x{ffff}-]+|\d{1,3}(?:\.\d{1,3}){3}|\[[\da-f:]{3,}\]|localhost)(?::\d+)?(?:(?=[\/?#])[^\s\x{200b}\(]*(?:\([^\s\x{200b}]*[^\s\x{200b}:;,.!?>\]}]|[^\s\x{200b}\):;,.!?>\]}]))?|(?!\/\/)[^\s\x{200b}\(]+(?:\([^\s\x{200b}]*[^\s\x{200b}:;,.!?>\]}]|[^\s\x{200b}\):;,.!?>\]}]))|(?<!\.)[a-z\d\x{00a1}-\x{ffff}](?:\.?[a-z\d\x{00a1}-\x{ffff}-])*\.(?!http)([a-z\x{00a1}-\x{ffff}][a-z\x{00a1}-\x{ffff}-]+)(?:(?=[\/?#])[^\s\x{200b}\(]*(?:\([^\s\x{200b}]*[^\s\x{200b}:;,.!?>\]}]|[^\s\x{200b}\):;,.!?>\]}]))?|(?:[^\s\x{200b}]+@)[a-z\d\x{00a1}-\x{ffff}](?:\.?[a-z\d\x{00a1}-\x{ffff}-])*\.(?!http)([a-z\x{00a1}-\x{ffff}][a-z\x{00a1}-\x{ffff}-]+))|[#!+$@][^:\s\x{200b}]*:[\w\.\d-]+\.[\w\d-]+)
// Consists of: `startregex(?:urlregex|matrixregex)`
// start regex: (?<=\b|(?<=\W)(?=[#!+$@])|^)
// url regex: (?<![#!+$@=])(?:([a-z0-9]+):(?:\/\/(?:[^\s\x{200b}]+(?::[^\s\x{200b}]*)?@)?(?:[a-z\d\x{00a1}-\x{ffff}](?:\.?[a-z\d\x{00a1}-\x{ffff}-])*\.[a-z\x{00a1}-\x{ffff}][a-z\x{00a1}-\x{ffff}-]+|\d{1,3}(?:\.\d{1,3}){3}|\[[\da-f:]{3,}\]|localhost)(?::\d+)?(?:(?=[\/?#])[^\s\x{200b}\(]*(?:\([^\s\x{200b}]*[^\s\x{200b}:;,.!?>\]}]|[^\s\x{200b}\):;,.!?>\]}]))?|(?!\/\/)[^\s\x{200b}\(]+(?:\([^\s\x{200b}]*[^\s\x{200b}:;,.!?>\]}]|[^\s\x{200b}\):;,.!?>\]}]))|(?<!\.)[a-z\d\x{00a1}-\x{ffff}](?:\.?[a-z\d\x{00a1}-\x{ffff}-])*\.(?!http)([a-z\x{00a1}-\x{ffff}][a-z\x{00a1}-\x{ffff}-]+)(?:(?=[\/?#])[^\s\x{200b}\(]*(?:\([^\s\x{200b}]*[^\s\x{200b}:;,.!?>\]}]|[^\s\x{200b}\):;,.!?>\]}]))?|(?:[^\s\x{200b}]+@)[a-z\d\x{00a1}-\x{ffff}](?:\.?[a-z\d\x{00a1}-\x{ffff}-])*\.(?!http)([a-z\x{00a1}-\x{ffff}][a-z\x{00a1}-\x{ffff}-]+))
// matrix regex: [#!+$@][^:\s\x{200b}]*:[\w\.\d-]+\.[\w\d-]+
// \x{0000} needs to be replaced with \u0000, not done in the comments so that they work with regex101.com
  static const String matrixRegex =
      r'(?<=\b|(?<=\W)(?=[#!+$@])|^)(?:(?<![#!+$@=])(?:([a-z0-9]+):(?:\/\/(?:[^\s\u200b]+(?::[^\s\u200b]*)?@)?(?:[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.[a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+|\d{1,3}(?:\.\d{1,3}){3}|\[[\da-f:]{3,}\]|localhost)(?::\d+)?(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?!\/\/)[^\s\u200b\(]+(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))|(?<!\.)[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+)(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?:[^\s\u200b]+@)[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+))|[#!+$@][^:\s\u200b]*:[\w\.\d-]+\.[\w\d-]+)';

// fallback regex without lookbehinds for incompatible browsers etc.
// it is slightly worse but still gets the job mostly done
  static const String fallbackRegex =
      r'(?:\b|(?=[#!+$@])|^)(?:(?:([a-z0-9]+):(?:\/\/(?:[^\s\u200b]+(?::[^\s\u200b]*)?@)?(?:[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.[a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+|\d{1,3}(?:\.\d{1,3}){3}|\[[\da-f:]{3,}\]|localhost)(?::\d+)?(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?!\/\/)[^\s\u200b\(]+(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))|[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+)(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?:[^\s\u200b]+@)[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+))|[#!+$@][^:\s\u200b]*:[\w\.\d-]+\.[\w\d-]+)';

  static const String estimateRegex = r'[^\s\u200b][\.:][^\s\u200b]';

  static const kAllTlds = {
    "aaa",
    "aarp",
    "abarth",
    "abb",
    "abbott",
    "abbvie",
    "abc",
    "able",
    "abogado",
    "abudhabi",
    "ac",
    "academy",
    "accenture",
    "accountant",
    "accountants",
    "aco",
    "actor",
    "ad",
    "ads",
    "adult",
    "ae",
    "aeg",
    "aero",
    "aetna",
    "af",
    "afl",
    "africa",
    "ag",
    "agakhan",
    "agency",
    "ai",
    "aig",
    "airbus",
    "airforce",
    "airtel",
    "akdn",
    "al",
    "alfaromeo",
    "alibaba",
    "alipay",
    "allfinanz",
    "allstate",
    "ally",
    "alsace",
    "alstom",
    "am",
    "amazon",
    "americanexpress",
    "americanfamily",
    "amex",
    "amfam",
    "amica",
    "amsterdam",
    "analytics",
    "android",
    "anquan",
    "anz",
    "ao",
    "aol",
    "apartments",
    "app",
    "apple",
    "aq",
    "aquarelle",
    "ar",
    "arab",
    "aramco",
    "archi",
    "army",
    "arpa",
    "art",
    "arte",
    "as",
    "asda",
    "asia",
    "associates",
    "at",
    "athleta",
    "attorney",
    "au",
    "auction",
    "audi",
    "audible",
    "audio",
    "auspost",
    "author",
    "auto",
    "autos",
    "avianca",
    "aw",
    "aws",
    "ax",
    "axa",
    "az",
    "azure",
    "ba",
    "baby",
    "baidu",
    "banamex",
    "bananarepublic",
    "band",
    "bank",
    "bar",
    "barcelona",
    "barclaycard",
    "barclays",
    "barefoot",
    "bargains",
    "baseball",
    "basketball",
    "bauhaus",
    "bayern",
    "bb",
    "bbc",
    "bbt",
    "bbva",
    "bcg",
    "bcn",
    "bd",
    "be",
    "beats",
    "beauty",
    "beer",
    "bentley",
    "berlin",
    "best",
    "bestbuy",
    "bet",
    "bf",
    "bg",
    "bh",
    "bharti",
    "bi",
    "bible",
    "bid",
    "bike",
    "bing",
    "bingo",
    "bio",
    "biz",
    "bj",
    "black",
    "blackfriday",
    "blockbuster",
    "blog",
    "bloomberg",
    "blue",
    "bm",
    "bms",
    "bmw",
    "bn",
    "bnpparibas",
    "bo",
    "boats",
    "boehringer",
    "bofa",
    "bom",
    "bond",
    "boo",
    "book",
    "booking",
    "bosch",
    "bostik",
    "boston",
    "bot",
    "boutique",
    "box",
    "br",
    "bradesco",
    "bridgestone",
    "broadway",
    "broker",
    "brother",
    "brussels",
    "bs",
    "bt",
    "build",
    "builders",
    "business",
    "buy",
    "buzz",
    "bv",
    "bw",
    "by",
    "bz",
    "bzh",
    "ca",
    "cab",
    "cafe",
    "cal",
    "call",
    "calvinklein",
    "cam",
    "camera",
    "camp",
    "canon",
    "capetown",
    "capital",
    "capitalone",
    "car",
    "caravan",
    "cards",
    "care",
    "career",
    "careers",
    "cars",
    "casa",
    "case",
    "cash",
    "casino",
    "cat",
    "catering",
    "catholic",
    "cba",
    "cbn",
    "cbre",
    "cbs",
    "cc",
    "cd",
    "center",
    "ceo",
    "cern",
    "cf",
    "cfa",
    "cfd",
    "cg",
    "ch",
    "chanel",
    "channel",
    "charity",
    "chase",
    "chat",
    "cheap",
    "chintai",
    "christmas",
    "chrome",
    "church",
    "ci",
    "cipriani",
    "circle",
    "cisco",
    "citadel",
    "citi",
    "citic",
    "city",
    "cityeats",
    "ck",
    "cl",
    "claims",
    "cleaning",
    "click",
    "clinic",
    "clinique",
    "clothing",
    "cloud",
    "club",
    "clubmed",
    "cm",
    "cn",
    "co",
    "coach",
    "codes",
    "coffee",
    "college",
    "cologne",
    "com",
    "comcast",
    "commbank",
    "community",
    "company",
    "compare",
    "computer",
    "comsec",
    "condos",
    "construction",
    "consulting",
    "contact",
    "contractors",
    "cooking",
    "cookingchannel",
    "cool",
    "coop",
    "corsica",
    "country",
    "coupon",
    "coupons",
    "courses",
    "cpa",
    "cr",
    "credit",
    "creditcard",
    "creditunion",
    "cricket",
    "crown",
    "crs",
    "cruise",
    "cruises",
    "cu",
    "cuisinella",
    "cv",
    "cw",
    "cx",
    "cy",
    "cymru",
    "cyou",
    "cz",
    "dabur",
    "dad",
    "dance",
    "data",
    "date",
    "dating",
    "datsun",
    "day",
    "dclk",
    "dds",
    "de",
    "deal",
    "dealer",
    "deals",
    "degree",
    "delivery",
    "dell",
    "deloitte",
    "delta",
    "democrat",
    "dental",
    "dentist",
    "desi",
    "design",
    "dev",
    "dhl",
    "diamonds",
    "diet",
    "digital",
    "direct",
    "directory",
    "discount",
    "discover",
    "dish",
    "diy",
    "dj",
    "dk",
    "dm",
    "dnp",
    "do",
    "docs",
    "doctor",
    "dog",
    "domains",
    "dot",
    "download",
    "drive",
    "dtv",
    "dubai",
    "dunlop",
    "dupont",
    "durban",
    "dvag",
    "dvr",
    "dz",
    "earth",
    "eat",
    "ec",
    "eco",
    "edeka",
    "edu",
    "education",
    "ee",
    "eg",
    "email",
    "emerck",
    "energy",
    "engineer",
    "engineering",
    "enterprises",
    "epson",
    "equipment",
    "er",
    "ericsson",
    "erni",
    "es",
    "esq",
    "estate",
    "et",
    "etisalat",
    "eu",
    "eurovision",
    "eus",
    "events",
    "exchange",
    "expert",
    "exposed",
    "express",
    "extraspace",
    "fage",
    "fail",
    "fairwinds",
    "faith",
    "family",
    "fan",
    "fans",
    "farm",
    "farmers",
    "fashion",
    "fast",
    "fedex",
    "feedback",
    "ferrari",
    "ferrero",
    "fi",
    "fiat",
    "fidelity",
    "fido",
    "film",
    "final",
    "finance",
    "financial",
    "fire",
    "firestone",
    "firmdale",
    "fish",
    "fishing",
    "fit",
    "fitness",
    "fj",
    "fk",
    "flickr",
    "flights",
    "flir",
    "florist",
    "flowers",
    "fly",
    "fm",
    "fo",
    "foo",
    "food",
    "foodnetwork",
    "football",
    "ford",
    "forex",
    "forsale",
    "forum",
    "foundation",
    "fox",
    "fr",
    "free",
    "fresenius",
    "frl",
    "frogans",
    "frontdoor",
    "frontier",
    "ftr",
    "fujitsu",
    "fun",
    "fund",
    "furniture",
    "futbol",
    "fyi",
    "ga",
    "gal",
    "gallery",
    "gallo",
    "gallup",
    "game",
    "games",
    "gap",
    "garden",
    "gay",
    "gb",
    "gbiz",
    "gd",
    "gdn",
    "ge",
    "gea",
    "gent",
    "genting",
    "george",
    "gf",
    "gg",
    "ggee",
    "gh",
    "gi",
    "gift",
    "gifts",
    "gives",
    "giving",
    "gl",
    "glass",
    "gle",
    "global",
    "globo",
    "gm",
    "gmail",
    "gmbh",
    "gmo",
    "gmx",
    "gn",
    "godaddy",
    "gold",
    "goldpoint",
    "golf",
    "goo",
    "goodyear",
    "goog",
    "google",
    "gop",
    "got",
    "gov",
    "gp",
    "gq",
    "gr",
    "grainger",
    "graphics",
    "gratis",
    "green",
    "gripe",
    "grocery",
    "group",
    "gs",
    "gt",
    "gu",
    "guardian",
    "gucci",
    "guge",
    "guide",
    "guitars",
    "guru",
    "gw",
    "gy",
    "hair",
    "hamburg",
    "hangout",
    "haus",
    "hbo",
    "hdfc",
    "hdfcbank",
    "health",
    "healthcare",
    "help",
    "helsinki",
    "here",
    "hermes",
    "hgtv",
    "hiphop",
    "hisamitsu",
    "hitachi",
    "hiv",
    "hk",
    "hkt",
    "hm",
    "hn",
    "hockey",
    "holdings",
    "holiday",
    "homedepot",
    "homegoods",
    "homes",
    "homesense",
    "honda",
    "horse",
    "hospital",
    "host",
    "hosting",
    "hot",
    "hoteles",
    "hotels",
    "hotmail",
    "house",
    "how",
    "hr",
    "hsbc",
    "ht",
    "hu",
    "hughes",
    "hyatt",
    "hyundai",
    "ibm",
    "icbc",
    "ice",
    "icu",
    "id",
    "ie",
    "ieee",
    "ifm",
    "ikano",
    "il",
    "im",
    "imamat",
    "imdb",
    "immo",
    "immobilien",
    "in",
    "inc",
    "industries",
    "infiniti",
    "info",
    "ing",
    "ink",
    "institute",
    "insurance",
    "insure",
    "int",
    "international",
    "intuit",
    "investments",
    "io",
    "ipiranga",
    "iq",
    "ir",
    "irish",
    "is",
    "ismaili",
    "ist",
    "istanbul",
    "it",
    "itau",
    "itv",
    "jaguar",
    "java",
    "jcb",
    "je",
    "jeep",
    "jetzt",
    "jewelry",
    "jio",
    "jll",
    "jm",
    "jmp",
    "jnj",
    "jo",
    "jobs",
    "joburg",
    "jot",
    "joy",
    "jp",
    "jpmorgan",
    "jprs",
    "juegos",
    "juniper",
    "kaufen",
    "kddi",
    "ke",
    "kerryhotels",
    "kerrylogistics",
    "kerryproperties",
    "kfh",
    "kg",
    "kh",
    "ki",
    "kia",
    "kids",
    "kim",
    "kinder",
    "kindle",
    "kitchen",
    "kiwi",
    "km",
    "kn",
    "koeln",
    "komatsu",
    "kosher",
    "kp",
    "kpmg",
    "kpn",
    "kr",
    "krd",
    "kred",
    "kuokgroup",
    "kw",
    "ky",
    "kyoto",
    "kz",
    "la",
    "lacaixa",
    "lamborghini",
    "lamer",
    "lancaster",
    "lancia",
    "land",
    "landrover",
    "lanxess",
    "lasalle",
    "lat",
    "latino",
    "latrobe",
    "law",
    "lawyer",
    "lb",
    "lc",
    "lds",
    "lease",
    "leclerc",
    "lefrak",
    "legal",
    "lego",
    "lexus",
    "lgbt",
    "li",
    "lidl",
    "life",
    "lifeinsurance",
    "lifestyle",
    "lighting",
    "like",
    "lilly",
    "limited",
    "limo",
    "lincoln",
    "link",
    "lipsy",
    "live",
    "living",
    "lk",
    "llc",
    "llp",
    "loan",
    "loans",
    "locker",
    "locus",
    "lol",
    "london",
    "lotte",
    "lotto",
    "love",
    "lpl",
    "lplfinancial",
    "lr",
    "ls",
    "lt",
    "ltd",
    "ltda",
    "lu",
    "lundbeck",
    "luxe",
    "luxury",
    "lv",
    "ly",
    "ma",
    "madrid",
    "maif",
    "maison",
    "makeup",
    "man",
    "management",
    "mango",
    "map",
    "market",
    "marketing",
    "markets",
    "marriott",
    "marshalls",
    "maserati",
    "mattel",
    "mba",
    "mc",
    "mckinsey",
    "md",
    "me",
    "med",
    "media",
    "meet",
    "melbourne",
    "meme",
    "memorial",
    "men",
    "menu",
    "merckmsd",
    "mg",
    "mh",
    "miami",
    "microsoft",
    "mil",
    "mini",
    "mint",
    "mit",
    "mitsubishi",
    "mk",
    "ml",
    "mlb",
    "mls",
    "mm",
    "mma",
    "mn",
    "mo",
    "mobi",
    "mobile",
    "moda",
    "moe",
    "moi",
    "mom",
    "monash",
    "money",
    "monster",
    "mormon",
    "mortgage",
    "moscow",
    "moto",
    "motorcycles",
    "mov",
    "movie",
    "mp",
    "mq",
    "mr",
    "ms",
    "msd",
    "mt",
    "mtn",
    "mtr",
    "mu",
    "museum",
    "music",
    "mutual",
    "mv",
    "mw",
    "mx",
    "my",
    "mz",
    "na",
    "nab",
    "nagoya",
    "name",
    "natura",
    "navy",
    "nba",
    "nc",
    "ne",
    "nec",
    "net",
    "netbank",
    "netflix",
    "network",
    "neustar",
    "new",
    "news",
    "next",
    "nextdirect",
    "nexus",
    "nf",
    "nfl",
    "ng",
    "ngo",
    "nhk",
    "ni",
    "nico",
    "nike",
    "nikon",
    "ninja",
    "nissan",
    "nissay",
    "nl",
    "no",
    "nokia",
    "northwesternmutual",
    "norton",
    "now",
    "nowruz",
    "nowtv",
    "np",
    "nr",
    "nra",
    "nrw",
    "ntt",
    "nu",
    "nyc",
    "nz",
    "obi",
    "observer",
    "office",
    "okinawa",
    "olayan",
    "olayangroup",
    "oldnavy",
    "ollo",
    "om",
    "omega",
    "one",
    "ong",
    "onl",
    "online",
    "ooo",
    "open",
    "oracle",
    "orange",
    "org",
    "organic",
    "origins",
    "osaka",
    "otsuka",
    "ott",
    "ovh",
    "pa",
    "page",
    "panasonic",
    "paris",
    "pars",
    "partners",
    "parts",
    "party",
    "passagens",
    "pay",
    "pccw",
    "pe",
    "pet",
    "pf",
    "pfizer",
    "pg",
    "ph",
    "pharmacy",
    "phd",
    "philips",
    "phone",
    "photo",
    "photography",
    "photos",
    "physio",
    "pics",
    "pictet",
    "pictures",
    "pid",
    "pin",
    "ping",
    "pink",
    "pioneer",
    "pizza",
    "pk",
    "pl",
    "place",
    "play",
    "playstation",
    "plumbing",
    "plus",
    "pm",
    "pn",
    "pnc",
    "pohl",
    "poker",
    "politie",
    "porn",
    "post",
    "pr",
    "pramerica",
    "praxi",
    "press",
    "prime",
    "pro",
    "prod",
    "productions",
    "prof",
    "progressive",
    "promo",
    "properties",
    "property",
    "protection",
    "pru",
    "prudential",
    "ps",
    "pt",
    "pub",
    "pw",
    "pwc",
    "py",
    "qa",
    "qpon",
    "quebec",
    "quest",
    "racing",
    "radio",
    "re",
    "read",
    "realestate",
    "realtor",
    "realty",
    "recipes",
    "red",
    "redstone",
    "redumbrella",
    "rehab",
    "reise",
    "reisen",
    "reit",
    "reliance",
    "ren",
    "rent",
    "rentals",
    "repair",
    "report",
    "republican",
    "rest",
    "restaurant",
    "review",
    "reviews",
    "rexroth",
    "rich",
    "richardli",
    "ricoh",
    "ril",
    "rio",
    "rip",
    "ro",
    "rocher",
    "rocks",
    "rodeo",
    "rogers",
    "room",
    "rs",
    "rsvp",
    "ru",
    "rugby",
    "ruhr",
    "run",
    "rw",
    "rwe",
    "ryukyu",
    "sa",
    "saarland",
    "safe",
    "safety",
    "sakura",
    "sale",
    "salon",
    "samsclub",
    "samsung",
    "sandvik",
    "sandvikcoromant",
    "sanofi",
    "sap",
    "sarl",
    "sas",
    "save",
    "saxo",
    "sb",
    "sbi",
    "sbs",
    "sc",
    "sca",
    "scb",
    "schaeffler",
    "schmidt",
    "scholarships",
    "school",
    "schule",
    "schwarz",
    "science",
    "scot",
    "sd",
    "se",
    "search",
    "seat",
    "secure",
    "security",
    "seek",
    "select",
    "sener",
    "services",
    "seven",
    "sew",
    "sex",
    "sexy",
    "sfr",
    "sg",
    "sh",
    "shangrila",
    "sharp",
    "shaw",
    "shell",
    "shia",
    "shiksha",
    "shoes",
    "shop",
    "shopping",
    "shouji",
    "show",
    "showtime",
    "si",
    "silk",
    "sina",
    "singles",
    "site",
    "sj",
    "sk",
    "ski",
    "skin",
    "sky",
    "skype",
    "sl",
    "sling",
    "sm",
    "smart",
    "smile",
    "sn",
    "sncf",
    "so",
    "soccer",
    "social",
    "softbank",
    "software",
    "sohu",
    "solar",
    "solutions",
    "song",
    "sony",
    "soy",
    "spa",
    "space",
    "sport",
    "spot",
    "sr",
    "srl",
    "ss",
    "st",
    "stada",
    "staples",
    "star",
    "statebank",
    "statefarm",
    "stc",
    "stcgroup",
    "stockholm",
    "storage",
    "store",
    "stream",
    "studio",
    "study",
    "style",
    "su",
    "sucks",
    "supplies",
    "supply",
    "support",
    "surf",
    "surgery",
    "suzuki",
    "sv",
    "swatch",
    "swiss",
    "sx",
    "sy",
    "sydney",
    "systems",
    "sz",
    "tab",
    "taipei",
    "talk",
    "taobao",
    "target",
    "tatamotors",
    "tatar",
    "tattoo",
    "tax",
    "taxi",
    "tc",
    "tci",
    "td",
    "tdk",
    "team",
    "tech",
    "technology",
    "tel",
    "temasek",
    "tennis",
    "teva",
    "tf",
    "tg",
    "th",
    "thd",
    "theater",
    "theatre",
    "tiaa",
    "tickets",
    "tienda",
    "tiffany",
    "tips",
    "tires",
    "tirol",
    "tj",
    "tjmaxx",
    "tjx",
    "tk",
    "tkmaxx",
    "tl",
    "tm",
    "tmall",
    "tn",
    "to",
    "today",
    "tokyo",
    "tools",
    "top",
    "toray",
    "toshiba",
    "total",
    "tours",
    "town",
    "toyota",
    "toys",
    "tr",
    "trade",
    "trading",
    "training",
    "travel",
    "travelchannel",
    "travelers",
    "travelersinsurance",
    "trust",
    "trv",
    "tt",
    "tube",
    "tui",
    "tunes",
    "tushu",
    "tv",
    "tvs",
    "tw",
    "tz",
    "ua",
    "ubank",
    "ubs",
    "ug",
    "uk",
    "unicom",
    "university",
    "uno",
    "uol",
    "ups",
    "us",
    "uy",
    "uz",
    "va",
    "vacations",
    "vana",
    "vanguard",
    "vc",
    "ve",
    "vegas",
    "ventures",
    "verisign",
    "versicherung",
    "vet",
    "vg",
    "vi",
    "viajes",
    "video",
    "vig",
    "viking",
    "villas",
    "vin",
    "vip",
    "virgin",
    "visa",
    "vision",
    "viva",
    "vivo",
    "vlaanderen",
    "vn",
    "vodka",
    "volkswagen",
    "volvo",
    "vote",
    "voting",
    "voto",
    "voyage",
    "vu",
    "vuelos",
    "wales",
    "walmart",
    "walter",
    "wang",
    "wanggou",
    "watch",
    "watches",
    "weather",
    "weatherchannel",
    "webcam",
    "weber",
    "website",
    "wed",
    "wedding",
    "weibo",
    "weir",
    "wf",
    "whoswho",
    "wien",
    "wiki",
    "williamhill",
    "win",
    "windows",
    "wine",
    "winners",
    "wme",
    "wolterskluwer",
    "woodside",
    "work",
    "works",
    "world",
    "wow",
    "ws",
    "wtc",
    "wtf",
    "xbox",
    "xerox",
    "xfinity",
    "xihuan",
    "xin",
    "कॉम",
    "xn--11b4c3d",
    "セール",
    "xn--1ck2e1b",
    "佛山",
    "xn--1qqw23a",
    "ಭಾರತ",
    "xn--2scrj9c",
    "慈善",
    "xn--30rr7y",
    "集团",
    "xn--3bst00m",
    "在线",
    "xn--3ds443g",
    "한국",
    "xn--3e0b707e",
    "ଭାରତ",
    "xn--3hcrj9c",
    "点看",
    "xn--3pxu8k",
    "คอม",
    "xn--42c2d9a",
    "ভাৰত",
    "xn--45br5cyl",
    "ভারত",
    "xn--45brj9c",
    "八卦",
    "xn--45q11c",
    "ישראל",
    "xn--4dbrk0ce",
    "موقع",
    "xn--4gbrim",
    "বাংলা",
    "xn--54b7fta0cc",
    "公益",
    "xn--55qw42g",
    "公司",
    "xn--55qx5d",
    "香格里拉",
    "xn--5su34j936bgsg",
    "网站",
    "xn--5tzm5g",
    "移动",
    "xn--6frz82g",
    "我爱你",
    "xn--6qq986b3xl",
    "москва",
    "xn--80adxhks",
    "қаз",
    "xn--80ao21a",
    "католик",
    "xn--80aqecdr1a",
    "онлайн",
    "xn--80asehdb",
    "сайт",
    "xn--80aswg",
    "联通",
    "xn--8y0a063a",
    "срб",
    "xn--90a3ac",
    "бг",
    "xn--90ae",
    "бел",
    "xn--90ais",
    "קום",
    "xn--9dbq2a",
    "时尚",
    "xn--9et52u",
    "微博",
    "xn--9krt00a",
    "淡马锡",
    "xn--b4w605ferd",
    "ファッション",
    "xn--bck1b9a5dre4c",
    "орг",
    "xn--c1avg",
    "नेट",
    "xn--c2br7g",
    "ストア",
    "xn--cck2b3b",
    "アマゾン",
    "xn--cckwcxetd",
    "삼성",
    "xn--cg4bki",
    "சிங்கப்பூர்",
    "xn--clchc0ea0b2g2a9gcd",
    "商标",
    "xn--czr694b",
    "商店",
    "xn--czrs0t",
    "商城",
    "xn--czru2d",
    "дети",
    "xn--d1acj3b",
    "мкд",
    "xn--d1alf",
    "ею",
    "xn--e1a4c",
    "ポイント",
    "xn--eckvdtc9d",
    "新闻",
    "xn--efvy88h",
    "家電",
    "xn--fct429k",
    "كوم",
    "xn--fhbei",
    "中文网",
    "xn--fiq228c5hs",
    "中信",
    "xn--fiq64b",
    "中国",
    "xn--fiqs8s",
    "中國",
    "xn--fiqz9s",
    "娱乐",
    "xn--fjq720a",
    "谷歌",
    "xn--flw351e",
    "భారత్",
    "xn--fpcrj9c3d",
    "ලංකා",
    "xn--fzc2c9e2c",
    "電訊盈科",
    "xn--fzys8d69uvgm",
    "购物",
    "xn--g2xx48c",
    "クラウド",
    "xn--gckr3f0f",
    "ભારત",
    "xn--gecrj9c",
    "通販",
    "xn--gk3at1e",
    "भारतम्",
    "xn--h2breg3eve",
    "भारत",
    "xn--h2brj9c",
    "भारोत",
    "xn--h2brj9c8c",
    "网店",
    "xn--hxt814e",
    "संगठन",
    "xn--i1b6b1a6a2e",
    "餐厅",
    "xn--imr513n",
    "网络",
    "xn--io0a7i",
    "ком",
    "xn--j1aef",
    "укр",
    "xn--j1amh",
    "香港",
    "xn--j6w193g",
    "亚马逊",
    "xn--jlq480n2rg",
    "食品",
    "xn--jvr189m",
    "飞利浦",
    "xn--kcrx77d1x4a",
    "台湾",
    "xn--kprw13d",
    "台灣",
    "xn--kpry57d",
    "手机",
    "xn--kput3i",
    "мон",
    "xn--l1acc",
    "الجزائر",
    "xn--lgbbat1ad8j",
    "عمان",
    "xn--mgb9awbf",
    "ارامكو",
    "xn--mgba3a3ejt",
    "ایران",
    "xn--mgba3a4f16a",
    "العليان",
    "xn--mgba7c0bbn0a",
    "اتصالات",
    "xn--mgbaakc7dvf",
    "امارات",
    "xn--mgbaam7a8h",
    "بازار",
    "xn--mgbab2bd",
    "موريتانيا",
    "xn--mgbah1a3hjkrd",
    "پاکستان",
    "xn--mgbai9azgqp6j",
    "الاردن",
    "xn--mgbayh7gpa",
    "بارت",
    "xn--mgbbh1a",
    "بھارت",
    "xn--mgbbh1a71e",
    "المغرب",
    "xn--mgbc0a9azcg",
    "ابوظبي",
    "xn--mgbca7dzdo",
    "البحرين",
    "xn--mgbcpq6gpa1a",
    "السعودية",
    "xn--mgberp4a5d4ar",
    "ڀارت",
    "xn--mgbgu82a",
    "كاثوليك",
    "xn--mgbi4ecexp",
    "سودان",
    "xn--mgbpl2fh",
    "همراه",
    "xn--mgbt3dhd",
    "عراق",
    "xn--mgbtx2b",
    "مليسيا",
    "xn--mgbx4cd0ab",
    "澳門",
    "xn--mix891f",
    "닷컴",
    "xn--mk1bu44c",
    "政府",
    "xn--mxtq1m",
    "شبكة",
    "xn--ngbc5azd",
    "بيتك",
    "xn--ngbe9e0a",
    "عرب",
    "xn--ngbrx",
    "გე",
    "xn--node",
    "机构",
    "xn--nqv7f",
    "组织机构",
    "xn--nqv7fs00ema",
    "健康",
    "xn--nyqy26a",
    "ไทย",
    "xn--o3cw4h",
    "سورية",
    "xn--ogbpf8fl",
    "招聘",
    "xn--otu796d",
    "рус",
    "xn--p1acf",
    "рф",
    "xn--p1ai",
    "تونس",
    "xn--pgbs0dh",
    "大拿",
    "xn--pssy2u",
    "ລາວ",
    "xn--q7ce6a",
    "みんな",
    "xn--q9jyb4c",
    "グーグル",
    "xn--qcka1pmc",
    "ευ",
    "xn--qxa6a",
    "ελ",
    "xn--qxam",
    "世界",
    "xn--rhqv96g",
    "書籍",
    "xn--rovu88b",
    "ഭാരതം",
    "xn--rvc1e0am3e",
    "ਭਾਰਤ",
    "xn--s9brj9c",
    "网址",
    "xn--ses554g",
    "닷넷",
    "xn--t60b56a",
    "コム",
    "xn--tckwe",
    "天主教",
    "xn--tiq49xqyj",
    "游戏",
    "xn--unup4y",
    "vermögensberater",
    "xn--vermgensberater-ctb",
    "vermögensberatung",
    "xn--vermgensberatung-pwb",
    "企业",
    "xn--vhquv",
    "信息",
    "xn--vuq861b",
    "嘉里大酒店",
    "xn--w4r85el8fhu5dnra",
    "嘉里",
    "xn--w4rs40l",
    "مصر",
    "xn--wgbh1c",
    "قطر",
    "xn--wgbl6a",
    "广东",
    "xn--xhq521b",
    "இலங்கை",
    "xn--xkc2al3hye2a",
    "இந்தியா",
    "xn--xkc2dl3a5ee0h",
    "հայ",
    "xn--y9a3aq",
    "新加坡",
    "xn--yfro4i67o",
    "فلسطين",
    "xn--ygbi2ammx",
    "政务",
    "xn--zfr164b",
    "xxx",
    "xyz",
    "yachts",
    "yahoo",
    "yamaxun",
    "yandex",
    "ye",
    "yodobashi",
    "yoga",
    "yokohama",
    "you",
    "youtube",
    "yt",
    "yun",
    "za",
    "zappos",
    "zara",
    "zero",
    "zip",
    "zm",
    "zone",
    "zuerich",
    "zw",
  };

  static const kAllSchemes = {
    "aaa",
    "aaas",
    "about",
    "acap",
    "acct",
    "acd",
    "acr",
    "adiumxtra",
    "adt",
    "afp",
    "afs",
    "aim",
    "amss",
    "android",
    "appdata",
    "apt",
    "ar",
    "ark",
    "attachment",
    "aw",
    "barion",
    "bb",
    "beshare",
    "bitcoin",
    "bitcoincash",
    "blob",
    "bolo",
    "browserext",
    "cabal",
    "calculator",
    "callto",
    "cap",
    "cast",
    "casts",
    "chrome",
    "cid",
    "coap",
    "coaps",
    "content",
    "crid",
    "cstr",
    "cvs",
    "dab",
    "dat",
    "data",
    "dav",
    "dhttp",
    "diaspora",
    "dict",
    "did",
    "dis",
    "dns",
    "dntp",
    "doi",
    "dpp",
    "drm",
    "drop",
    "dtmi",
    "dtn",
    "dvb",
    "dvx",
    "dweb",
    "ed2k",
    "eid",
    "elsi",
    "embedded",
    "ens",
    "ethereum",
    "example",
    "facetime",
    "fax",
    "feed",
    "feedready",
    "fido",
    "file",
    "filesystem",
    "finger",
    "fish",
    "fm",
    "ftp",
    "geo",
    "gg",
    "git",
    "gitoid",
    "gizmoproject",
    "go",
    "gopher",
    "graph",
    "grd",
    "gtalk",
    "h323",
    "ham",
    "hcap",
    "hcp",
    "http",
    "https",
    "hxxp",
    "hxxps",
    "hydrazone",
    "hyper",
    "iax",
    "icap",
    "icon",
    "im",
    "imap",
    "info",
    "iotdisco",
    "ipfs",
    "ipn",
    "ipns",
    "ipp",
    "ipps",
    "irc",
    "irc6",
    "ircs",
    "iris",
    "isostore",
    "itms",
    "jabber",
    "jar",
    "jms",
    "keyparc",
    "lastfm",
    "lbry",
    "ldap",
    "ldaps",
    "leaptofrogans",
    "lorawan",
    "lpa",
    "lvlt",
    "magnet",
    "mailserver",
    "mailto",
    "maps",
    "market",
    "matrix",
    "message",
    "mid",
    "mms",
    "modem",
    "mongodb",
    "moz",
    "msnim",
    "msrp",
    "msrps",
    "mss",
    "mt",
    "mtqp",
    "mumble",
    "mupdate",
    "mvn",
    "news",
    "nfs",
    "ni",
    "nih",
    "nntp",
    "notes",
    "num",
    "ocf",
    "oid",
    "onenote",
    "opaquelocktoken",
    "openpgp4fpr",
    "otpauth",
    "p1",
    "pack",
    "palm",
    "paparazzi",
    "payment",
    "payto",
    "pkcs11",
    "platform",
    "pop",
    "pres",
    "prospero",
    "proxy",
    "pwid",
    "psyc",
    "pttp",
    "qb",
    "query",
    "redis",
    "rediss",
    "reload",
    "res",
    "resource",
    "rmi",
    "rsync",
    "rtmfp",
    "rtmp",
    "rtsp",
    "rtsps",
    "rtspu",
    "sarif",
    "secondlife",
    "service",
    "session",
    "sftp",
    "sgn",
    "shc",
    "sieve",
    "simpleledger",
    "simplex",
    "sip",
    "sips",
    "skype",
    "smb",
    "smp",
    "sms",
    "smtp",
    "snews",
    "snmp",
    "soldat",
    "spiffe",
    "spotify",
    "ssb",
    "ssh",
    "starknet",
    "steam",
    "stun",
    "stuns",
    "submit",
    "svn",
    "swh",
    "swid",
    "swidpath",
    "tag",
    "taler",
    "teamspeak",
    "tel",
    "teliaeid",
    "telnet",
    "tftp",
    "things",
    "thismessage",
    "tip",
    "tn3270",
    "tool",
    "turn",
    "turns",
    "tv",
    "udp",
    "unreal",
    "upt",
    "urn",
    "ut2004",
    "vemmi",
    "ventrilo",
    "ves",
    "videotex",
    "vnc",
    "vscode",
    "vsls",
    "w3",
    "wais",
    "web3",
    "wcr",
    "webcal",
    "wifi",
    "wpid",
    "ws",
    "wss",
    "wtai",
    "wyciwyg",
    "xcon",
    "xfire",
    "xmpp",
    "xri",
    "ymsgr",
  };
}