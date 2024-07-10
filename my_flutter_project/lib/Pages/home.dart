import 'package:flutter/material.dart';
import 'package:my_flutter_project/Class/widgetClass/appBarWidget.dart';
import 'package:my_flutter_project/Class/widgetClass/drawerWidget.dart';

import 'menuPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  AppBar myAppBar(BuildContext context){
    return AppBar(
      title: Text(widget.title,
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
          )
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //leading: appBarIcon(context),
    );
  }

  Widget appBarIcon(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(spreadRadius: 2,
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/icons/MenuIcon.png", width: 30, height: 30),
        ),
      ),
      onTap: () {
        Navigator.push(context, SlidePageRoute(widget: MenuPage()),
        );
      },
    );
  }

  Widget myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this many times:'),
          Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }

  FloatingActionButton myButton(){
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const DrawerWidget(),
      body: myBody(),
      floatingActionButton: myButton(),
    );
  }
}


