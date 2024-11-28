import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent, // Vibrant app bar color
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.teal.shade50, // Light teal background for the drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal, // Darker teal for the header
                ),
                child: Column(
                  children: [
                    Icon(Icons.store, size: 50, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "Inventory App",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Add Product",
                  style: TextStyle(color: Colors.teal),
                ),
                onTap: () => Navigator.pushNamed(context, '/add'),
              ),
              ListTile(
                title: Text(
                  "List Products",
                  style: TextStyle(color: Colors.teal),
                ),
                onTap: () => Navigator.pushNamed(context, '/list'),
              ),
              ListTile(
                title: Text(
                  "Edit Product",
                  style: TextStyle(color: Colors.teal),
                ),
                onTap: () => Navigator.pushNamed(context, '/edit'),
              ),
              ListTile(
                title: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.teal),
                ),
                onTap: () => Navigator.pushReplacementNamed(context, '/login'),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade300, Colors.teal.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to Inventory Management App",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .white, // Bright white text on gradient background
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "This app is designed to simplify and streamline the process of managing your products. Whether you're a small business owner, a warehouse manager, or just someone who needs to keep track of items, our system offers a user-friendly interface for adding, editing, and viewing products. You can efficiently manage your stock by easily adding new products, tracking existing ones, and making quick updates whenever necessary. The intuitive design ensures you spend less time navigating through the app and more time managing your inventory effectively.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors
                          .white70, // Slightly muted color for description
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/add');
                    },
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.teal, // Button color
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5, // Adding shadow for the button
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text("Go to Add Product"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
