import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Provider/cart_provider.dart';
import 'package:shopping_app/pages/homePage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider() ,
      child: MaterialApp(
      
        debugShowCheckedModeBanner: false,
      
        title: 'Shopping App',
      
        theme: ThemeData(
      
      
      
         useMaterial3: true,
      
      
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
      
      
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                prefixIconColor: Color.fromRGBO(119, 199, 199, 1),
            ),
      
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
                bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
            )
      
            ),
      
            fontFamily: 'Lato',
      
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(254, 206, 1, 1),
              primary: Color.fromRGBO(254, 206, 1, 1),
            ),
        ),
      
        home:homePage(),           //ProductDetailPage(product = products[0]) this is how product is able to access products
      ),
    );
  }
}
