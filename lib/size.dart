import 'package:flutter/material.dart';

class ShoeSize extends StatelessWidget {
  final int size;
  const ShoeSize({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 10,bottom: 10),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(12),
        child: Text(size.toString(),style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
      ),
    );
  }
}
