import 'package:contador_app/providers/providers.dart';
import 'package:contador_app/router/app_routes.dart';
import 'package:contador_app/services/services.dart';
import 'package:contador_app/shared_preferences/preferences.dart';
import 'package:contador_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const AppState()); 
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ProductsService(), lazy: false,),//TODO: Probar si funciona con lazy true
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
    ));

    return MaterialApp(
      scaffoldMessengerKey: NotificationsProvider.messengerKey, //!para poder mostrar los snapbars en cualquier lugar

      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      // theme: ThemeData(
      //   fontFamily: 'Poppins' 
      //   // colorScheme: ColorScheme.fromSwatch().copyWith(
      //   //   primary: Colors.white,
      //   // )
      // ),
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      //onGenerateRoute: ,
    );
  }
}

