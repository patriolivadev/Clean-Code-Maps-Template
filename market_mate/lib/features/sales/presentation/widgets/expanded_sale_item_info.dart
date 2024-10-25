import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_mate/core/utils/themes.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';

class ExpandedSaleItemInfoDialog extends StatelessWidget {
  final List<Sale> sales;
  final int index;

  const ExpandedSaleItemInfoDialog({
    super.key,
    required this.sales,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Productos',
                  style: AppTheme.subtitleTheme,
                ),
                InkWell(
                  onTap:() => context.pop(),
                  child: const Icon(Icons.close, size: 20,),
                ),
              ],
            ),
            const Divider(),
            buildListView(context),
          ],
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    return ListView.separated(
      itemCount: sales[index].productsIds.length,
      itemBuilder: (context, productIndex) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sales[index].productsIds[productIndex],
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                '\$${sales[index].productsIds[productIndex]}',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}

void showExpandedSaleItemInfoDialog(
    BuildContext context, List<Sale> sales, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ExpandedSaleItemInfoDialog(
        sales: sales,
        index: index,
      );
    },
  );
}
