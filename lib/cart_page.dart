import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'appBar.dart';
import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<CartModel>(
        builder: (context,value,child){
        return Column(
          children: [
            CustomAppbar(
              text: "Checkout",
              icon1: Icons.arrow_back_ios,
              icon2: Icons.more_vert,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(value.cartItems[index][1])),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(value.cartItems[index][2],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  IconButton(onPressed: (){
                                    Provider.of<CartModel>(context,listen: false).removeItem(index);
                                  }, icon: Icon(Icons.cancel_outlined,color: Colors.blue,))
                                ],
                              ),
                              Text("Size 42",style: TextStyle(fontSize: 17,color: Colors.grey.shade600),),
                              SizedBox(height: 2,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$"+value.cartItems[index][0],style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.all(3),
                                        child: Icon(Icons.remove),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                                      SizedBox(width: 5,),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.all(3),
                                        child: Icon(Icons.add,color: Colors.white,),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.37,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                  )
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotals for products",style: TextStyle(fontSize: 18,color: Colors.white70),),
                      Text("\$"+value.calculateTotal(),style: TextStyle(fontSize: 19,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery subtotal",style: TextStyle(fontSize: 18,color: Colors.white70),),
                      Text("free",style: TextStyle(fontSize: 19,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount vouchers",style: TextStyle(fontSize: 18,color: Colors.white70),),
                      Text("-\$",style: TextStyle(fontSize: 19,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Divider(
                    thickness: 2,
                    color: Colors.white70,
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                      Text("\$"+value.calculateTotal(),style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Checkout", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    )
                  )
                ],
              ),
            )
          ],
        );
      },)
    ));
  }
}
