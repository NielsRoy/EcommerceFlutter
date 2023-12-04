import 'package:contador_app/providers/providers.dart';
import 'package:contador_app/shared_preferences/preferences.dart';
import 'package:contador_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductDetailNavigationBar extends StatefulWidget {
  const ProductDetailNavigationBar({
    Key? key,
    required this.size,
    required this.productId,
    required this.price, 
  }) : super(key: key);

  final Size size;
  final String productId;
  final double price;

  @override
  State<ProductDetailNavigationBar> createState() => _ProductDetailNavigationBarState();
}

class _ProductDetailNavigationBarState extends State<ProductDetailNavigationBar> {
  int count = 1;
  
  void increase() {
    if (count == 10) return;
    count++;
    setState(() {});
  }

  void decrease() {
    if (count == 1) return;
    count--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    decrease();
                    //print("decementar cantidad");
                  },
                  icon: const Icon(Icons.remove, size: 22,),
                ),
                const SizedBox(width: 10,),
                Text('$count', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: () {
                    increase();
                    //print("incrementar cantidad");
                  },
                  icon: const Icon(Icons.add, size: 22,),
                ),
              ],
            )
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: AppTheme.primaryColor,
              minimumSize: Size(widget.size.width * 0.55, 70),
              maximumSize: Size(widget.size.width * 0.55, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Preferences.addProductToCart(widget.productId, count);
              if (count == 1) {
                NotificationsProvider.showSnackbar("Producto agregado al carrito");
              } else {
                NotificationsProvider.showSnackbar("Productos agregados al carrito");
              }
              //print("Agregar al carrito");
            },
            child: Text('Agregar Bs. ${ (widget.price * count).toStringAsFixed (2) }', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16))
          ),
        ],
      ),
    );
  }
}