
import 'package:flutter/material.dart';

import '../../../Common/Model/Product.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onProductTapped;

  const ProductListView({required this.products, required this.onProductTapped});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Terms and Conditions',
            style: TextStyle(fontSize: 18),
          ),
        ),
        for (final product in products)
          ListTile(
            leading: Image.network(product.imageUrl),
            title: Text(product.title),
            onTap: () => onProductTapped(product),
          ),
      ],
    );
  }
}