import 'package:core_encode/core_encode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_mate/core/services/dependencies_service.dart';
import 'package:market_mate/core/utils/themes.dart';
import 'package:market_mate/core/widgets/loading_widget.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';
import 'package:market_mate/features/sales/presentation/manager/sales_bloc.dart';
import 'package:market_mate/features/sales/presentation/widgets/sale_item_builder_widget.dart';

class SalesPage extends StatefulWidget {
  static const routeName = '/';

  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final SalesBloc _bloc = getIt<SalesBloc>();
  List<Sale> sales = [
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 120),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 410),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 2500),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 105),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 103),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 1220),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 110),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 7810),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 160),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 1540),
    // SaleModel(
    //     id: '1', productsIds: ['1', '2'], date: DateTime.now(), totalPrice: 1320),
  ];
  dynamic size;

  @override
  void initState() {
    // _bloc.add(ActionGetSales(noParams: NoParams()));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer(
        bloc: _bloc,
        listener: listener,
        builder: builder,
      ),
    );
  }

  void listener(context, state) {
    switch(state.runtimeType){
      case OnGetSales:
        sales = (state as OnGetSales).sales;
        break;
      case OnGetSalesFailure:
        print('FALLO EN GETSALES');
        break;
    }
  }

  Widget builder(context, state) {
    switch(state.runtimeType){
      case const (OnLoading):
        return const LoadingWidget();
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          buildListView(),
          buildAddSaleButton(),
        ],
      ),
    );
  }

  Widget buildListView() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundAppColor3,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListView.separated(
        itemCount: sales.length,
        itemBuilder: itemBuilder,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget? itemBuilder(context, index) {
    return SaleItemBuilder(
      sales: sales,
      index: index,
    );
  }

  Center buildTitle() {
    return const Center(
        child: Text(
      'Ventas',
      style: AppTheme.titleTheme,
    ));
  }

  Positioned buildAddSaleButton() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: FloatingActionButton(
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
