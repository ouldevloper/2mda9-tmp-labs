import 'package:appbar_lab/src/add_page.dart';
import 'package:appbar_lab/src/update_page.dart';
import 'package:appbar_lab/src/delete_page.dart';
import 'package:appbar_lab/src/search_page.dart';
import 'package:flutter/material.dart';

import 'delete_page.dart';

class Appbarui extends StatefulWidget {
  const Appbarui({ Key? key }) : super(key: key);

  @override
  _AppbaruiState createState() => _AppbaruiState();
}
class _AppbaruiState extends State<Appbarui> {
  String title="Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Colors.pink,
        title: Text(title),
        actions:  <Widget>[
        IconButton(onPressed: (){ 
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Addpage()));
          });
        }, icon: const Icon(Icons.add)),
        IconButton(onPressed: (){ 
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Deletepage()));
          });
        }, icon: const Icon(Icons.delete)
        ),
        IconButton(onPressed: (){ 
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Updatepage()));
          });
        }, icon: const Icon(Icons.update)),
        IconButton(onPressed: (){ 
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Searchpage()));
          });
        }, icon: const Icon(Icons.delete)),
      ],),
    body:Container(
      alignment: AlignmentDirectional.center,
      child: Center(
        child: Text(
          "This is $title page",
          style: const TextStyle(
            fontSize: 25,
            fontFamily: "arial",
            fontWeight: FontWeight.bold
          ),
          )
      )
    ,) ,

    );
  }
}