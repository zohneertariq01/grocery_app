import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/provider/grocery_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black, size: 28.0),
          centerTitle: true,
        ),
        body: Consumer<GroceryProvider>(builder: (context, value, child) {
          return value.cartItems.length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 140.0,
                        width: 140.0,
                        image: AssetImage("assets/images/cart.png"),
                      ),
                      SizedBox(height: 8.0),
                      Text("Sorry! your cart is empty"),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 18.0, left: 18.0, bottom: 8.0),
                      child: Text(
                        "My Cart",
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.notoSerif().fontFamily),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.all(12.0),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: value.cartItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(
                                    value.cartItems[index][0],
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.aBeeZee().fontFamily),
                                  ),
                                  leading: Image(
                                    height: 36,
                                    image:
                                        AssetImage(value.cartItems[index][2]),
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      value.removeItemsToCart(index);
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                                  subtitle:
                                      Text("\$" + value.cartItems[index][1]),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            padding: EdgeInsets.all(12.0),
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontFamily: GoogleFonts.aBeeZee().fontFamily,
                        color: Colors.white,
                      ),
                    ),
                    Consumer<GroceryProvider>(builder: (context, value, child) {
                      return Text(
                        "\$" + value.calculateItems(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                        ),
                      );
                    }),
                  ],
                ),
                Container(
                  height: 45.0,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
