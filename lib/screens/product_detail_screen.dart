import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Product Detail Screen'),
            ElevatedButton(
              onPressed: () {
                // Implement edit product navigation
              },
              child: const Text('Edit Product'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement delete product logic
              },
              child: const Text('Delete Product'),
            ),
          ],
        ),
      ),
    );
  }
}
