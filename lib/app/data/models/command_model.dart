// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

class CommandModel {
  String? id;
  List<CommandProductsModel> products;
  String? clientId;
  DateTime dateTime;
  Status status;
  double prixTotal;
  String? deliveryAddress;
  CommandModel({
    this.id,
    required this.products,
    required this.clientId,
    required this.dateTime,
    required this.status,
    required this.prixTotal,
    required this.deliveryAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'clientId': clientId,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'status': toMapStatus(status),
      'prixTotal': prixTotal,
      'deliveryAddress': deliveryAddress,
    };
  }

  factory CommandModel.fromMap(Map<String, dynamic> map) {
    return CommandModel(
      id: map['id'] != null ? map['id'] as String : null,
      //i want to deug the id of this product
      products: List<CommandProductsModel>.from(
        //log the products
        // print(map['products']),
        (map['products']).map<CommandProductsModel>(
          (x) => CommandProductsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      clientId: map['clientId'] != null ? map['clientId'] as String : null,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      status: CommandModel.fromMapStatus(map['status']),
      prixTotal: double.parse(map['prixTotal'].toString()),
      deliveryAddress: map['deliveryAddress'] != null
          ? map['deliveryAddress'] as String
          : null,
    );
  }

  String getStatus() {
    return toMapStatus(status);
  }

  static Status fromMapStatus(String val) {
    switch (val) {
      case "New":
        return Status.New;
      case "Validated":
        return Status.Validated;
      case "Shipped":
        return Status.Shipped;
      case "Deliverd":
        return Status.Deliverd;
      case "Canceled":
        return Status.Canceled;
      default:
        return Status.New;
    }
  }

  String toMapStatus(Status val) {
    switch (val) {
      case Status.New:
        return "New";
      case Status.Validated:
        return "Validated";
      case Status.Shipped:
        return "Shipped";
      case Status.Deliverd:
        return "Deliverd";
      case Status.Canceled:
        return "Canceled";
      default:
        return "New";
    }
  }

  static String toStringToDisplay(Status val) {
    switch (val) {
      case Status.New:
        return Strings.commandStatusNew.tr;
      case Status.Validated:
        return Strings.commandStatusValidated.tr;
      case Status.Shipped:
        return Strings.commandStatusInProgress.tr;
      case Status.Deliverd:
        return Strings.commandStatusDelivered.tr;
      case Status.Canceled:
        return Strings.commandStatusCancelled.tr;
      default:
        return Strings.commandStatusNew.tr;
    }
  }

  String toJson() => json.encode(toMap());

  factory CommandModel.fromJson(String source) =>
      CommandModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CommandProductsModel {
  String id;
  int qte;
  double price;
  CommandProductsModel({
    required this.id,
    required this.qte,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'qte': qte,
      'price': price,
    };
  }

  factory CommandProductsModel.fromMap(Map<String, dynamic> map) {
    return CommandProductsModel(
      id: map['id'] as String,
      qte: map['qte'] as int,
      price: double.parse(map['price'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommandProductsModel.fromJson(String source) =>
      CommandProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum Status {
  New,
  Validated,
  Shipped,
  Deliverd,
  Canceled,
}
