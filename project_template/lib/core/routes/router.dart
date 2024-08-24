import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_template/features/user/presentation/pages/bottom_navigation_bar_page.dart';
import 'package:project_template/features/user/presentation/pages/home_page.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: HomePage.routeName,
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      pageBuilder: (context, GoRouterState state, child) {
        return buildBottomNavigationBarPage(context, state, child);
      },
      routes: [
        GoRoute(
          path: HomePage.routeName,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const HomePage(),
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
