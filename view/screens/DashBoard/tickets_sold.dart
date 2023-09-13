// import 'dart:io';

// import 'package:cross_file/cross_file.dart';
// import 'package:csv/csv.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// import 'package:organizer/methods/show_loading.dart';
// import 'package:organizer/models/UsersWhoBoughtTheTickectModel.dart';
// import 'package:organizer/models/tickect.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import '../../constants/constants.dart';

// class TicketsSold extends StatefulWidget {
//   final TickectModel ticket;
//   const TicketsSold({
//     Key? key,
//     required this.ticket,
//   }) : super(key: key);

//   @override
//   State<TicketsSold> createState() => _TicketsSoldState();
// }

// class _TicketsSoldState extends State<TicketsSold> {
//   var getResult = '';
//   String name = '';
//   List<UsersWhoBoughtTheTickectModel> verifyList = [];
//   List<UsersWhoBoughtTheTickectModel> isOutList = [];
//   int attendees = 0;
//   var index = 0;
//   List<Map<String, dynamic>> list = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(' $attendees tickets sold'),
//         centerTitle: true,
//         backgroundColor: kPrimaryLightColor,
//         foregroundColor: kPrimaryColor,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             exportCsvFile();
//           },
//           icon: const Icon(
//             Icons.share,
//             size: 30,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               scanQrCode();
//             },
//             icon: const Icon(
//               Icons.qr_code_scanner,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       body: Builder(
//         builder: (
//           BuildContext context,
//         ) {
//           return Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(
//                   8,
//                 ),
//                 child: TextField(
//                   onChanged: (searchName) {
//                     setState(() {
//                       name = searchName;
//                     });
//                   },
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: "Search Name",
//                       contentPadding: const EdgeInsets.all(13),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(
//                           color: Colors.grey,
//                         ),
//                       ),
//                       fillColor: Colors.transparent),
//                 ),
//               ),
//               FutureBuilder<List<UsersWhoBoughtTheTickectModel>>(
//                   future: name == ""
//                       ? usersBoughtController.getUsersWhoBoughtTheTickets()
//                       : usersBoughtController.getSearch(name),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       if (snapshot.hasData) {
//                         snapshot.data
//                             ?.forEach((UsersWhoBoughtTheTickectModel user) {
//                           bool checkNameDuplicateBool = verifyList.any((
//                             map,
//                           ) =>
//                               map.name!.contains(
//                                 user.name!,
//                               ));
//                           bool checkEmailDuplicateBool = verifyList.any((
//                             map,
//                           ) =>
//                               map.email!.contains(
//                                 user.email!,
//                               ));

//                           Map<String, dynamic> userMap = {
//                             'Name': user.name,
//                             'Email': user.email,
//                             'Attended': user.hasAttended,
//                           };

//                           if (!checkEmailDuplicateBool &&
//                               !checkNameDuplicateBool) {
//                             list.add(userMap);
//                           }
//                         });

//                         return Expanded(
//                           child: ListView.builder(
//                               itemCount: snapshot.data!.length,
//                               itemBuilder: (context, index) {
//                                 verifyList = snapshot.data!.toList();
//                                 isOutList = snapshot.data!.toList();

//                                 return Card(
//                                   child: ListTile(
//                                     title:
//                                         Text(snapshot.data![index].name ?? ''),
//                                     subtitle:
//                                         Text(snapshot.data![index].id ?? ''),
//                                     trailing: Checkbox(
//                                       value: snapshot.data![index].hasAttended,
//                                       activeColor: Colors.black,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           snapshot.data![index].hasAttended =
//                                               true;

//                                           attendees = snapshot.data!.length;
//                                         });
//                                         usersBoughtController
//                                             .checkUsersWhoBought(
//                                           widget.ticket,
//                                           UsersWhoBoughtTheTickectModel(
//                                             email: snapshot.data![index].email,
//                                             name: snapshot.data![index].name,
//                                             id: snapshot.data![index].id,
//                                             hasAttended: true,
//                                             isInSide: true,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 );
//                               }),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Container(
//                           color: kPrimaryLightColor,
//                           child: Center(
//                             child: Text('No Internet',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .displayMedium!
//                                     .copyWith(
//                                         color: kPrimaryColor,
//                                         fontWeight: FontWeight.bold)),
//                           ),
//                         );
//                       }
//                     }
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   })
//             ],
//           );
//         },
//       ),
//     );
//   }

//   void exportCsvFile() async {
//     var title = {
//       'Name': 'Name',
//       'Email': 'Email',
//       'Attended': 'Attended',
//     };
//     // csvList.insert(0, title);
//     List<Map<String, dynamic>> csvList = [title];
//     csvList.addAll(list);

//     String csvData = const ListToCsvConverter().convert(
//       csvList
//           .map(
//             (e) => e.values.toList(),
//           )
//           .toList(),
//       fieldDelimiter: ",",
//       textDelimiter: '"',
//       eol: '\r\n',
//     );

//     final directory = await getExternalStorageDirectory();
//     final path = directory?.path;

//     File file = File('$path/${isOutList[1].event}.csv');
//     file.writeAsString(csvData);
//     Share.shareXFiles([XFile(file.path)], text: 'The CSV File');
//   }

//   void scanQrCode() async {
//     try {
//       final qrCode = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       if (!mounted) return;
//       setState(() {
//         getResult = qrCode;
//       });

//       bool isInOurTickets = verifyList.any((
//         map,
//       ) =>
//           map.id!.contains(
//             getResult,
//           ));

//       if (isInOurTickets) {
//         for (UsersWhoBoughtTheTickectModel usersWhoBoughtTheTickectModel
//             in verifyList) {
//           if (usersWhoBoughtTheTickectModel.id == getResult &&
//               usersWhoBoughtTheTickectModel.hasAttended == false) {
//             usersBoughtController.checkUsersWhoBought(
//               widget.ticket,
//               UsersWhoBoughtTheTickectModel(
//                 email: usersWhoBoughtTheTickectModel.email,
//                 name: usersWhoBoughtTheTickectModel.name,
//                 id: usersWhoBoughtTheTickectModel.id,
//                 hasAttended: true,
//                 isInSide: true,
//               ),
//             );
//             verified(usersWhoBoughtTheTickectModel.name!, context,
//                 usersWhoBoughtTheTickectModel.event!);
//           }
//         }

//         for (UsersWhoBoughtTheTickectModel usersWhoBoughtTheTickectModel
//             in isOutList) {
//           usersWhoBoughtTheTickectModel.hasAttended = false;
//           if (usersWhoBoughtTheTickectModel.id == getResult &&
//               usersWhoBoughtTheTickectModel.isInSide == true) {
//             usersBoughtController.checkUsersWhoBought(
//               widget.ticket,
//               UsersWhoBoughtTheTickectModel(
//                 email: usersWhoBoughtTheTickectModel.email,
//                 name: usersWhoBoughtTheTickectModel.name,
//                 id: usersWhoBoughtTheTickectModel.id,
//                 hasAttended: true,
//                 isInSide: false,
//               ),
//             );

//             hasGoneOut(usersWhoBoughtTheTickectModel.name!, context);
//           } else if (usersWhoBoughtTheTickectModel.id == getResult &&
//               usersWhoBoughtTheTickectModel.isInSide == false) {
//             usersBoughtController.checkUsersWhoBought(
//               widget.ticket,
//               UsersWhoBoughtTheTickectModel(
//                 email: usersWhoBoughtTheTickectModel.email,
//                 name: usersWhoBoughtTheTickectModel.name,
//                 id: usersWhoBoughtTheTickectModel.id,
//                 hasAttended: true,
//                 isInSide: true,
//               ),
//             );
//             welcomeBack(usersWhoBoughtTheTickectModel.name!, context);
//           }
//         }
//       } else {
//         alreadyVerified(context);
//       }
//     } on PlatformException {
//       getResult = 'Failed to Scan';
//     }
//   }
// }
