class Constants {
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
      r']){6,}';

  // url regex that accept https, http, www
  static const String urlRegExp =
      r'((https?://)?(www\.)?[a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*))';

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
  static const String twakeRegex =
      r'(?<=\b|(?<=\W)(?=[#!+$@])|^)(?:(?<![#!+$@=])(?:([a-z0-9]+):(?:\/\/(?:[^\s\u200b]+(?::[^\s\u200b]*)?@)?(?:[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.[a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+|\d{1,3}(?:\.\d{1,3}){3}|\[[\da-f:]{3,}\]|localhost)(?::\d+)?(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?!\/\/)[^\s\u200b\(]+(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))|(?<!\.)[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+)(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?:[^\s\u200b]+@)[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+))|[#!+$@][^:\s\u200b]*:[\w\.\d-]+\.[\w\d-]+)';

// fallback regex without lookbehinds for incompatible browsers etc.
// it is slightly worse but still gets the job mostly done
  static const String fallbackRegex =
      r'(?:\b|(?=[#!+$@])|^)(?:(?:([a-z0-9]+):(?:\/\/(?:[^\s\u200b]+(?::[^\s\u200b]*)?@)?(?:[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.[a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+|\d{1,3}(?:\.\d{1,3}){3}|\[[\da-f:]{3,}\]|localhost)(?::\d+)?(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?!\/\/)[^\s\u200b\(]+(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))|[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+)(?:(?=[\/?#])[^\s\u200b\(]*(?:\([^\s\u200b]*[^\s\u200b:;,.!?>\]}]|[^\s\u200b\):;,.!?>\]}]))?|(?:[^\s\u200b]+@)[a-z\d\u00a1-\uffff](?:\.?[a-z\d\u00a1-\uffff-])*\.(?!http)([a-z\u00a1-\uffff][a-z\u00a1-\uffff-]+))|[#!+$@][^:\s\u200b]*:[\w\.\d-]+\.[\w\d-]+)';

  static const String estimateRegex = r'[^\s\u200b][\.:][^\s\u200b]';
}
