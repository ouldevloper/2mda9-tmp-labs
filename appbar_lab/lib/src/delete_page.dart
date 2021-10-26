import "package:flutter/material.dart";

class Deletepage extends StatelessWidget {
  const Deletepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text("Add page"),
      ),
      body:Container(
        child: const Center(child: Text("This is delete page..."),) ,
      )
    );
  }
}