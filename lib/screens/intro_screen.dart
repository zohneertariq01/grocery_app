import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 250),
          Center(
            child: Image(
              height: 180,
              width: 180,
              image: AssetImage("assets/images/grocery.png"),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            "Your One-Stop Grocery Shopping App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 5.0),
          Text(
            "Shop smart from home!",
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(height: 120.0),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 80.0),
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  "Let's Start",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
