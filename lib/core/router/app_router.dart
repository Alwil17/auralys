import 'package:auralys/core/router/routes.dart';
import 'package:auralys/features/intro/screens/loader_screen.dart';
import 'package:auralys/features/intro/screens/quote_screen.dart';
import 'package:auralys/features/intro/screens/splash_screen.dart';
import 'package:auralys/shared/error_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter _goRouter = GoRouter(
    initialLocation: APP_PAGES.splash.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: APP_PAGES.splash.toPath,
        name: APP_PAGES.splash.toName,
        builder: (context, state) => SplashScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: APP_PAGES.loader.toPath,
            name: APP_PAGES.loader.toName,
            builder: (context, state) => LoaderScreen(),
          ),
          GoRoute(
            path: APP_PAGES.quote.toPath,
            name: APP_PAGES.quote.toName,
            builder: (context, state) => QuoteScreen(),
          )
        ]
      ),
      /* GoRoute(
        path: APP_PAGES.welcome.toPath,
        name: APP_PAGES.welcome.toName,
        builder: (context, state) => WelcomeScreen(),
      ) */
    ],
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    redirect: (context, state) {
      /*final auth = context.read<AuthProvider>();
      final isLoggedIn = auth.isAuthenticated;
      final loggingIn = state.matchedLocation == Routes.login;

      if (!isLoggedIn && !loggingIn) return Routes.login;
      if (isLoggedIn && state.matchedLocation == Routes.login) return APP_PAGES.welcome.toName;*/

      return null;
    },
  );

  AppRouter();

  //late final PreferencesService appService;
  GoRouter get router => _goRouter;
}
