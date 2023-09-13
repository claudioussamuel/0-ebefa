import 'package:cloud_firestore/cloud_firestore.dart';

class TickectModel {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const DESCRIPTION = "description";
  static const LOCATION = "location";
  static const CITY = "city";
  static const PRICE = "price";
  static const START_DATE = "startdate";
  static const END_DATE = "enddate";
  static const CART = "cart";
  static const ADMINID = 'adminId';
  static const PATH = "path";
  static const BUSINESS_NAME = "businessname";
  static const BANK = "bank";
  static const ACCOUNT = "account";
  static const SUBACCOUNTNUMBER = 'subaccountnumber';
  static const CONTACT = 'contact';
  static const SPLIT_CODE = 'splitcode';

  final String? id;
  final String? name;
  final Timestamp? startingdate;
  final Timestamp? endingdate;
  final String? picture;
  final String? description;
  final String? city;
  final double? price;
  final String? location;
  final DateTime? startdate;
  final DateTime? enddate;
  final String? path;
  final String? subAccountNumber;
  final String? contact;
  final String? splitCode;

  final String? adminId;
  TickectModel({
    this.startingdate,
    this.endingdate,
    this.id,
    this.name,
    this.picture,
    this.description,
    this.city,
    this.price,
    this.location,
    this.enddate,
    this.startdate,
    this.path,
    this.adminId,
    this.subAccountNumber,
    this.contact,
    this.splitCode,
  });

  factory TickectModel.fromMap(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final json = documentSnapshot.data()!;
    return TickectModel(
        id: json[ID],
        name: json[NAME],
        startingdate: json[START_DATE],
        endingdate: json[START_DATE],
        picture: json[PICTURE],
        description: json[DESCRIPTION],
        city: json[CITY],
        price: json[PRICE],
        location: json[LOCATION],
        path: json[PATH],
        adminId: json[ADMINID],
        subAccountNumber: json[SUBACCOUNTNUMBER],
        contact: json[CONTACT],
        splitCode: json[SPLIT_CODE]);
  }

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      NAME: name,
      START_DATE: startdate,
      END_DATE: enddate,
      PICTURE: picture,
      DESCRIPTION: description,
      CITY: city,
      PRICE: price,
      LOCATION: location,
      ADMINID: adminId,
      PATH: path,
      SUBACCOUNTNUMBER: subAccountNumber,
      CONTACT: contact,
      SPLIT_CODE: splitCode,
    };
  }
}
