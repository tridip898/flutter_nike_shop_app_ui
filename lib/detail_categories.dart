import 'package:flutter/material.dart';

class DetailCategories extends StatelessWidget {
  final String icon;
  const DetailCategories({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 20),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(icon),fit: BoxFit.cover)
        ),
      ),
    );
  }
}
