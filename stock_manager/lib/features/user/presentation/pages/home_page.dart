import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_manager/core/services/dependencies_service.dart';
import 'package:stock_manager/features/products/presentation/pages/products_page.dart';
import 'package:stock_manager/features/sales/presentation/pages/sales_page.dart';
import 'package:stock_manager/features/suppliers/presentation/pages/supplier_page.dart';
import 'package:stock_manager/features/user/presentation/manager/user_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = getIt<UserBloc>();
  int _currentPageIndex = 1; //Iniciar en ventas
  late PageController _pageController;

  final List<Widget> _pages = [
    const SupplierPage(),
    const SalesPage(),
    const ProductsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'StockManager',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _bloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: _pages,
                  onPageChanged: (index) {
                    updateIndex(index);
                  },
                ),
              ),
              _buildBottomBar(),
            ],
          );
        },
      ),
    );
  }

  void updateIndex(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _changePage(int index) {
    updateIndex(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      height: 80,
      color: Theme.of(context).primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _pages.length,
          (index) => _buildBottomBarButton(index),
        ),
      ),
    );
  }

  Widget _buildBottomBarButton(int index) {
    Widget button;
    switch (index) {
      case 0:
        button = _buildImageAssetButton('assets/images/repartidor.png', index);
        break;
      case 1:
        button = _buildImageAssetButton('assets/images/ventas.png', index);
        break;
      case 2:
        button = _buildImageAssetButton('assets/images/productos.png', index);
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
        _changePage(index);
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
        overlayColor: MaterialStateProperty.all<Color?>(Colors.transparent)
      ),
      onPressed: () {
        _changePage(index);
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
