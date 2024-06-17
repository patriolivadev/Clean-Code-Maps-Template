import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_manager/core/images/images.dart';
import 'package:stock_manager/core/services/dependencies_service.dart';
import 'package:stock_manager/features/product/presentation/pages/products_page.dart';
import 'package:stock_manager/features/sales/presentation/pages/sales_page.dart';
import 'package:stock_manager/features/suppliers/presentation/pages/supplier_page.dart';
import 'package:stock_manager/features/user/presentation/manager/user_bloc.dart';

class BottomNavigationBarPage extends StatefulWidget {
  static const routeName = '/';
  final Widget child;

  const BottomNavigationBarPage({
    super.key,
    required this.child,
  });

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  final _bloc = getIt<UserBloc>();
  int _currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _bloc,
        listener: listener,
        builder: builder,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'StockManager',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 5,
    );
  }

  Widget builder(context, state) {
    return Column(
      children: [
        Expanded(child: widget.child),
      ],
    );
  }

  void listener(context, state) {
    // TODO: implement listener
  }

  void updateIndex(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _navigateToPage(int index) {
    updateIndex(index);
    switch (index) {
      case 0:
        context.go(SupplierPage.routeName);
        break;
      case 1:
        context.go(SalesPage.routeName);
        break;
      case 2:
        context.go(ProductsPage.routeName);
        break;
      default:
        break;
    }
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      height: 80,
      color: Theme.of(context).primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          3,
          (index) => _buildBottomBarButton(index),
        ),
      ),
    );
  }

  Widget _buildBottomBarButton(int index) {
    Widget button;
    switch (index) {
      case 0:
        button = _buildImageAssetButton(Images.supplierIcon, index);
        break;
      case 1:
        button = _buildImageAssetButton(Images.salesIcon, index);
        break;
      case 2:
        button = _buildImageAssetButton(Images.productIcon, index);
        break;
      default:
        button = _buildIconButton(Icons.error, index);
    }
    return button;
  }

  Widget _buildIconButton(IconData iconData, int index) {
    return IconButton(
      icon: Icon(
        iconData,
        color: _currentPageIndex == index ? Colors.black87 : Colors.grey,
        size: _currentPageIndex == index ? 40 : 30,
      ),
      onPressed: () {
        _navigateToPage(index);
      },
    );
  }

  Widget _buildImageAssetButton(String imagePath, int index) {
    String buttonText;
    switch (index) {
      case 0:
        buttonText = 'Proveedores';
        break;
      case 1:
        buttonText = 'Ventas';
        break;
      case 2:
        buttonText = 'Productos';
        break;
      default:
        buttonText = 'Error';
    }

    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color?>(Colors.transparent)),
      onPressed: () {
        _navigateToPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            color: _currentPageIndex == index ? Colors.black87 : Colors.grey,
            width: _currentPageIndex == index ? 40 : 30,
            height: _currentPageIndex == index ? 40 : 30,
          ),
          Text(
            buttonText,
            style: _currentPageIndex != index
                ? Theme.of(context).textTheme.bodySmall
                : const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
