import 'package:contador_app/services/services.dart';
import 'package:contador_app/theme/app_theme.dart';
import 'package:contador_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {

  const ProductsScreen({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filter = ModalRoute.of(context)!.settings.arguments as String;

    final productsService = Provider.of<ProductsService>(context, listen: false);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: productsService.getProductsBySearch(filter),
        builder: ( _ , AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null){
            return const Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          }

          return const ProductsMosaic();
        },
      )
    );
  }
}
