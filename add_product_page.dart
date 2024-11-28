import 'package:flutter/material.dart';
import 'product.dart';

class AddProductPage extends StatefulWidget {
  final Function(Product) onAddProduct;

  AddProductPage({required this.onAddProduct});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  void _addProduct() {
    final name = _nameController.text;
    final quantity = int.tryParse(_quantityController.text) ?? 0;

    if (name.isNotEmpty && quantity > 0) {
      widget.onAddProduct(Product(name: name, quantity: quantity));
      Navigator.pop(context); // Go back to previous screen after adding product
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please provide valid details")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
        elevation: 0,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                constraints:
                    BoxConstraints(maxWidth: 400), // Max width for the form
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.95), // Semi-transparent background
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Product Name TextField
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Product Name",
                        labelStyle: TextStyle(color: Colors.teal),
                        filled: true,
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Product Quantity TextField
                    TextField(
                      controller: _quantityController,
                      decoration: InputDecoration(
                        labelText: "Quantity",
                        labelStyle: TextStyle(color: Colors.teal),
                        filled: true,
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 30),

                    // Add Product Button
                    ElevatedButton(
                      onPressed: _addProduct,
                      style: ElevatedButton.styleFrom(
                        iconColor: Colors.teal, // Button color
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        elevation: 5, // Adding shadow for the button
                      ),
                      child: Text("Add Product"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
