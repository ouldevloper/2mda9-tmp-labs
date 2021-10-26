import "package:flutter/material.dart";
import 'package:scaffold/src/searchpage.dart';
class Scaffoldpage extends StatefulWidget {
  const Scaffoldpage({ Key? key }) : super(key: key);
  @override
  _ScaffoldpageState createState() => _ScaffoldpageState();
}
class _ScaffoldpageState extends State<Scaffoldpage> {
  late Widget child;
  late int index=0;
  @override
  void initState() {
    super.initState();
    child = Container();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Search Page")
      ),
      body: child,

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("hello world");
           
        },
        child: IconButton(icon: const Icon(Icons.search),onPressed: (){
          setState(() {
            child = const Searchpage();
          });
        },),
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: index,
        fixedColor: Colors.pink.shade300,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home),  label: "Home"  ),
           BottomNavigationBarItem(icon: Icon(Icons.add),   label: "add"   ),
           BottomNavigationBarItem(icon: Icon(Icons.update),label: "update"),
           BottomNavigationBarItem(icon: Icon(Icons.delete),label: "delete"),
           BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
        ],
        onTap: (_index){
          setState(() {
            index = _index;
          });
        },
      )
    );
  }
}