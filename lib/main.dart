import 'package:flutter/material.dart';
import 'calendar.dart';
import 'filesharing.dart';
import 'chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _title = 'JuGuLe';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber[300],
        accentColor: Colors.cyan[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          bodyText1: TextStyle(fontSize: 22.0),
        ),
      ),
      initialRoute: '/',
      routes: {
          '/': (context) => Homepage(),
          '/calendar': (context) => Calendar(),
         // '/chat': (context) => Chat(),
//          '/files': (context) => Filesharing(),
      }
    );
  }
}

class Homepage extends StatelessWidget {
  final String title = 'JuGuLe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Logo
          Container(
            child: new Image.asset(
              'assets/images/jugule.jpg',
              width: 290.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),

          // Activities Header
          Container(
            child: Center(
                child: Text(
              'Nächste Aktivitäten',
              style: Theme.of(context).textTheme.headline6
            )),
          ),

          // Activities Body
          Container(
            width: 290.0,
            child: Column(
              children: <Activity>[
                Activity(
                    date: '02',
                    month: 7,
                    title: 'Erste Aktivität',
                    description: 'Nur so eine komische Aktivität mit Beschreibung'
                    ),
                Activity(
                    date: '14',
                    month: 6,
                    title: 'Buh',
                    description: 'Nichts',
                    ),
              ],
            ),
           ),
        ],
      ),
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
//            ListTile(
 //             title: Text('Chat'),
 //             onTap: () {
 //               Navigator.pushNamed(context, '/chat');
 //             },
 //           ),
            ListTile(
              title: Text('Kalendar'),
              onTap: () {
                Navigator.pushNamed(context, '/calendar');
              },
            ),
//            ListTile(
//              title: Text('Dateiablage'),
//              onTap: () {
//                Navigator.pushNamed(context, '/files');
//              },
//            ),
          ],
        ),
      ),
    );
  }
}

class Activity extends StatelessWidget {
  final List<String> months = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'November', 'Dezember'];
  final String date, title, description;
  final int month;

  Activity({Key key, this.date, this.month, this.title, this.description})
      : super(key: key);

  void _handleTap() {
    print("Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: _handleTap,
      child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.5),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          children: <Widget>[
                      Stack(
                        alignment: Alignment(0.1, 0.5),
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: Colors.red[500],
                            size: 50.0,
                          ),
                          Text(
                            date,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Text(months[month-1], style: Theme.of(context).textTheme.bodyText2,),
                      ],
                      ),
                      Container(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            description,
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )
   );
  }
}
