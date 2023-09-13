import 'package:cloud_firestore/cloud_firestore.dart';

class UsersWhoBoughtTheTickectModel {
  static const USERID = "id";
  static const USERNAME = "name";
  static const USEREMAIL = "email";
  static const HASATTENDED = "hasAttended";
  static const ISINSIDE = "isInSide";
  static const EVENT = "event";

  String? id;
  String? event;
  String? email;
  String? name;
  bool? hasAttended;
  bool? isInSide;

  UsersWhoBoughtTheTickectModel(
      {this.id,
      this.email,
      this.name,
      this.hasAttended,
      this.event,
      this.isInSide});

  factory UsersWhoBoughtTheTickectModel.fromMap(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;

    return UsersWhoBoughtTheTickectModel(
        id: data[USERID],
        email: data[USEREMAIL],
        name: data[USERNAME],
        hasAttended: data[HASATTENDED],
        event: data[EVENT],
        isInSide: data[ISINSIDE]);
  }

  Map<String, dynamic> toJson() => {
        USERID: id,
        USEREMAIL: email,
        USERNAME: name,
        HASATTENDED: hasAttended,
        EVENT: event,
        ISINSIDE: isInSide
      };
}
