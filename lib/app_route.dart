import 'package:flutter/material.dart';
import 'package:toko_netzme/view/Camera/PreviewImageScreen.dart';
import 'package:toko_netzme/view/Camera/TakePictureScreen.dart';
import 'package:toko_netzme/view/Container.dart';
import 'package:toko_netzme/view/Payment/payment.dart';
import 'package:toko_netzme/view/Payment/payment_success_widget.dart';
import 'package:toko_netzme/view/home.dart';
import 'package:toko_netzme/view/pos_widget.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ContainerWidget());
      case '/payment':
      // Validation of correct data type
        if (args is Map) {
          return MaterialPageRoute(
            builder: (_) => PaymentWidget(arguments: args),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/payment.success':
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => PaymentSuccessWidget(args),
          );
        }
        return _errorRoute();
      case '/payment.camera':
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => CameraPage(args),
          );
        }
        return _errorRoute();
      case '/payment.camera.preview':
        if (args is Map) {
          return MaterialPageRoute(
            builder: (_) => PreviewImageScreen(arguments: args),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeWidget(),
        );
      case '/pos':
        return MaterialPageRoute(
          builder: (_) => POSWidget(),
        );
      case '/underConstruction':
        return _underConstructionRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static Route<dynamic> _underConstructionRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('under construction'),
        ),
      );
    });
  }
}