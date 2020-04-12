import 'package:flutter/material.dart';

import 'models/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  var items = new List<Item>();

  Home() {
    items = [];
    items.add(Item(title: "Item 1", isDone: false));
    items.add(Item(title: "Item 2", isDone: true));
    items.add(Item(title: "Item 3", isDone: false));
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextFormField(
        controller: newTaskController,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          labelText: "Adicionar nova tarefa",
          labelStyle: TextStyle(color: Colors.white),
        ),
      )),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];

          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.isDone,
            onChanged: (value) {
              setState(() {
                item.isDone = value;
              });
            },
          );
        },
      ),
    );
  }
}
