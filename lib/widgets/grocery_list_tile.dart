import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryListTile extends StatelessWidget {
  final String name, itemPrice, imagePath;
  final color;
  VoidCallback onPress;
  GroceryListTile({
    super.key,
    required this.name,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: color[100],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Image(
                  height: 60.0,
                  image: AssetImage(imagePath),
                ),
              ),
              SizedBox(height: 12.0),
              Text(name),
              SizedBox(height: 8.0),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                height: 30.0,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "\$" + itemPrice,
                    style: TextStyle(
                        fontFamily: GoogleFonts.abel().fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
