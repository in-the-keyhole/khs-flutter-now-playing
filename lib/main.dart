import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:khs_flutter_web_now_playing/screens/movie_detail.dart';
import 'package:khs_flutter_web_now_playing/screens/movies.dart';
import 'package:khs_flutter_web_now_playing/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthService>.value(
      value: authService,
      child: MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Now Playing',
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  late final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const Login(),
        ),
      ),
      GoRoute(
        path: '/movies',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const Movies(),
        ),
        routes: <GoRoute>[
          GoRoute(
            path: ':id',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const MovieDetail(),
            ),
          )
        ],
      )
    ],
    redirect: (state) {
      // if the user is not logged in, they need to login
      final loggedIn = authService.isLoggedIn;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggingIn) return '/';

      // no need to redirect at all
      return null;
    },
    refreshListenable: authService,
  );
}
