import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_manager/features/products/presentation/pages/products_page.dart';
import 'package:stock_manager/features/sales/presentation/pages/sales_page.dart';
import 'package:stock_manager/features/suppliers/presentation/pages/supplier_page.dart';
import 'package:stock_manager/features/user/presentation/pages/bottom_navigation_bar_page.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      pageBuilder: (context, GoRouterState state, child) {
        return buildBottomNavigationBarPage(context, state, child);
      },
      routes: [
        GoRoute(
          path: ProductsPage.routeName,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ProductsPage(),
            );
          },
          parentNavigatorKey: shellNavigatorKey,
        ),
        GoRoute(
          path: SalesPage.routeName,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const SalesPage(),
            );
          },
          parentNavigatorKey: shellNavigatorKey,
        ),
        GoRoute(
          path: SupplierPage.routeName,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const SupplierPage(),
            );
          },
          parentNavigatorKey: shellNavigatorKey,
        ),
      ],
    ),
  ],
);

CustomTransitionPage<dynamic> buildBottomNavigationBarPage(
    BuildContext context, GoRouterState state, Widget child) {
  return buildPageWithDefaultTransition<void>(
    context: context,
    state: state,
    child: BottomNavigationBarPage(
      child: child,
    ),
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
