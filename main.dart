import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = 'None clicked';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawer: Drawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.car_repair),
                text: 'Car Repair',
              ),
              Tab(
                icon: Icon(Icons.home_repair_service),
                text: 'Home Repair Serice',
              ),
              Tab(
                icon: Icon(Icons.room_service),
                text: 'Room Service',
              ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/images/logo.png')),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    text = 'Casting Clicked';
                  });
                },
                icon: Icon(Icons.cast)),
            IconButton(
                onPressed: () {
                  setState(() {
                    text = 'Notifications Clicked';
                  });
                },
                icon: Icon(Icons.notifications)),
            IconButton(
                onPressed: () {
                  setState(() {
                    text = 'Search Clicked';
                  });
                },
                icon: Icon(Icons.search)),
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              );
            }),
          ],
          title: Text('Flutter'),
          backgroundColor: Colors.blueGrey,
        ),
        body: TabBarView(children: [
          Center(child: Text('Car Repair - $text'),),
          Center(child: Text('Home Repair - $text'),),
          Center(child: Text('Room Service - $text'),)
        ],)
      ),
    );
  }
}
