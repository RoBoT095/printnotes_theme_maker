import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    super.key,
    required this.title,
    required this.isGrid,
    required this.body,
    this.drawer,
  });

  final String title;
  final VoidCallback isGrid;
  final Widget body;
  final Widget? drawer;

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        scrolledUnderElevation: 0,
        title: Text(widget.title),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(
                      Theme.of(context).colorScheme.onSecondary),
                  foregroundColor: WidgetStatePropertyAll<Color>(
                      Theme.of(context).colorScheme.secondary)),
              onPressed: () => setState(() => widget.isGrid()),
              child: const Row(
                children: [
                  Icon(Icons.grid_view),
                  Text(' Switch Layout'),
                ],
              )),
        ],
      ),
      drawer: widget.drawer,
      body: widget.body,
    );
  }
}
