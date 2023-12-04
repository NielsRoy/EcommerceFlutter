import 'package:contador_app/models/models.dart';
import 'package:contador_app/services/services.dart';
import 'package:contador_app/shared_preferences/preferences.dart';
import 'package:contador_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget {

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  void increase(Product product) {
    if (product.cantidad == 10) return;
    product.cantidad++;
    Preferences.updateProductQuantity('${product.id}', product.cantidad);
    setState(() {});
  }

  void decrease(Product product) {
    if (product.cantidad == 1) return;
    product.cantidad--;
    Preferences.updateProductQuantity('${product.id}', product.cantidad);
    setState(() {});
  }

  void eliminar(Product product) {
    Preferences.removeProductFromCart('${product.id}');
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {

    double total = 0;
    final List<Product> cartProducts = ModalRoute.of(context)!.settings.arguments as List<Product>;
    for (Product product in cartProducts) {
      final String key = '${product.id}';
      final int quantity = Preferences.getProductQuantity(key);
      final double price = double.parse(product.precioventa);
      total += price * quantity;

      product.cantidad = quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito', style: TextStyle(color: Colors.black)),
        elevation: 1,
        centerTitle: true,
      ),
      body: (cartProducts.isEmpty) 
      ? const Center(
          child: Text('No hay productos en el carrito', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      )
      : ListView.separated(
        itemCount: cartProducts.length,
        itemBuilder: ( _ , index) {
          final Product product = cartProducts[index];
          //final String key = '${product.id}';
          final int quantity = product.cantidad;//Preferences.getProductQuantity(key);
          final double price = double.parse(product.precioventa);
          // total += price * quantity;
          // print(total);
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (DismissDirection direction) { //En esta funcion tambien podriamos restringir el swipe a una direccion
              eliminar(product);
              cartProducts.removeAt(index);
            },
            child: ListTile(
              leading: Image.network(
                product.fullImagenUrl,
                width: 70,
              ),
              title: Text(product.nombre),
              trailing: Column(
                children: [
                  Text(
                    'Bs. ${ (price * quantity).toStringAsFixed(2) }',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            decrease(product);
                          },//decrease,
                          child: const Icon(Icons.remove, size: 20,),
                        ),
                        Text('$quantity', style: const TextStyle(fontSize: 18),),
                        GestureDetector(
                          onTap: () {
                            increase(product);
                          },//increase,
                          child: const Icon(Icons.add, size: 20,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            ),
          );
          //return Text("$key: $quantity");
        },
        separatorBuilder: ( _ , index) => const Divider(height: 0),
      ),
      bottomNavigationBar: CartNavigationBar(total: total.toStringAsFixed(2),)
    );
  }
}

