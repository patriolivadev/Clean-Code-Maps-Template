import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_mate/core/images/images.dart';
import 'package:market_mate/core/services/dependencies_service.dart';
import 'package:market_mate/core/utils/themes.dart';
import 'package:market_mate/core/widgets/custom_app_bar.dart';
import 'package:market_mate/features/product/presentation/pages/products_page.dart';
import 'package:market_mate/features/sales/presentation/pages/sales_page.dart';
import 'package:market_mate/features/suppliers/presentation/pages/supplier_page.dart';
import 'package:market_mate/features/user/presentation/manager/user_bloc.dart';

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
  dynamic size;
  dynamic titles = ['Proveedores', 'Ventas', 'Productos'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppBar(title: titles[_currentPageIndex]),
      backgroundColor: AppTheme.backgroundAppColor,
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _bloc,
        listener: listener,
        builder: builder,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget builder(context, state) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: size.width * 1,
        decoration: BoxDecoration(
          color: AppTheme.backgroundAppColor2,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.child
      ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.005, vertical: size.height * 0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BottomAppBar(
          color: AppTheme.backgroundAppColor3,
          height: size.height * 0.1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
                  (index) => _buildBottomBarButton(index),
            ),
          ),
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
        button = _buildErrorIconButton(Icons.error, index);
    }
    return button;
  }

  Widget _buildErrorIconButton(IconData iconData, int index) {
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
          overlayColor: WidgetStateProperty.all<Color?>(Colors.transparent)),
      onPressed: () {
        _navigateToPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            color: _currentPageIndex == index
                ? AppTheme.primaryColor
                : Colors.grey,
            width: _currentPageIndex == index ? 40 : 30,
            height: _currentPageIndex == index ? 40 : 30,
          ),
          Text(
            buttonText,
            style: _currentPageIndex != index
                ? Theme.of(context).textTheme.bodySmall
                : const TextStyle(color: AppTheme.primaryColor),
          )
        ],
      ),
    );
  }
}
