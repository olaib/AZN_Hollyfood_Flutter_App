import 'package:azn_hollyfood_flutter_app/models/department.dart';
import 'package:azn_hollyfood_flutter_app/models/status.dart';
import 'package:azn_hollyfood_flutter_app/models/product.dart';
import 'package:azn_hollyfood_flutter_app/repository/product_repository.dart';
import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController {
  final ProductRepository _productRepository;

  ProductController(
      {String productsCollection = DEPARTMENTS_COLLECTION,
      required FirebaseFirestore db})
      : _productRepository = ProductRepository(productsCollection, db);

  Future<Product?> findOneByBarcode(String barcode) async {
    return await _productRepository.findOneByBarcode(barcode);
  }

  Future<List<Product?>> getProductsByName(String productName) async {
    return await _productRepository.getProductsByName(productName);
  }

  Future<List<Product?>> getAllProducts() async {
    return await _productRepository.getAllProducts();
  }

  Future<String> createOrUpdateProduct(Product product) async {
    return await _productRepository.createOrUpdate(product.toDocument());
  }

  Future<void> deleteByBarcode(String barcode) async {
    await _productRepository.deleteProductByBarcode(barcode);
  }

  Future<void> create(Product product) async {
    await _productRepository.createOrFound(product);
  }
}

