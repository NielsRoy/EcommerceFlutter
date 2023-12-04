import 'package:contador_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    const int currentIndex = 2;
    
    return const Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: currentIndex,),
    );
  }
}