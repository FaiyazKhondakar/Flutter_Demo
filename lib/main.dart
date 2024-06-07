import 'package:flutter/material.dart';
import 'package:module_6/HomeRoute.dart';
import 'package:module_6/LoginRoute.dart';
import 'package:module_6/ProductsRoute.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/products',
      routes: {
        '/home' :(context)=>HomeRoute(),
        '/login':(context)=>LoginRoute(),
        '/products':(context)=>ProductsRoute(),
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber
        ),
        scaffoldBackgroundColor: Colors.yellow,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.amber,
          ),

          ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.amber,
        ),
        // primarySwatch: Colors.black,
        ),
      );
  }

}


