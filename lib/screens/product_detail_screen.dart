import 'package:contador_app/models/models.dart';
import 'package:contador_app/services/services.dart';
import 'package:contador_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  
  const ProductDetailScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              final productsService = Provider.of<ProductsService>(context, listen: false);
              productsService.getCartProducts();
              Navigator.pushNamed(context, 'cart', arguments: productsService.cartProducts);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 22, 
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(product.fullImagenUrl),
                  height: size.height * 0.35,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                  Text(product.nombre, style: const TextStyle(fontSize: 22),),  //TODO: Revisar app peliculas en Deatil Screen para ver sobre textTheme.subtitle, headline5 , etc
                  const SizedBox(height: 5,),
                  Text('Bs. ${product.precioventa}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600,)),
                  const SizedBox(height: 10,),
                  Text(product.descripcion, style: const TextStyle(fontSize: 16), maxLines: 4, textAlign: TextAlign.justify, overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5,),
                  Text('Marca: ${product.marca}', style: const TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text('Disponibles: ${product.stock}', style: const TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProductDetailNavigationBar(
        size: size,
        productId: '${product.id}',
        price: double.parse(product.precioventa),
      )
    );
  }
}