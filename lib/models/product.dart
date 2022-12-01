// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.serialNumber,
    required this.productName,
    this.lot,
    required this.productType,
    required this.productTypeId,
    required this.comercialCode,
    this.productStatusId,
    required this.productStatus,
    this.productFileList,
    this.rapId,
    required this.integrated,
    required this.archived,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String serialNumber;
  dynamic productName;
  dynamic lot;
  String productType;
  int productTypeId;
  String comercialCode;
  dynamic productStatusId;
  List<dynamic> productStatus;
  dynamic productFileList;
  dynamic rapId;
  bool integrated;
  bool archived;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        serialNumber: json["serialNumber"],
        productName: json["productName"],
        lot: json["lot"],
        productType: json["productType"],
        productTypeId: json["productTypeID"],
        comercialCode: json["comercialCode"],
        productStatusId: json["productStatusID"],
        productStatus: List<dynamic>.from(json["productStatus"].map((x) => x)),
        productFileList: json["productFileList"],
        rapId: json["rapID"],
        integrated: json["integrated"],
        archived: json["archived"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "serialNumber": serialNumber,
        "productName": productName,
        "lot": lot,
        "productType": productType,
        "productTypeID": productTypeId,
        "comercialCode": comercialCode,
        "productStatusID": productStatusId,
        "productStatus": List<dynamic>.from(productStatus.map((x) => x)),
        "productFileList": productFileList,
        "rapID": rapId,
        "integrated": integrated,
        "archived": archived,
      };
}
