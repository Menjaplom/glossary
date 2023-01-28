import 'package:flutter/material.dart';
import 'package:glossary/widgets/loading_expansion_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map? data;
  bool order = false;
  List<String> language = ['Unassigned', 'Unassigned'];
  List<List<String>> tags = [];

  @override
  Widget build(BuildContext context) {
    data = (data != null)
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    language = data?['language'] ?? language;
    tags = data?['tags'] ?? tags;
    order = data?['order'] ?? order;

    int first = order ? 1 : 0;
    int second = order ? 0 : 1;
    return Scaffold(
        appBar: AppBar(
          title: Text("${language[first]} - ${language[second]}"),
        ),
        body: Center(
            child: ListView.separated(
                itemBuilder: (_, index) => Card(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: LoadingExpansionTile(
                              [tags[index][first], tags[index][second]])),
                    ),
                separatorBuilder: (_, x) => Divider(),
                itemCount: tags.length)));
  }
}
