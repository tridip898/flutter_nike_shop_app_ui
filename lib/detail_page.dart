import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_shoe_mobile_app_ui/size.dart';

import 'appBar.dart';
import 'cart_page.dart';
import 'detail_categories.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //app bar
            CustomAppbar(
                text: "Details",
              icon1: Icons.arrow_back_ios,
              icon2: Icons.favorite_border_rounded,
            ),
            //image
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height*0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage("lib/images/nike1.jpg"),fit: BoxFit.fill)
              ),
            ),
            //categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DetailCategories(
                    icon: "lib/images/nike9.jpg",
                  ),
                  DetailCategories(
                    icon: "lib/images/nike2.jpg",
                  ),
                  DetailCategories(
                    icon: "lib/images/nike3.jpg",
                  ),
                  DetailCategories(
                    icon: "lib/images/nike7.jpg",
                  ),
                  DetailCategories(
                    icon: "lib/images/nike8.jpg",
                  ),
                ],
              ),
            ),
            //title
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nike Air Max",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text("Sepatu Olahraga",style: TextStyle(fontSize: 18,color: Colors.grey.shade700),)
                    ],
                  ),
                  Text("\$129.00",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Size",style: GoogleFonts.asul(textStyle: TextStyle(fontSize: 22),)),
                  Text("Size chart",style: GoogleFonts.asap(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.indigoAccent),))
                ],
              ),
            ),

            //size
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ShoeSize(size: 38),
                  ShoeSize(size: 39),
                  ShoeSize(size: 40),
                  ShoeSize(size: 41),
                  ShoeSize(size: 42),
                  ShoeSize(size: 43),
                ],
              ),
            ),
            //text
            Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
                child: Container(
                  child: Text("The Rockies commonly known as the Rockies, are a mountain range that extends east of north America. More than 300 miles.",style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                ),
              ),
            )),
            //bottom button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Image.asset("lib/icons/shopping-cart.png",height: 40,),
                  ),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)
                          ),
                            padding: EdgeInsets.all(20),
                            child: Text("Buy now",textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: Colors.white),)),
                      ))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
