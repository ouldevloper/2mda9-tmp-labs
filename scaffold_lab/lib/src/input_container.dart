import 'package:flutter/material.dart';

class Inputcontainer extends StatelessWidget {
  final Widget child;
  const Inputcontainer({ Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width:          size.width*0.8,
      padding:        const EdgeInsets.symmetric(vertical: 0,horizontal: 2),
      margin:         const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      child:          child,
      decoration:     BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:        Colors.white10,
        border:       Border.all(
          color:      Colors.grey,
          width:      0.5,
        ),
      ), 
    );    
  }
}