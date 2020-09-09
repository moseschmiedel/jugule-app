import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                    title: Text('Chat'),
                    ),
            body: Center(child: Text('Das ist der Chat'),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Navigation'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('Start'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
            ),
            ListTile(
              title: Text('Kalendar'),
              onTap: () {
                Navigator.pushNamed(context, '/calendar');
              },
            ),
            ListTile(
              title: Text('Dateiablage'),
              onTap: () {
                Navigator.pushNamed(context, '/files');
              },
            ),
          ],
        ),
        ),
            );
  }
}
