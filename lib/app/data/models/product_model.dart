// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';

class ProductModel {
  String? id;
  List<dynamic>? images;
  String? name;
  int? quantity;
  double? price;
  double? promoPrice;
  // double? unitPrice;
  int? qtePerEmbalage;
  String? embalage;
  String? unit;
  String? type;
  String? category;
  ProductModel(
      {this.id,
      this.images,
      this.name,
      this.quantity,
      this.price,
      this.type,
      // this.unitPrice,
      this.qtePerEmbalage,
      this.embalage,
      this.category,
      this.unit,
      this.promoPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images,
      'label': name,
      'type': type,
      'quantity': quantity,
      'price': price,
      'promoPrice': promoPrice,
      'qtePerEmbalage': qtePerEmbalage,
      'embalage': embalage,
      'unit': unit,
      'category': category,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      images: map['imageUrls'] != null
          ? map['imageUrls'].isEmpty
              ? [
                  "https://firebasestorage.googleapis.com/v0/b/eurlplast.appspot.com/o/Realistic-Plastic-Cup-Mockup-PSD-Graphics-5854492-1.jpg?alt=media&token=e5d205cf-d279-46c8-9ee3-7ab1b608234d"
                ]
              : List<String>.from((map['imageUrls']))
          : null,
      name: map['label'] != null ? map['label'] as String : null,
      quantity: 0,
      //quantity: map['quantity'] != null ? map['quantity'] as int : null,
      price:
          map['price'] != null ? double.parse((map['price']).toString()) : null,
      promoPrice: map['promoPrice'],
      qtePerEmbalage:
          map['qtePerEmbalage'] != null ? map['qtePerEmbalage'] as int : null,
      embalage: map['embalage'] != null ? map['embalage'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
      type: map['type'] as String?,
      category: map['category'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
