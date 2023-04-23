import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vendor_pos/screens/home/home_screen.dart';
import 'package:vendor_pos/screens/products/create_product_screen.dart';

//Switch para generar los nombres de rutas
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _fadeRoute(const HomeScreen(), '/');
      case '/create-product':
        return _fadeRoute(CreateProductScreen(), '/create-product');
      default:
        return _fadeRoute(const HomeScreen(), '/404');
    }
  }

  //funciona para configurar el nombre y url de la ruta --- Añade un fade al transicionar de screen
  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => child,
        transitionsBuilder: (_, animation, __, ___) =>
            //Fade animación
            //is client use a web device
            kIsWeb
                //fadein
                ? FadeTransition(opacity: animation, child: child)
                //slide for smartphones
                : CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    secondaryRouteAnimation: __,
                    linearTransition: true,
                    child: child));
  }
}
