import 'package:go_router/go_router.dart';
import 'package:stock_manager/features/user/presentation/pages/home_page.dart';
import 'package:stock_manager/features/user/presentation/pages/test.dart';

final GoRouter router = GoRouter(initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage(),),
    GoRoute(path: '/testPage', builder: (context, state) => const TestPage(),)
  ],
);
