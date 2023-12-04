import 'package:contador_app/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'home'          : ( _ ) => const HomeScreen(),
    'category'      : ( _ ) => const ProductsScreen(),
    'product_detail': ( _ ) => const ProductDetailScreen(),
    'cart'          : ( _ ) => const CartScreen(),
    'profile'       : ( _ ) => const ProfileScreen(),
    //'failed_connection': ( _ ) => const FailedConnectionScreen(),
  };


}