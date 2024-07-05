// product_list_tile.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListTile extends StatelessWidget {
  final DocumentSnapshot product;
  final Animation<double> animation;
  final VoidCallback onDelete;

  const ProductListTile({super.key, 
    required this.product,
    required this.animation,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: ListTile(
        title: Text(product['name']),
        subtitle: Text(product['price'].toString()),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Color.fromARGB(255, 98, 160, 246)),
          onPressed: onDelete,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/editProduct',
            arguments: {'productId': product.id},
          );
        },
      ),
    );
  }
}
