import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Provider/cart_provider.dart';


class Productdetail extends StatefulWidget {

  final Map<String,Object> product;


  const Productdetail({super.key,required this.product});

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {

int selectedSize = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('details'),
      ),

      body: Center(
        child: Column(
          children: [
            Text(widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,),

            const Spacer(),

            Image.asset(
                widget.product['imageUrl'] as String
                ,height: 200),

            const Spacer(flex: 3),

            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('\₹${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['size'] as List<int>).length,
                      itemBuilder: (context,index)
                      {
                        final size = (widget.product['size'] as List<int>)[index]; //widget is due to statefull widget
                        return Padding(
                          padding:  EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: ()
                            {
                                  setState(() {
                                    selectedSize = size;
                                  });
                            },

                            child: Chip(
                              label: Text(
                                  size.toString(),
                              ),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),

                        );
                      }
                  ),
                ),
                  const SizedBox(height: 2),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(
                      icon: const  Icon(Icons.shopping_cart_outlined,
                      color: Colors.black),
                        onPressed: (){

                        if(selectedSize!=0)
                        {
                          Provider.of<CartProvider>(context, listen: false)
                              .addProduct(
                              {
                                'id': widget.product['id'],
                                'title': widget.product['title'],
                                'size': widget.product['size'],
                                'price': widget.product['price'],
                                'imageUrl': widget.product['imageUrl'],
                              }

                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added Successfully'),
                              ),
                          );
                        }

                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text('Please Select a Size '),
                            )
                          );
                        }

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          fixedSize: const Size(
                             350,
                              50
                          ),
                        ),
                        label: const Text("Add to cart",
                        style: TextStyle(
                          color: Colors.black
                        ),
                        ),

                    ),
                  )

                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
