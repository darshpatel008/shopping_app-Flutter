import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier
{
     final List<Map<String, dynamic>> cart = [];

     void addProduct(Map<String, dynamic>product){   //go to productdetail to add product in cart
       cart.add(product);
       notifyListeners();
     }

     void removeProduct(Map<String, dynamic>product){
       cart.remove(product);
       notifyListeners();
     }
}



//everyone can use this data