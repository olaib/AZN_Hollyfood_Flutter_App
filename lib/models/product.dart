import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {

  factory Product({
    @Default('') String uid,
    required String name,
    required String barcode,
    required int quantity,
    required double price,
    required String imageUrl,
  }
) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  factory Product.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Product.fromJson(data).copyWith(uid: doc.id);
  }

  factory Product.fromSheets(List<dynamic> record) {
    return Product(
      name: record[0].toString(),
      barcode: record[1].toString(),
      quantity: int.parse(record[2].toString()),
      price: double.parse(record[3].toString()),
      imageUrl: record[4].toString(),
    );
  }

  Map<String, dynamic> toDocument() => toJson()..remove('uid');
}