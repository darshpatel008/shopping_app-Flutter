import 'package:flutter/material.dart';
import 'package:shopping_app/globalVariable/global_variable.dart';
import 'package:shopping_app/widget/product_Card.dart';
import 'package:shopping_app/pages/product_detail.dart';

class productList extends StatefulWidget {
  const productList({super.key});

  @override
  State<productList> createState() => _productListState();
}

class _productListState extends State<productList> {
  @override
  final List<String> filters = const ['all', 'adidas', 'nike', 'bata'];

  late String selectedFilter; //step 6

  @override
  void initState() {
    //step 7
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 255, 1),
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));

    return SafeArea(
      //it leave the space from upper side and lower side of app
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'search',
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              //step 1
              itemCount: filters.length, //step 3
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) //step 2
                  {
                final filter = filters[index];

                return Padding(
                  //step 4
                  padding: const EdgeInsets.symmetric(horizontal: 10),

                  child: GestureDetector(
                    //step 8 dont wrap with padding
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter //step 9
                          ? Theme.of(context)
                              .colorScheme
                              .primary //seed color are not there hence primary is used here ,must override seedcolor with primary color in main.dart otherwise its will gives u by default primary color
                          : Color.fromRGBO(245, 247, 249, 1),

                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15), // padding inside the chip
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(             //Layoute.builder can also be used insead of mediaquery here instead of  index use constaint then if else condition like if(constraint>=650) then return gridview else listview

            child: size.width > 650 //its gives size of device
                ? GridView.builder(         //for chrome
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,  // gives 2 product card
                      childAspectRatio: 1.85 // decrease size of product
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index]; //product variable accessing the products list
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            // push means to add a another layer and is we use push replacement we were not able to go back to the homescreen after navigating
                            MaterialPageRoute(builder:
                                (context) //for platform adaptive transition in android tansition is fade for ios its right to left
                                {
                              return Productdetail(
                                  product:
                                      product); //it opens product detail page
                            }),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: (product['price'] as num).toDouble(),
                          image: product['imageUrl'].toString(),
                          backgroundColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  )
                : ListView.builder(   //for mobile
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index]; //product variable accessing the products list
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(     // push means to add a another layer and is we use push replacement we were not able to go back to the homescreen after navigating
                            MaterialPageRoute(builder:
                                (context) //for platform adaptive transition in android tansition is fade for ios its right to left
                                {
                              return Productdetail(
                                  product: product); //it opens product detail page
                            },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: (product['price'] as num).toDouble(),
                          image: product['imageUrl'].toString(),
                          backgroundColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
