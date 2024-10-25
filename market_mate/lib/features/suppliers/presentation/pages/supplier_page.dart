import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  static const routeName = '/suppliers-page';

  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
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
