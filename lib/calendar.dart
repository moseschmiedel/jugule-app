import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  @override
  //TODO: implement Calendar Widget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalendar'),
      ),
      body: Center(
        child: CalendarPage(),
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
//              title: Text('Chat'),
//              onTap: () {
//                Navigator.pushNamed(context, '/chat');
//              },
//            ),
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

class CalendarPage extends StatefulWidget {
  final int prevDayCount =
      5; //Amount of days to fill the first week of the month
  final int dayCount = 30; //Amount of days in the month
  final int nextDayCount =
      7; //Amount of days to fill the last week of the month
  final int prevAllDayCount = 31; //Amount of days in the previous month
  final int nextAllDayCount = 31; //Amount of days in the next month

  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  int _selectedIndex;
  void _setSelectedDay(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: List.generate(widget.prevDayCount + widget.dayCount + widget.nextDayCount, (index) {
        return Center(
          child: CalendarDay(
            displayDay: (index < widget.prevDayCount
                ? widget.prevAllDayCount - (widget.prevDayCount - index) + 1
                : (index > widget.prevDayCount + widget.dayCount - 1
                    ? index - (widget.dayCount + widget.prevDayCount) + 1
                    : index - widget.prevDayCount + 1)),
            available: (index < widget.prevDayCount
                ? false : (index > widget.prevDayCount + widget.dayCount - 1 ? false : true)),
            index: index,
            current: false, //TODO: get real day from Date
            selected: (_selectedIndex == index),
            onSelected: _setSelectedDay,
          ),
        );
      }),
    );
  }
}

class CalendarDay extends StatelessWidget {
  CalendarDay({Key key, this.index, this.displayDay, this.available, this.current, this.selected, @required this.onSelected}) : super(key: key);

  final int displayDay;
  final int index;
  final bool available;
  final bool current;
  final bool selected;
  final ValueChanged<int> onSelected;

  void _handleTap() {
    onSelected(index);
  }

  void _handleTapDown(TapDownDetails details) {
  }

  void _handleTapCancel() {
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(4.0),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(3.0),
          color: (selected && available ? Colors.amber[600] : (current ? Colors.grey[700] : Colors.grey[800])),
        ),
        child: Text(displayDay.toString(), style: TextStyle(color: (available ? Colors.white : Colors.grey[600]))),
      ),
    );
  }
}
