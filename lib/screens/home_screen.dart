import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/provider/grocery_provider.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/widgets/grocery_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 78.0, right: 12.0, left: 12.0, bottom: 5),
            child: Text(
              "Welcome to FreshMart",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: GoogleFonts.abel().fontFamily),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 18.0, left: 18.0, bottom: 8.0),
            child: Text(
              "Discover a new way to shop for groceries with FreshMart.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  fontFamily: GoogleFonts.aboreto().fontFamily),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Text(
              "Healthy Items",
              style: TextStyle(
                  fontFamily: GoogleFonts.aBeeZee().fontFamily, fontSize: 18.0),
            ),
          ),
          Expanded(
            child: Consumer<GroceryProvider>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                  itemCount: value.groceryItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    return GroceryListTile(
                      name: value.groceryItems[index][0],
                      itemPrice: value.groceryItems[index][1],
                      imagePath: value.groceryItems[index][2],
                      color: value.groceryItems[index][3],
                      onPress: () {
                        Provider.of<GroceryProvider>(context, listen: false)
                            .addItemsToCart(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        },
        child: Icon(Icons.shopping_bag, color: Colors.white),
      ),
    );
  }
}
