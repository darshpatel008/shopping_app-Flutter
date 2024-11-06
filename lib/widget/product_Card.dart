//cards on homescreen



import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;

  const ProductCard({super.key,
  required this.title,
  required this.price,
  required this.image,
  required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(25),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:backgroundColor ,
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:Theme.of(context).textTheme.titleMedium ,
            ),

            const SizedBox(height: 5),

            Text('\₹ $price',
                style:Theme.of(context).textTheme.titleMedium),

            const SizedBox(height: 5),


            Center(                    //wrap image with center
              child: Image.asset(
                image,
                height: 175,
              ),
            )
          ],
        ),
      ),
    );
  }
}
