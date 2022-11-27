import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  final icon1;
  final icon2;
  const CustomAppbar({Key? key, required this.text, this.icon1, this.icon2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300.withOpacity(0.6),
                borderRadius: BorderRadius.circular(50)
            ),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(icon1)),
          ),
          Text(text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300.withOpacity(0.6),
                borderRadius: BorderRadius.circular(50)
            ),
            child: IconButton(onPressed: (){},
                icon: Icon(icon2)),
          )
        ],
      ),
    );
  }
}
