import 'package:linkfy_text/src/enum.dart';
import 'package:linkfy_text/src/utils/contants.dart';

/// construct regexp. pattern from provided link types
RegExp constructRegExpFromLinkType(List<LinkType> types) {
  RegExp regexToUse;
  try {
    RegExp(Constants.twakeRegex).hasMatch('');
    regexToUse = RegExp(Constants.twakeRegex);
  } catch (_) {
    regexToUse = RegExp(Constants.fallbackRegex);
  }

  // default case where we always want to match url strings
  final len = types.length;
  if (len == 1 && types.first == LinkType.url) {
    return regexToUse;
  }
  final buffer = StringBuffer();
  for (var i = 0; i < len; i++) {
    final type = types[i];
    final isLast = i == len - 1;
    switch (type) {
      case LinkType.url:
        isLast
            ? buffer.write("(${regexToUse.pattern})|(${Constants.urlRegExp})")
            : buffer.write("(${regexToUse.pattern})|(${Constants.urlRegExp})|");
        break;
      case LinkType.hashTag:
        isLast
            ? buffer
                .write("(${regexToUse.pattern})|(${Constants.hashtagRegExp})")
            : buffer
                .write("(${regexToUse.pattern})|(${Constants.hashtagRegExp})|");
        break;
      case LinkType.userTag:
        isLast
            ? buffer
                .write("(${regexToUse.pattern})|(${Constants.userTagRegExp})")
            : buffer
                .write("(${regexToUse.pattern})|(${Constants.userTagRegExp})|");
        break;
      case LinkType.email:
        isLast
            ? buffer.write("(${regexToUse.pattern})|(${Constants.emailRegExp})")
            : buffer
                .write("(${regexToUse.pattern})|(${Constants.emailRegExp})|");
        break;
      case LinkType.phone:
        isLast
            ? buffer.write("(${Constants.phoneRegExp})")
            : buffer.write("(${Constants.phoneRegExp})|");
        break;
      default:
    }
  }
  return RegExp(buffer.toString());
}

LinkType getMatchedType(String match) {
  late LinkType type;
  if (RegExp(Constants.emailRegExp).hasMatch(match)) {
    type = LinkType.email;
  } else if (RegExp(Constants.urlRegExp).hasMatch(match)) {
    type = LinkType.url;
  } else if (RegExp(Constants.phoneRegExp).hasMatch(match)) {
    type = LinkType.phone;
  } else if (RegExp(Constants.userTagRegExp).hasMatch(match)) {
    type = LinkType.userTag;
  } else if (RegExp(Constants.hashtagRegExp).hasMatch(match)) {
    type = LinkType.hashTag;
  }
  return type;
}
