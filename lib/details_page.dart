import 'package:flutter/material.dart';
import 'package:flutter_expandable_list/basic_tile.dart';

class DetailsPage extends StatefulWidget {
  final BasicTile tile;
  const DetailsPage({super.key, required this.tile});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tile.title.toString()),
      ),
    );
  }
}
