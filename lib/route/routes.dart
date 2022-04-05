import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: _builder(settings),
      settings: settings,
      fullscreenDialog: true
    );
  }

  static WidgetBuilder _builder(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return (_) => Container();
      default:
        return (_) => Container();
    }
  }
}

class Routes {
  static const splashScreen = '/splashScreen';
}