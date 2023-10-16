import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text("TAB BAR"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.contact_emergency,
                  color: Colors.green,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.people,
                  color: Colors.green,
                ),
              )
            ])),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.amber,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.brown,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.deepOrange,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.red,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.lightGreen,
                )
              ],
            ),
            ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("AISHA"),
                  subtitle: Text("20SW122"),
                  trailing: Icon(Icons.share),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("LAIBA "),
                  subtitle: Text("20SW13"),
                  trailing: Icon(Icons.share),
                ),
                ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text("ALIZA"),
                    subtitle: Text("20SW72"),
                    trailing: Icon(Icons.share)),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("LARAIB"),
                  subtitle: Text("20SW14"),
                  trailing: Icon(Icons.share),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("LOGOUT"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
