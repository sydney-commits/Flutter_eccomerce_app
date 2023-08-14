import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/authentication/scaffold/login.dart';
import 'package:myapp1/authentication/scaffold/reg.dart';
import 'package:myapp1/authentication/scaffold/splash.dart';
import 'package:myapp1/authentication/scaffold/wrapper_auth.dart';
import 'package:myapp1/models/models.dart';
import 'package:myapp1/screens/account/account_screen.dart';
import 'package:myapp1/screens/account/payment/lipa_cash.dart';
import 'package:myapp1/screens/checkout/checkout_screen.dart';
import 'package:myapp1/screens/checkout/payment_init.dart';
import 'package:myapp1/screens/notifications/local_push_notification.dart';
import 'package:myapp1/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('route is ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();

      case SplashScreen1.routeName:
        return SplashScreen1.route();

        

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case AccountProfile.routeName:
        return AccountProfile.route();

      case PaymentScreen.routeName:
        return PaymentScreen.route();

      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);

      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      case RegistrationPage.routeName:
        return RegistrationPage.route();

      case WrapperAuth.routeName:
        return WrapperAuth.route();


      case LipaCashScreen.routeName:
        return LipaCashScreen.route();

        
      case PaymentInitilisation.routeName:
        return PaymentInitilisation.route();

           case Notifications123.routeName:
        return Notifications123.route();

        

        
      // case LipaCashScreen.routeName:
      //   return LipaCashScreen.route();

        



        

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('error')),
      ),
    );
  }
}
