import 'package:flutter/material.dart';
import 'package:printnotes_theme_maker/view/components/markdown/markdown_widget/markdown_widget.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/strikethrough.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/subscript.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/superscript.dart';

import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';

import 'package:printnotes_theme_maker/view/components/markdown/rendering/code_wrapper.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/custom_node.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/latex.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/wiki_link.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/highlighter.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/underline.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/note_tags.dart';

MarkdownConfig theMarkdownConfigs(
  BuildContext context, {
  bool? hideCodeButtons,
  Color? textColor,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final config =
      isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;

  codeWrapper(child, text, language) => CodeWrapperWidget(child, text, language,
      hideCodeButtons: hideCodeButtons);

  return config.copy(configs: [
    PConfig(
      textStyle: TextStyle(
        color: textColor,
      ),
    ),
    H1Config(
      style: TextStyle(
        color: textColor,
      ),
    ),
    H2Config(
      style: TextStyle(
        color: textColor,
      ),
    ),
    H3Config(
      style: TextStyle(
        color: textColor,
      ),
    ),
    H4Config(
      style: TextStyle(
        color: textColor,
      ),
    ),
    H5Config(
      style: TextStyle(
        color: textColor,
      ),
    ),
    H6Config(
      style: TextStyle(
        color: textColor,
      ),
    ),
    TableConfig(
      wrapper: (table) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: table,
      ),
    ),
    HrConfig(
      height: 2,
      color: textColor ??
          Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
    ),
    BlockquoteConfig(
      textColor: textColor ??
          Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
      sideColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
    ),
    const PreConfig().copy(
      theme: (isDark ? a11yDarkTheme : a11yLightTheme),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.2))),
      wrapper: codeWrapper,
    ),
  ]);
}

MarkdownGenerator theMarkdownGenerators(BuildContext context,
    {double? textScale}) {
  // Not an elegant way to customize, but it works
  final isDark = Theme.of(context).brightness == Brightness.dark;
  SpanNodeGeneratorWithTag noteTagGenerator = SpanNodeGeneratorWithTag(
      tag: 'noteTag',
      generator: (e, config, visitor) => NoteTagNode(
            e.attributes,
            config,
            tagBackgroundColor:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            tagTextColor: isDark
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
          ));

  return MarkdownGenerator(
    generators: [
      latexGenerator,
      noteTagGenerator,
      highlighterGeneratorWithTag,
      underlineGeneratorWithTag,
      strikethroughGeneratorWithTag,
      superscriptGeneratorWithTag,
      subscriptGeneratorWithTag,
    ],
    inlineSyntaxList: [
      LatexSyntax(),
      NoteTagSyntax(),
      WikiLinkSyntax(),
      HighlighterSyntax(),
      UnderlineSyntax(),
      StrikethroughSyntax(),
      SuperscriptSyntax(),
      SubscriptSyntax(),
    ],
    textGenerator: (node, config, visitor) =>
        CustomTextNode(node.textContent, config, visitor),
    richTextBuilder: (span) => Text.rich(
      span,
      textScaler: TextScaler.linear(textScale ?? 1),
    ),
  );
}

Widget buildMarkdownWidget(
  BuildContext context, {
  required String data,
  ScrollPhysics? physics,
  bool shrinkWrap = false,
  bool? selectable,
}) {
  return MarkdownWidget(
    data: data,
    physics: physics,
    shrinkWrap: shrinkWrap,
    selectable: selectable ?? true,
    config: theMarkdownConfigs(
      context,
    ),
    markdownGenerator: theMarkdownGenerators(context),
  );
}
