import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linkfy_text/src/enum.dart';
import 'package:linkfy_text/src/model/link.dart';
import 'package:linkfy_text/src/utils/matrix_regex.dart';

/// Matrix Linkify [text] containing urls, emails or hashtag
class MatrixLinkifyText extends StatelessWidget {
  const MatrixLinkifyText(
    this.text, {
    this.textStyle,
    this.linkStyle,
    this.linkTypes,
    this.onTap,
    this.customLinkStyles,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    Key? key,
    this.onTapDownLink,
    this.themeData,
  }) : super(key: key);

  /// text to be linkified
  final String text;

  /// [textStyle] applied the text
  final TextStyle? textStyle;

  /// [textStyle] added to the formatted links in the text
  final TextStyle? linkStyle;

  /// called when a formatted link is pressed, it returns the link as a parameter
  /// ```dart
  ///   LinkifyText("#helloWorld", onTap: (link) {
  ///       // do stuff with link
  ///       print("${link.value} hashtag was tapped");
  ///   });
  /// ```
  final void Function(Link)? onTap;

  /// option to override the links to be formatted in the text, defaults to `[LinkType.url]`
  /// so only urls are being linkified in the text
  final List<LinkType>? linkTypes;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// Defaults to retrieving the value from the nearest [DefaultTextStyle] ancestor.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaler] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final TextScaler? textScaler;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  final Map<LinkType, TextStyle>? customLinkStyles;

  final void Function(TapDownDetails, Link)? onTapDownLink;

  final ThemeData? themeData;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      LinkifyTextSpans(
        text: text,
        linkStyle: linkStyle,
        onTapLink: onTap,
        onTapDownLink: onTapDownLink,
        themeData: themeData,
        linkTypes: linkTypes,
        customLinkStyles: customLinkStyles,
      ),
      key: key,
      style: textStyle,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      locale: locale,
    );
  }
}

/// Like Text.rich only that it also correctly disposes of all recognizers
class CleanRichText extends StatefulWidget {
  final InlineSpan child;
  final TextAlign? textAlign;
  final int? maxLines;

  const CleanRichText(this.child, {Key? key, this.textAlign, this.maxLines})
      : super(key: key);

  @override
  State<CleanRichText> createState() => _CleanRichTextState();
}

class _CleanRichTextState extends State<CleanRichText> {
  void _disposeTextspan(TextSpan textSpan) {
    textSpan.recognizer?.dispose();
    if (textSpan.children != null) {
      for (final child in textSpan.children!) {
        if (child is TextSpan) {
          _disposeTextspan(child);
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.child is TextSpan) {
      _disposeTextspan(widget.child as TextSpan);
    }
  }

  @override
  Widget build(BuildContext build) {
    return Text.rich(
      widget.child,
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
    );
  }
}

class LinkTextSpan extends TextSpan {
  // Beware!
  //
  // This class is only safe because the TapGestureRecognizer is not
  // given a deadline and therefore never allocates any resources.
  //
  // In any other situation -- setting a deadline, using any of the less trivial
  // recognizers, etc -- you would have to manage the gesture recognizer's
  // lifetime and call dispose() when the TextSpan was no longer being rendered.
  //
  // Since TextSpan itself is @immutable, this means that you would have to
  // manage the recognizer from outside the TextSpan, e.g. in the State of a
  // stateful widget that then hands the recognizer to the TextSpan.
  final Link link;
  final void Function(TapDownDetails, Link)? onTapDownLink;
  final void Function(Link)? onTapLink;

  LinkTextSpan({
    TextStyle? style,
    required this.link,
    String? text,
    this.onTapDownLink,
    this.onTapLink,
    List<InlineSpan>? children,
  }) : super(
          style: style,
          text: text ?? '',
          children: children ?? <InlineSpan>[],
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (onTapLink != null) {
                onTapLink(link);
              }
            }
            ..onTapDown = (details) async {
              if (onTapDownLink != null) {
                onTapDownLink(details, link);
                return;
              }
            },
        ) {
    _fixRecognizer(this, recognizer!);
  }

  void _fixRecognizer(TextSpan textSpan, GestureRecognizer recognizer) {
    if (textSpan.children?.isEmpty ?? true) {
      return;
    }
    final fixedChildren = <InlineSpan>[];
    for (final child in textSpan.children!) {
      if (child is TextSpan && child.recognizer == null) {
        _fixRecognizer(child, recognizer);
        fixedChildren.add(TextSpan(
          text: child.text,
          style: child.style,
          recognizer: recognizer,
          children: child.children,
        ));
      } else {
        fixedChildren.add(child);
      }
    }
    textSpan.children!.clear();
    textSpan.children!.addAll(fixedChildren);
  }
}

// ignore: non_constant_identifier_names
TextSpan LinkifyTextSpans({
  String text = '',
  TextStyle? linkStyle,
  TextStyle? textStyle,
  List<LinkType>? linkTypes,
  Map<LinkType, TextStyle>? customLinkStyles,
  ThemeData? themeData,
  Function(Link)? onTapLink,
  Function(TapDownDetails, Link)? onTapDownLink,
}) {
  textStyle ??= themeData?.textTheme.bodyMedium;
  linkStyle ??= themeData?.textTheme.bodyMedium?.copyWith(
    color: themeData.colorScheme.secondary,
    decoration: TextDecoration.underline,
  );

  final _regExp =
      constructMatrixRegExpFromLinkType(linkTypes ?? [LinkType.url]);

  //  return the full text if there's no match or if empty
  if (!_regExp.hasMatch(text) || text.isEmpty) {
    return TextSpan(
      text: text,
      style: textStyle,
    );
  }

  final texts = text.split(_regExp);
  final List<InlineSpan> spans = [];
  final highlights = _regExp.allMatches(text).toList();

  for (final text in texts) {
    spans.add(TextSpan(
      text: text,
      style: textStyle,
    ));

    if (highlights.isNotEmpty) {
      final match = highlights.removeAt(0);
      final link = Link.fromTwakeMatch(match);
      if (link.type == null) {
        spans.add(TextSpan(
          text: link.value,
          style: textStyle,
        ));
        continue;
      }
      // add the link
      spans.add(
        LinkTextSpan(
          text: link.value,
          link: link,
          style: customLinkStyles?[link.type] ?? linkStyle,
          onTapLink: onTapLink,
          onTapDownLink: onTapDownLink,
        ),
      );
    }
  }
  return TextSpan(children: spans);
}
