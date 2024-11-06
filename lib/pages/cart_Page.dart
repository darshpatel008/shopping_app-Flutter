import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Provider/cart_provider.dart';



class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
   final cart =Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar:AppBar(
        title: Text('shopping cart'),
      ),
      body: ListView.builder(
         itemCount: cart.length,
          itemBuilder:(context,index)
      {
        final cartItem = cart[index]; //carditem accessing cart here
        return ListTile

          (
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl'] as String? ?? 'assets/default_image.png'),
            radius: 40,//cant use image.asset here bcz it is a widget
          ),

          trailing: IconButton(
            onPressed: (){
              showDialog(context: context, builder: (context)
              {
                return AlertDialog(
               title: Text("Delete Product",
               style: Theme.of(context).textTheme.titleMedium,),
                  content: const Text(
                      'are you sure you want to remove it from cart'),
                  actions: [
                    TextButton(onPressed: ()
                    {
                      Navigator.of(context).pop(); //if u click anywhere on no this alert message gone away
                    },
                        child: const Text(
                            'No',
                            style: TextStyle(color: Colors.blue)
                        ),
                    ),
                    TextButton(onPressed: (){
                      Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                      Navigator.of(context).pop();                //if u click anywhere yes this alert message gone away
                    },
                        child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.red),
                        ),
                    )
                  ],

                );
              },
              );
            },
            icon: const Icon
              (Icons.delete,
            color: Colors.red,
            ),
          ),

          title: Text
            (cartItem['title'].toString(),
               style: Theme.of(context).textTheme.bodySmall,
            ),
          subtitle: Text('size: ${cartItem['size']}',
               style: Theme.of(context).textTheme.bodySmall,
          ),
          );
      },
      ),

    );
  }
}
