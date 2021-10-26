import 'package:flutter/material.dart';
import "package:scaffold/src/input_container.dart";

class Searchpage extends StatefulWidget {
  const Searchpage({ Key? key }) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  late String text="";
  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
          Inputcontainer(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search",   
                border: InputBorder.none,             
              ),
              onChanged: (value){
               setState(() {
                 text = value;
               });
              },
            ),        
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width*0.8,
            child: Text(text,textAlign: TextAlign.center,),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          )
          
          ],
        ),
      );
  }
}