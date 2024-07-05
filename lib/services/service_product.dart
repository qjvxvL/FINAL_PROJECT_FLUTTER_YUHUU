// service_product.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart'; // Import this to extend ChangeNotifier

class ProductService extends ChangeNotifier {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(String id, String name, String description,
      double price, String category) async {
    await productCollection.doc(id).set({
      'name': name,
      'description': description,
      'price': price,
      'category': category,
    });
    notifyListeners(); // Notify listeners after adding a product
  }

  Future<void> updateProduct(String id, String name, String description,
      double price, String category) async {
    await productCollection.doc(id).update({
      'name': name,
      'description': description,
      'price': price,
      'category': category,
    });
    notifyListeners(); // Notify listeners after updating a product
  }

  Future<void> deleteProduct(String id) async {
    await productCollection.doc(id).delete();
    notifyListeners(); // Notify listeners after deleting a product
  }

  Future<DocumentSnapshot> getProductById(String id) async {
    return await productCollection.doc(id).get();
  }

  Stream<QuerySnapshot> getProducts() {
    return productCollection.snapshots();
  }
}
