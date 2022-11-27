import 'package:flutter/material.dart';

class ShoeCategories extends StatelessWidget {
  final String icon;
  const ShoeCategories({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(10),
            child: Image.asset(icon,height: 35,),
          ),
        ],
      ),
    );
  }
}
