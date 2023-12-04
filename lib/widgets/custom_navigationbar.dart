import 'package:contador_app/services/services.dart';
import 'package:contador_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex; 

  const CustomNavigationBar({
    Key? key, 
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
      //padding: const EdgeInsets.symmetric(vertical: 7),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: ( ) => Navigator.pushReplacementNamed(context, 'home'),
              icon: const Icon(Icons.home_filled),
              //tooltip: 'Inicio',
              padding: EdgeInsets.zero,
            ),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: ( ) {
                final productsService = Provider.of<ProductsService>(context, listen: false);
                productsService.getCartProducts();
                Navigator.pushNamed(context, 'cart', arguments: productsService.cartProducts);
              },
              icon: const Icon(Icons.shopping_cart),
              //tooltip: 'Carrito',
              padding: EdgeInsets.zero,
            ),
            label: 'Carrito'
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: ( ) => Navigator.pushReplacementNamed(context, 'profile'),
              icon: const Icon(Icons.person),
              //tooltip: 'Mi Perfil',
              padding: EdgeInsets.zero,
            ),
            label: 'Mi perfil'
          ),
        ],
      ),
    );
  }
}