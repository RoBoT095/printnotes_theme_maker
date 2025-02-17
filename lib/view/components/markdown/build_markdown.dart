import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';

import 'package:printnotes_theme_maker/view/components/markdown/rendering/code_wrapper.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/custom_node.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/highlighter.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/latex.dart';
import 'package:printnotes_theme_maker/view/components/markdown/markdown_checkbox.dart';
import 'package:printnotes_theme_maker/view/components/markdown/rendering/note_tags.dart';

MarkdownConfig theMarkdownConfigs(BuildContext context,
    {bool? hideCodeButtons}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  final isDark = colorScheme.brightness == Brightness.dark;

  codeWrapper(child, text, language) => CodeWrapperWidget(
        child,
        text,
        language,
        hideCodeButtons: hideCodeButtons,
      );

  return MarkdownConfig.defaultConfig.copy(configs: [
    PConfig(textStyle: TextStyle(color: colorScheme.onSurface)),
    CheckBoxConfig(builder: (checked) => markdownCheckBox(checked)),
    TableConfig(
        wrapper: (table) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: table,
            )),
    HrConfig(
      height: 2,
      color: colorScheme.onSurface.withOpacity(0.2),
    ),
    BlockquoteConfig(
      textColor: colorScheme.onSurface.withOpacity(0.8),
      sideColor: colorScheme.onSurface.withOpacity(0.3),
    ),
    isDark
        ? PreConfig.darkConfig.copy(theme: a11yDarkTheme, wrapper: codeWrapper)
        : const PreConfig().copy(theme: a11yLightTheme, wrapper: codeWrapper),
  ]);
}

MarkdownGenerator theMarkdownGenerators(context,
    {double? textScale, bool useLatex = false}) {
  // Not an elegant way to customize, but it works
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  final isDark = colorScheme.brightness == Brightness.dark;
  SpanNodeGeneratorWithTag noteTagGenerator = SpanNodeGeneratorWithTag(
      tag: 'noteTag',
      generator: (e, config, visitor) => NoteTagNode(
            e.attributes,
            config,
            tagBackgroundColor: colorScheme.primary.withOpacity(0.3),
            tagTextColor: isDark ? colorScheme.secondary : colorScheme.primary,
          ));

  return MarkdownGenerator(
    generators: [
      if (useLatex) latexGenerator,
      highlighterGeneratorWithTag,
      noteTagGenerator,
    ],
    inlineSyntaxList: [
      if (useLatex) LatexSyntax(),
      HighlighterSyntax(),
      NoteTagSyntax()
    ],
    textGenerator: (node, config, visitor) =>
        CustomTextNode(node.textContent, config, visitor),
    richTextBuilder: (span) => Text.rich(
      span,
      textScaler: TextScaler.linear(textScale ?? 1),
    ),
  );
}
