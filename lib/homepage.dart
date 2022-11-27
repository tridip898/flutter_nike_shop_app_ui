import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_shoe_mobile_app_ui/cart_page.dart';
import 'package:nike_shoe_mobile_app_ui/itemGrid.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'cart_model.dart';
import 'categories.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List shoeModel=[
    ["129.00","lib/images/nike1.jpg","Nike Air Max","4.6"],
    ["137.87","lib/images/nike2.jpg","Nike Sneaker","4.4"],
    ["155.90","lib/images/nike3.jpg","Nike Air Jordan","4.3"],
    ["160.99","lib/images/nike4.jpg","Jordan 1 Mid","4.5"],
    ["147.00","lib/images/nike5.webp","Nike Air vaporMax","4.8"],
  ];
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
            child: GNav(
              padding: EdgeInsets.all(16),
                backgroundColor: Colors.deepPurple,
                tabBorderRadius: 50,
                gap: 8,
                color: Colors.grey.shade400,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.black54,
                iconSize: 28,
                textSize: 20,
                tabs: [
              GButton(icon: Icons.home_filled,
              text: "Home",
              ),
              GButton(icon: Icons.menu,
                text: "Menu",
              ),
              GButton(icon: Icons.favorite_border_rounded,
                text: "Favorite",
              ),
              GButton(icon: Icons.person_outline,
                text: "Profile",
              )
            ]),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //app bar
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade500),
                      ),
                      Text("Tridip",
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                size: 30,
                              ))),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                              },
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              ))),
                    ],
                  )
                ],
              ),
            ),
            //card
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "New Collection",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade100),
                      ),
                      Text(
                        "Discount 50% for the\nfirst transaction",
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Shop Now",
                          style: TextStyle(fontSize: 18),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade900,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          image: DecorationImage(
                              image: AssetImage("lib/images/nike1.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),

            //pageIndicator
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                controller: controller,
                count: 5,
                effect: JumpingDotEffect(),
                onDotClicked: (index){},
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",style: GoogleFonts.asul(textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                  Text("See All",style: GoogleFonts.asap(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.indigoAccent),))
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset("lib/icons/nike.png",height: 30,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text("Nike",style: TextStyle(fontSize: 20,color: Colors.grey.shade50),),
                          )
                        ],
                      ),
                    ),
                    ShoeCategories(
                      icon: "lib/icons/adidas.png",
                    ),
                    ShoeCategories(
                      icon: "lib/icons/nike.png",
                    ),
                    ShoeCategories(
                      icon: "lib/icons/art.png",
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recommendation",style: GoogleFonts.asul(textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                  Text("See All",style: GoogleFonts.asap(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.indigoAccent),))
                ],
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(builder: (context,value,child){
                return GridView.builder(
                    itemCount: value.shoeModel.length,
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.27), itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                    },
                    child: ItemGrid(
                      itemPrice: value.shoeModel[index][0],
                      itemImage: value.shoeModel[index][1],
                      itemModel: value.shoeModel[index][2],
                      rating: value.shoeModel[index][3],
                      onPressed: (){
                        Provider.of<CartModel>(context,listen: false).addItem(index);
                      },
                    ),
                  );
                });
              },)
            )
          ],
        ),
      ),
    );
  }
}
