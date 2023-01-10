import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingExpansionTile extends StatefulWidget {
  final List<String> tags;

  LoadingExpansionTile(this.tags);

  @override
  _LoadingExpansionTileState createState() => _LoadingExpansionTileState();
}

class _LoadingExpansionTileState extends State<LoadingExpansionTile> {
  List data = [];
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: <Widget>[Text(widget.tags[0]), Text(widget.tags[1])],
      ),
      children: <Widget>[
        (() {
          if (!loaded) {
            return Center(
                child: SpinKitWave(
                    color: Colors.blue, type: SpinKitWaveType.start));
          } else {
            return Text('Birth of the Sun');
          }
        }())
      ],
      onExpansionChanged: (bool expanded) async {
        await Future.delayed(
            const Duration(seconds: 1)); // Simulating getting tag words
        List dbResponse = ['Big Bang', 'Birth of the Sun', 'Earth is Born'];
        setState(() {
          data = dbResponse;
          loaded = true;
        });
      },
    );
  }
}
