import 'package:flutter/material.dart';
import 'package:flutter_expandable_list/basic_tile.dart';
import 'package:flutter_expandable_list/details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Expendable List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final basicTiles = <BasicTile>[
    BasicTile(title: 'Food', tiles: [
      BasicTile(title: 'Fruits', tiles: [
        BasicTile(title: 'Apple'),
        BasicTile(title: 'Orange'),
        BasicTile(title: 'Banana'),
        BasicTile(title: 'Watermelon'),
      ]),
      BasicTile(title: 'Vegetables', tiles: [
        BasicTile(title: 'Carrot'),
        BasicTile(title: 'Broccoli'),
        BasicTile(title: 'Spinach'),
        BasicTile(title: 'Tomato'),
      ]),
    ]),
    BasicTile(title: 'Geography', tiles: [
      BasicTile(title: 'Continents', tiles: [
        BasicTile(title: 'Asia', tiles: [
          BasicTile(title: 'Afghanistan', tiles: [
            BasicTile(title: 'Capital', tiles: [
              BasicTile(title: 'Kabul'),
              BasicTile(title: 'Other City'),
            ]),
            BasicTile(title: 'Landmarks'),
          ]),
          BasicTile(title: 'Iran'),
          BasicTile(title: 'China'),
          BasicTile(title: 'India'),
        ]),
        BasicTile(title: 'Europe', tiles: [
          BasicTile(title: 'France'),
          BasicTile(title: 'Germany'),
        ]),
        BasicTile(title: 'Africa', tiles: [
          BasicTile(title: 'Nigeria'),
          BasicTile(title: 'South Africa'),
        ]),
      ]),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: basicTiles.map(buildTile).toList(),
      ),
    );
  }

  Widget buildTile(BasicTile tile, {double leftPadding = 16}) {
    if (tile.tiles.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.only(left: leftPadding),
        title: Text(tile.title),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(tile: tile),
            )),
      );
    } else {
      return ExpansionTile(
          tilePadding: EdgeInsets.only(left: leftPadding),
          trailing: const SizedBox.shrink(),
          leading: const Icon(Icons.keyboard_arrow_right_outlined),
          title: Text(tile.title),
          children: tile.tiles
              .map((tile) => buildTile(tile, leftPadding: 16 + leftPadding))
              .toList());
    }
  }
}
