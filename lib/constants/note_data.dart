final noteData = [
  {
    "type": "file",
    "name": "Table.md",
    "text": "Syntax | Description\n- | :-:\nHeader | Title\nParagraph | Text"
  },
  {
    "type": "file",
    "name": "ToDo List.md",
    "text":
        "- [ ] Take pictures of the app\n- [x] Fix rendered check box alignment\n- [ ] Go get lunch\n- [x] Procrastinate\n___\n1. Item one\n2. Item two\n3. Item three\n"
  },
  {
    "type": "file",
    "name": "Markdown Ref.md",
    "text":
        "# Header 1\n## Header 2\n### Header 3\n___\n#TestTag\n\n# 🕶️ Basic Markdown Styling\n**BOLD text** like this\nor __this way__\n\n*Italicize text*"
  },
  {
    "type": "folder",
    "name": "Test Folder",
    "text": "",
  },
  {
    "type": "file",
    "name": "Code.md",
    "text":
        "```Dart\nimport 'package:flutter/material.dart';\n\nclass MarkdownPage extends StatelessWidget {\n  final String data;\n\n  MarkdownPage(this.data);\n\n  @override\n  Widget build(BuildContext context) => Scaffold(body: buildMarkdown());\n\n ```",
  },
  {
    "type": "file",
    "name": "Picture.md",
    "text":
        "![kitten](https://images.unsplash.com/photo-1498336179775-9836baef8fdf?q=80&w=720)"
  },
  {
    "type": "folder",
    "name": "Another Folder",
    "text": "",
  },
  {
    "type": "file",
    "name": "LaTaX Example.md",
    "text": r"$$P \left( A=2 \, \middle| \, \dfrac{A^2}{B}>4 \right)$$",
  },
  {
    "type": "file",
    "name": "Text.md",
    "text":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  },
];
