import 'package:flutter/material.dart';
import 'product.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;

  ProductListPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        backgroundColor: Colors.teal, // Customized app bar color
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 8, // Adding shadow for better depth
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade100, Colors.teal.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius:
                      BorderRadius.circular(12), // Matching border radius
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  title: Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for contrast
                    ),
                  ),
                  subtitle: Text(
                    "Quantity: ${product.quantity}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70, // Muted color for subtitle
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
