import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  static const routeName = '/products-page';
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  dynamic size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);

    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
        ],
      ),
    );
  }
}
