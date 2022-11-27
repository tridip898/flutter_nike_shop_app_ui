import 'package:flutter/material.dart';

class ItemGrid extends StatelessWidget {
  final String itemPrice;
  final String itemImage;
  final String itemModel;
  final String rating;
  void Function()? onPressed;
  ItemGrid(
      {Key? key,
      required this.itemPrice,
      required this.itemImage,
      required this.itemModel,
      required this.rating,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(itemImage), fit: BoxFit.fill)),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + itemPrice,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      rating,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              itemModel,
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
