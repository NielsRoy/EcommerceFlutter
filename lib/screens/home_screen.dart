import 'package:contador_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    const int currentIndex = 0;

    return Scaffold(
      appBar: const CustomAppBar(isHomeAppBar: true,),
      
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: const [
      
            _CategoriesGallery(),
      
            // Container(
            //   width: 200,
            //   height: 300,
            //   color: Colors.red,
            // ),
      
            // Container(
            //   width: 200,
            //   height: 300,
            //   color: Colors.green,
            // ),
      
            // Container(
            //   width: 200,
            //   height: 300,
            //   color: Colors.red,
            // ),
            
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(currentIndex: currentIndex,)
    );
  }
}

class _CategoriesGallery extends StatelessWidget {
  
  const _CategoriesGallery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const double height = 270;
    const double horizontalPadding = 18;
    const double verticalPadding = 15;
    const double horizontalGap = 12;
    const double verticalGap = 12;

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Row(
        children: [
          CategoryPanel(
            category: 'Telefonos',
            height: height,
            width: width * 0.3 - horizontalPadding,
            backgroundColor: const Color.fromRGBO(56, 196, 219, 1),
            title: 'Telefonos',
            image: Positioned(
              left: -8,
              bottom: -5,
              child: Image.asset(
                'assets/images/smartphone.png',
                width: 120,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: horizontalGap,),
          Column(
            children: [
              CategoryPanel(
                category: 'Computadoras',
                height: (height / 2) - verticalPadding - (verticalGap / 2),
                width: (width * 0.7) - horizontalPadding - horizontalGap,
                backgroundColor: const Color.fromRGBO(0, 51, 102, 1), 
                title: 'Computadoras', 
                titleColor: Colors.white, 
                titleFontWeight: FontWeight.w500,
                image: Positioned(  
                  right: -10,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/lenovo.png',
                    width: 190,
                    height: 90,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft
                  ),
                ),
              ),
              const SizedBox(height: verticalGap,),
              Row(
                children: [
                  CategoryPanel(
                    category: 'Componentes',
                    height: (height / 2) - verticalPadding - (verticalGap / 2),
                    width: (width * 0.35) - (horizontalPadding / 2) - horizontalGap,
                    backgroundColor: const Color.fromRGBO(86, 228, 204, 0.6),
                    title: 'Componentes',
                    image: Positioned(
                      left: -5,
                      bottom: -5,
                      child: Image.asset(
                        'assets/images/cpu.png',
                        width: 120,
                        height: 90,
                        fit: BoxFit.cover,
                        alignment: Alignment.topLeft
                      ),
                    ),
                  ),
                  const SizedBox(width: horizontalGap,),
                  CategoryPanel(
                    category: 'Electrodomesticos',
                    height: (height / 2) - verticalPadding - (verticalGap / 2), 
                    width: (width * 0.35) - (horizontalPadding / 2) - horizontalGap, 
                    backgroundColor: const Color.fromRGBO(255, 219, 102, 0.6), 
                    title: 'Hogar', 
                    image: Positioned(
                      right: -8,
                      bottom: -8,
                      child: Image.asset(
                        'assets/images/tv.png',
                        width: 120,
                        height: 90,
                        fit: BoxFit.cover,
                        alignment: Alignment.topLeft
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      )
    );
  }
}

