import 'package:flutter/material.dart';

class LiveFeedDemo extends StatefulWidget {
  @override
  _LiveFeedDemoState createState() => _LiveFeedDemoState();
}

class _LiveFeedDemoState extends State<LiveFeedDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {},
              onLongPress: () {},
              child: Text(
                "Choose/capture",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
