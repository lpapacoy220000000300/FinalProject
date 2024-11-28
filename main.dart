import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'add_product_page.dart';
import 'product_list_page.dart';
import 'edit_product_page.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> products = [];

  void _addProduct(Product product) {
    setState(() {
      products.add(product);
    });
  }

  void _editProduct(Product product) {
    setState(() {
      products =
          products.map((p) => p.name == product.name ? product : p).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/add': (context) => AddProductPage(onAddProduct: _addProduct),
        '/list': (context) => ProductListPage(products: products),
        '/edit': (context) => EditProductPage(
              product: products.isEmpty
                  ? Product(name: "", quantity: 0)
                  : products[0],
              onEditProduct: _editProduct,
            ),
      },
    );
  }
}
