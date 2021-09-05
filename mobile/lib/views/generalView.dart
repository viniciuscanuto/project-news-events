import 'package:flutter/material.dart';
import 'package:mobile/controllers/eventController.dart';
import 'package:mobile/controllers/newsController.dart';

class GeneralView extends StatefulWidget {
  GeneralView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GeneralViewState createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {
  int _selectedIndex = 0;

  static const List<Widget> _title = <Widget>[
    Text('Notícias'),
    Text('Eventos')
  ];

  static List<Widget> _controller = <Widget>[
    NewsController(),
    EventController()
  ];
  void _onItemTapped(
    int index,
  ) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: _title.elementAt(_selectedIndex)),
      ),
      body: _controller.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Notícias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Eventos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
