// import 'package:date_format/date_format.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:organizer/helper/custom_textfield.dart';
// import '../../../constants/constants.dart';
// import '../../../constants/firebase.dart';
// import '../../../methods/show_loading.dart';
// import '../../../models/tickect.dart';
// import '../../Home_Screen/home_screen.dart';
// import '../bank_details/bank.dart';

// class EditEvent extends StatefulWidget {
//   const EditEvent({Key? key}) : super(key: key);

//   @override
//   _EditEventState createState() => _EditEventState();
// }

// class _EditEventState extends State<EditEvent> {
//   UploadTask? task;
//   String? url;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Event Info'),
//         centerTitle: true,
//         backgroundColor: kPrimaryLightColor,
//         foregroundColor: kPrimaryColor,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Pick Image'),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: InkWell(
//                   child: Container(
//                     width: 190,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                         15,
//                       ),
//                       color: kPrimaryColor,
//                       image: tickController.file != null
//                           ? DecorationImage(
//                               image: FileImage(tickController.file!),
//                               fit: BoxFit.cover,
//                             )
//                           : DecorationImage(
//                               image: NetworkImage(
//                                 'https://as1.ftcdn.net/v2/jpg/01/79/88/56/1000_F_179885610_lpxMP6f5uTxyltL1H1RpPzl9wYGzy8ia.jpg',
//                               ),
//                             ),
//                     ),
//                   ),
//                   onTap: () {
//                     // select pick
//                     tickController.getImage();
//                   },
//                 ),
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Enter Name'),
//                   ),
//                 ],
//               ),
//               CustomTextField(
//                 controller: tickController.eventName,
//                 hintText: 'Event Name',
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Enter Location'),
//                   ),
//                 ],
//               ),
//               CustomTextField(
//                 controller: tickController.eventLocation,
//                 hintText: 'Event Location',
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Enter City Name'),
//                   ),
//                 ],
//               ),
//               CustomTextField(
//                 controller: tickController.eventCity,
//                 hintText: 'City of the location',
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Phone Number'),
//                   ),
//                 ],
//               ),
//               CustomTextField(
//                 controller: tickController.phoneNumber,
//                 hintText: 'Phone number',
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Event Descrption'),
//                   ),
//                 ],
//               ),
//               TextField(
//                 minLines: 1,
//                 maxLines: 50,
//                 controller: tickController.eventAbout,
//                 decoration: InputDecoration(
//                   hintText: 'About the Event',
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                     ),
//                   ),
//                   enabledBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.black38,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               SizedBox(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text('Event Start Date :'),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             controller.chooseStartDate();
//                           },
//                           icon: Icon(Icons.calendar_today),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Obx(() => Text(formatDate(
//                               controller.selectedStartDate.value,
//                               [M, ',', d]))),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: const Text('Event Start Time :'),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             controller.chooseStartTime();
//                           },
//                           icon: Icon(Icons.alarm),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Obx(
//                             () => Text(
//                               controller.selectedStartTime.value
//                                   .format(context),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text('Event End Date   :'),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             controller.chooseEndDate();
//                           },
//                           icon: Icon(Icons.calendar_today),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Obx(() => Text(formatDate(
//                               controller.selectedEndDate.value, [M, ',', d]))),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text('Event End Time   :'),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             controller.chooseEndTime();
//                           },
//                           icon: Icon(Icons.alarm),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Obx(
//                             () => Text(
//                               controller.selectedEndTime.value.format(context),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Row(
//                         children: [
//                           MaterialButton(
//                             onPressed: () async {
//                               if (tickController.eventName.text.trim().isEmpty ||
//                                   tickController.eventLocation.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventCity.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventAbout.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventName.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventLocation.text
//                                       .trim()
//                                       .isEmpty) {
//                                 Get.snackbar(
//                                   'Fill column',
//                                   'Try again',
//                                   // snackPosition: SnackPosition.BOTTOM,
//                                 );
//                               } else {
//                                 task = tickController.uploadFile();
//                                 if (task == null) return;

//                                 showLoading();

//                                 final snapshot =
//                                     await task!.whenComplete(() {});
//                                 final urlDownload =
//                                     await snapshot.ref.getDownloadURL();
//                                 url = urlDownload;

//                                 print(
//                                     'Account Number is ${tickController.sendAccountNumber}');
//                                 tickController.addTicket(
//                                     // add to the admin
//                                     TickectModel(
//                                   id: tickController.eventName.text.trim(),
//                                   location:
//                                       tickController.eventLocation.text.trim(),
//                                   city: tickController.eventCity.text.trim(),
//                                   description:
//                                       tickController.eventAbout.text.trim(),
//                                   name: tickController.eventName.text.trim(),
//                                   price: 0,
//                                   startdate: controller.startDate(
//                                       controller.selectedStartDate.value,
//                                       controller.selectedStartTime.value),
//                                   enddate: controller.endDate(
//                                       controller.selectedEndDate.value,
//                                       controller.selectedEndTime.value),
//                                   picture: url,
//                                   subAccountNumber:
//                                       tickController.sendAccountNumber.value,
//                                   adminId: auth.currentUser?.uid,
//                                   path: tickController.getString(),
//                                   contact:
//                                       tickController.phoneNumber.text.trim(),
//                                   splitCode: tickController.splitCode.value,
//                                 ));

//                                 tickController
//                                     .addAllTicket(
//                                       TickectModel(
//                                         id: tickController.eventName.text
//                                             .trim(),
//                                         location: tickController
//                                             .eventLocation.text
//                                             .trim(),
//                                         city: tickController.eventCity.text
//                                             .trim(),
//                                         description: tickController
//                                             .eventAbout.text
//                                             .trim(),
//                                         name: tickController.eventName.text
//                                             .trim(),
//                                         price: 0,
//                                         startdate: controller.startDate(
//                                             controller.selectedStartDate.value,
//                                             controller.selectedStartTime.value),
//                                         enddate: controller.endDate(
//                                             controller.selectedEndDate.value,
//                                             controller.selectedEndTime.value),
//                                         picture: url,
//                                         subAccountNumber: tickController
//                                             .sendAccountNumber.value,
//                                         adminId: auth.currentUser?.uid,
//                                         path: tickController.getString(),
//                                         contact: tickController.phoneNumber.text
//                                             .trim(),
//                                         splitCode:
//                                             tickController.splitCode.value,
//                                       ),
//                                     )
//                                     .whenComplete(
//                                       () => Get.offAll(
//                                         () => const MyHomePage(),
//                                       ),
//                                     );
//                               }
//                             },
//                             color: kPrimaryLightColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(29),
//                             ),
//                             child: Text(
//                               'Free'.toUpperCase(),
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Expanded(child: Container()),
//                           MaterialButton(
//                             onPressed: () async {
//                               if (tickController.eventName.text.trim().isEmpty ||
//                                   tickController.eventLocation.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventCity.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventAbout.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventName.text
//                                       .trim()
//                                       .isEmpty ||
//                                   tickController.eventLocation.text
//                                       .trim()
//                                       .isEmpty) {
//                                 Get.snackbar(
//                                   'Fill column',
//                                   'Try again',
//                                   // snackPosition: SnackPosition.BOTTOM,
//                                 );
//                               } else {
//                                 task = tickController.uploadFile();
//                                 if (task == null) return;

//                                 final snapshot =
//                                     await task!.whenComplete(() {});
//                                 final urlDownload =
//                                     await snapshot.ref.getDownloadURL();
//                                 url = urlDownload;
//                                 Get.to(() => BankDetails(
//                                       url: url!,
//                                     ));
//                               }
//                             },
//                             color: kPrimaryLightColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(29),
//                             ),
//                             child: Text(
//                               'Payed'.toUpperCase(),
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
