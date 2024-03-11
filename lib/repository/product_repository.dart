import 'package:azn_hollyfood_flutter_app/repository/firestore_repo.dart';
import 'package:azn_hollyfood_flutter_app/models/product.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';

class ProductRepository extends FirestoreRepositoryImpl {
  ProductRepository(super.collectionName, super.db);

  Future<Product?> findProductByField(String field, String value) async {
    await findOneByField(field, value).then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final docsRef = snapshot.docs.first;
        final Map<String, dynamic> productData =
            docsRef.data() as Map<String, dynamic>;
        productData["uid"] = docsRef.id;
        return Product.fromJson(productData);
      }
    });
    return null;
  }

  Future<List<Product?>> getProductsByField(String field, String value) async {
    try {
      await getByField(field, value).then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.map((doc) => Product.fromDocument(doc)).toList();
        }
      });
    } catch (e) {
      Log.error('Error getting product by field: $e');
    }
    return [];
  }

  Future<Product?> findOneByBarcode(String barcode) async {
    return await findProductByField('barcode', barcode);
  }

  Future<List<Product?>> getProductsByName(String productName) async {
    return await getProductsByField('name', productName);
  }

  Future<List<Product?>> getAllProducts() async {
    try {
      await getAll().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.map((doc) => Product.fromDocument(doc)).toList();
        }
      });
    } catch (e) {
      Log.error('Error getting all products: $e');
    }
    return [];
  }

  //get product by id
  Future<Product?> getProductById(String id) async {
    try {
      await getById(id).then((snapshot) {
        if (snapshot.exists) {
          return Product.fromDocument(snapshot);
        }
      });
    } catch (e) {
      Log.error('Error getting product by id: $e');
    }
    return null;
  }

  // findOneOrCreate}
  Future<void> createOrFound(Product product) async {
    try {
      await findOneByBarcode(product.barcode).then((existProduct) async {
        if (existProduct == null) {
          String id = await create(product.toDocument());
          product = product.copyWith(uid: id);
        } else {
          product = existProduct;
        }
      });
    } catch (e) {
      Log.error('Error finding or creating product: $e');
    }
  }

  //deleteProduct
  Future<void> deleteProductByBarcode(String barcode) async {
    try {
      await findOneByBarcode(barcode).then((snapshot) {
        if (snapshot != null) {
          deleteProductById(snapshot.uid);
        }
      });
    } catch (e) {
      Log.error('Error deleting product by barcode: $e');
    }
  }

  Future<void> deleteProductById(String id) async {
    try {
      await deleteById(id);
    } catch (e) {
      Log.error('Error deleting product by id: $e');
    }
  }
}
