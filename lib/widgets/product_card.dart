import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('کارت محصول'),
          Text('قیمت: 10000 تومان'),
        ],
      ),
    );
  }
}
