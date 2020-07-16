import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> lista;
  var random = new Random();

  @override
  void initState() {
    lista = _genereteList();
    super.initState();
  }

  _genereteList() => List.generate(random.nextInt(10), (i) => 'Item $i');

  Future<void> _reloadList() async{
    var newList = await Future.delayed(Duration(seconds: 2),()=>_genereteList());
    setState(() {
      lista = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView refresh"),
      ),
      body: RefreshIndicator(
        onRefresh: _reloadList,
        child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (_, int index) {
              return ListTile(
                title: Text('item ${index}'),
              );
            }),
      ),
    );
  }


}
