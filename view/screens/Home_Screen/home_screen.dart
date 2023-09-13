// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:organizer/constants/firebase.dart';
// import 'package:organizer/models/tickect.dart';
// import '../../constants/constants.dart';
// import '../../controller/users_bought_controller.dart';
// import '../DashBoard/editEvent/edit_event.dart';
// import '../DashBoard/tickets_sold.dart';
// import '../Terms_and_con/terms_and_condition.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   UsersBoughtController usersBoughtController =
//       Get.put(UsersBoughtController(), permanent: false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Organizer'),
//         centerTitle: true,
//         backgroundColor: kPrimaryLightColor,
//         foregroundColor: kPrimaryColor,
//         elevation: 0,
//       ),
//       body: FutureBuilder<List<TickectModel>>(
//         future: tickController.getTicketForOnlyAdmin(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: double.infinity,
//                         height: 170,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 3,
//                                 blurRadius: 10,
//                                 offset: const Offset(0, 3))
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//                             Stack(
//                               children: [
//                                 Container(
//                                   height: 170,
//                                   width: 120,
//                                   decoration: BoxDecoration(
//                                     borderRadius:
//                                         const BorderRadiusDirectional.only(
//                                             topStart: Radius.circular(15),
//                                             bottomStart: Radius.circular(15)),
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                           snapshot.data![index].picture ?? ""),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 5,
//                                   left: 10,
//                                   child: Container(
//                                     width: 50,
//                                     height: 25,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         color: Colors.white),
//                                     child: Align(
//                                       child: snapshot.data![index].price == 0
//                                           ? const Text(
//                                               "Free",
//                                               style: TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.bold),
//                                             )
//                                           : Text(
//                                               "₵${snapshot.data![index].price ?? ''}",
//                                               style: const TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     SizedBox(
//                                       width: 200,
//                                       child: Text(
//                                         snapshot.data![index].name ?? "",
//                                         textAlign: TextAlign.start,
//                                         //softWrap: true,
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     const SizedBox(
//                                       width: 22,
//                                     ),
//                                     const Icon(
//                                       Icons.location_on_outlined,
//                                       color: Colors.grey,
//                                       size: 20,
//                                     ),
//                                     SizedBox(
//                                       width: 170,
//                                       child: Text(
//                                         snapshot.data![index].location!,
//                                         style:
//                                             const TextStyle(color: Colors.grey),
//                                         textAlign: TextAlign.start,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const Expanded(child: SizedBox()),
//                                 Row(
//                                   children: [
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     SizedBox(
//                                       width: 137,
//                                       height: 45,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: Colors.black,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10.0),
//                                           ),
//                                         ),
//                                         onPressed: () {
//                                           usersBoughtController.getTicketModel(
//                                             snapshot.data![index],
//                                           );

//                                           Get.to(() => TicketsSold(
//                                                 ticket: snapshot.data![index],
//                                               ));
//                                         },
//                                         child: const Text(
//                                           'Attendees',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     SizedBox(
//                                       width: 50,
//                                       height: 45,
//                                       child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.red,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                             ),
//                                           ),
//                                           onPressed: () {
//                                             Get.defaultDialog(
//                                                 title:
//                                                     "Delete event from 3b3fa",
//                                                 content: Container(
//                                                   width: Get.width,
//                                                   child: ElevatedButton(
//                                                     style: ButtonStyle(
//                                                       backgroundColor:
//                                                           MaterialStateProperty
//                                                               .resolveWith(
//                                                                   (states) {
//                                                         // If the button is pressed, return green, otherwise blue
//                                                         if (states.contains(
//                                                             MaterialState
//                                                                 .pressed)) {
//                                                           return Colors.red;
//                                                         }
//                                                         return Colors.red;
//                                                       }),
//                                                     ),
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         tickController
//                                                             .removeImageFromFirebaseStorage(
//                                                                 snapshot.data![
//                                                                     index]);
//                                                         tickController
//                                                             .removeTickectsUser(
//                                                                 snapshot.data![
//                                                                     index]);
//                                                         tickController
//                                                             .removeTickectsAdmin(
//                                                                 snapshot.data![
//                                                                     index]);

//                                                         tickController
//                                                             .getTicketForOnlyAdmin();
//                                                       });
//                                                     },
//                                                     child: Text("Delete"),
//                                                   ),
//                                                 ));
//                                           },
//                                           child: const Icon(Icons.delete)),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//             } else if (snapshot.hasError) {
//               return Container(
//                 color: kPrimaryLightColor,
//                 child: Center(
//                   child: Text("No Internet",
//                       style: Theme.of(context).textTheme.headline2!.copyWith(
//                           color: kPrimaryColor, fontWeight: FontWeight.bold)),
//                 ),
//               );
//             }
//           }

//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(
//             () => const EditEvent(),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: kPrimaryLightColor,
//         foregroundColor: kPrimaryColor,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             Obx(() => UserAccountsDrawerHeader(
//                 decoration: const BoxDecoration(
//                   color: kPrimaryColor,
//                 ),
//                 accountName: Text(
//                   authController.adminModel.value.name ?? "",
//                   style: const TextStyle(color: kPrimaryLightColor),
//                 ),
//                 accountEmail: Text(
//                   authController.adminModel.value.email ?? "",
//                   style: const TextStyle(color: kPrimaryLightColor),
//                 ))),
//             ListTile(
//               onTap: () {
//                 Get.to(() => const TermsAndConditions());
//               },
//               leading: const Icon(Icons.article_outlined),
//               title: const Text("Terms And Conditions"),
//             ),
//             ListTile(
//               onTap: () {
//                 auth.signOut();
//               },
//               leading: const Icon(Icons.exit_to_app),
//               title: const Text("Log out"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
