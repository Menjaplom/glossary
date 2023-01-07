import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  bool order = false;
  List<String> language = ['Unassigned', 'Unassigned'];
  List<List<String>> tags = [];

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments
            as Map<dynamic, dynamic>; // TODO: surely this line can be improved
    language = data.isNotEmpty ? data['language'] : language;
    tags = data.isNotEmpty ? data['tags'] : tags;
    order = data.isNotEmpty ? data['order'] : order;

    int first = order ? 1 : 0;
    int second = order ? 0 : 1;
    return Scaffold(
        appBar: AppBar(
          title: Text("${language[first]} - ${language[second]}"),
        ),
        body: Center(
            child: ListView.separated(
                itemBuilder: (_, index) => Row(
                      children: <Widget>[
                        Text(tags[index][first]),
                        Text(tags[index][second])
                      ],
                    ),
                separatorBuilder: (_, x) => Divider(),
                itemCount: tags.length)));
  }
}
