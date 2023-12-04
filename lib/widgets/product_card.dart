import 'package:contador_app/models/models.dart';
import 'package:contador_app/providers/providers.dart';
import 'package:contador_app/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key, 
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'product_detail', arguments: product),
        child: Card(
          margin: const EdgeInsets.all(0),
          elevation: 0,
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                //color: Colors.red,
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/images/jar-loading.gif'),
                          image: NetworkImage(product.fullImagenUrl),
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 10,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: IconButton(
                          //splashColor: Colors.red,
                          onPressed: () {
                            NotificationsProvider.showSnackbar("Producto agregado al carrito");
                            Preferences.addProductToCart('${product.id}', 1);
                            //print(product.id);
                          },
                          icon: const Icon(Icons.add, size: 20, color: Colors.black,)
                        )
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bs. ${product.precioventa}', style: const TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500),),
                    Text(product.nombre, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    //Text("1un * Bs. 69,9/un", overflow: TextOverflow.ellipsis,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}