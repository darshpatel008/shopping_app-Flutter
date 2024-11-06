import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_Page.dart';
import 'package:shopping_app/pages/product_List.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override

  int currentPage = 0;
  List<Widget> pages = const  [productList(),cartPage()];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: IndexedStack  // pages[currentPage] instead of using ternary operator we can use this here currentpage is 0 hence its means it access first element of list pages but here we are using indexstake which maintain scrollposition of homepage
      (
         index: currentPage,
         children:pages,  //we can use pages bcz children uses List<Widget> and pages are of same type
       ),


      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0, //label takes some space so make it 0
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value)
        {      //can't use gesture detector in bottom navigation
          setState(() {
            currentPage = value;
          });
        },
        items:const
        [
          BottomNavigationBarItem(
            icon:  Icon(Icons.home,
            size: 32,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,
            size: 32,),
            label: '',
          ),


        ],
      ),
    );

  }
}
