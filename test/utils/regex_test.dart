import 'package:linkfy_text/src/enum.dart';
import 'package:linkfy_text/src/utils/matrix_contants.dart';
import 'package:linkfy_text/src/utils/regex.dart';
import 'package:test/test.dart';

void main() {
  group('Regular Expression', () {
    // test values
    const urlText =
        "My website url: https://hello.com/GOOGLE search using: www.google.com, social media is facebook.com, http://example.com/method?param=fullstackoverflow.dev";
    const hashtagText = "#helloWorld and #dev are trending";
    const emailText =
        "My email address is hey@stanleee.me and dev@gmail.com, yah!";

    const phoneText = "My phone number is (222)322-3222 or +15552223333";
    const userTagText = "Follow me @user_name";
    const text = urlText + hashtagText + emailText + phoneText + userTagText;

    const emails = ["hello@world.com", "foo.bar@js.com"];

    const urls = [
      "http://domain.com",
      "http://domain.com/",
      "https://domain.com",
      "https://domain.com/",
      "https://www.domain.com",
      "www.domain.com",
      "https://domain.com/Google?",
      "https://domain.com/Google/search",
      "https://domain.com/Google?param=",
      "https://domain.com/Google?param=helloworld",
      "https://sub.domain.com/Google?param=helloworld#hash",
    ];

    const hashtags = [
      "#123",
      "#H",
      "#0",
      "#trending",
      "#_trending",
      "#TRENDING",
      "#trending_topic",
    ];

    const userTags = [
      '@helloWorld',
      '@helloWorld123',
      '@hello_world',
      '@hello_world123',
      '@hello_world_123'
    ];

    const phoneNums = [
      "1112223333",
      "(111)222 3333",
      "+5444333222",
      "+91 (123) 456-7890",
      "123-456-7890"
    ];

    ///
    test("Should match all emails", () {
      for (final email in emails) {
        expect(RegExp(MatrixConstants.emailRegExp).hasMatch(email), isTrue);
        expect(getMatchedType(email), equals(LinkType.email));
      }
    });

    test("Should match all urls", () {
      for (final url in urls) {
        expect(RegExp(MatrixConstants.urlRegExp).hasMatch(url), isTrue);
        expect(getMatchedType(url), equals(LinkType.url));
      }
    });

    test("Should match all hashtags", () {
      for (final tag in hashtags) {
        expect(RegExp(MatrixConstants.hashtagRegExp).hasMatch(tag), isTrue);
        expect(getMatchedType(tag), equals(LinkType.hashTag));
      }
    });
    test("Should match all usertags", () {
      for (final tag in userTags) {
        expect(RegExp(MatrixConstants.userTagRegExp).hasMatch(tag), isTrue);
        expect(getMatchedType(tag), equals(LinkType.userTag));
      }
    });
    test("Should match all phones", () {
      for (final phone in phoneNums) {
        expect(RegExp(MatrixConstants.phoneRegExp).hasMatch(phone), isTrue);
        expect(getMatchedType(phone), equals(LinkType.phone));
      }
    });

    test(
        "Should construct regex pattern from LinkTypes and match required output",
        () {
      final urlRegExp = constructRegExpFromLinkType([LinkType.url]);
      final hashtagRegExp = constructRegExpFromLinkType([LinkType.hashTag]);
      final emailRegExp = constructRegExpFromLinkType([LinkType.email]);
      final phoneRegExp = constructRegExpFromLinkType([LinkType.phone]);
      final userTagRegExp = constructRegExpFromLinkType([LinkType.userTag]);
      final textRegExp = constructRegExpFromLinkType([
        LinkType.url,
        LinkType.hashTag,
        LinkType.email,
        LinkType.phone,
        LinkType.userTag,
      ]);

      expect(urlRegExp.allMatches(urlText).length, 4);
      expect(userTagRegExp.allMatches(userTagText).length, 1);
      expect(hashtagRegExp.allMatches(hashtagText).length, 2);
      expect(emailRegExp.allMatches(emailText).length, 2);
      expect(phoneRegExp.allMatches(phoneText).length, 2);
      expect(textRegExp.allMatches(text).length, 10);
    });
  });
}
