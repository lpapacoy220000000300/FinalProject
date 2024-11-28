import 'package:flutter/material.dart';
import 'product.dart';

class EditProductPage extends StatefulWidget {
  final Product product;
  final Function(Product) onEditProduct;

  EditProductPage({required this.product, required this.onEditProduct});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _nameController;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _quantityController =
        TextEditingController(text: widget.product.quantity.toString());
  }

  void _editProduct() {
    final name = _nameController.text;
    final quantity =
        int.tryParse(_quantityController.text) ?? widget.product.quantity;

    if (name.isNotEmpty && quantity > 0) {
      widget.onEditProduct(Product(name: name, quantity: quantity));
      Navigator.pop(context); // Go back after editing
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please provide valid details")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        backgroundColor: Colors.teal, // Custom app bar color
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Product Name TextField
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
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
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 40),

                // Save Changes Button
                ElevatedButton(
                  onPressed: _editProduct,
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.teal, // Button color
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    elevation: 5, // Adding shadow for the button
                  ),
                  child: Text("Save Changes"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
