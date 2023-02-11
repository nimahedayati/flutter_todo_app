import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/pages/main/main_screen.dart';
import 'package:flutter_todo_app/presentation/resources/strings_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainScreen.route:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      // case Routes.loginRoute:
      //   initLoginModule();
      //   return MaterialPageRoute(builder: (_) => LoginView());
      // case Routes.onBoardingRoute:
      //   return MaterialPageRoute(builder: (_) => OnBoardingView());
      // case Routes.registerRoute:
      //   initRegisterModule();
      //   return MaterialPageRoute(builder: (_) => RegisterView());
      // case Routes.forgotPasswordRoute:
      //   initForgotPasswordModule();
      //   return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      // case Routes.mainRoute:
      //   initHomeModule();
      //   return MaterialPageRoute(builder: (_) => MainView());
      // case Routes.storeDetailsRoute:
      //   initStoreDetailsModule();
      //   return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(title: const Text(StringsManager.noRouteFound)), body: const Center(child: Text(StringsManager.noRouteFound))));
  }
}
