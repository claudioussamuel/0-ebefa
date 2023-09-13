// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:organizer/helper/custom_textfield.dart';
// import '../../../constants/constants.dart';
// import '../../../constants/firebase.dart';
// import '../../../methods/show_loading.dart';
// import '../../../methods/split_payment.dart';
// import '../../../methods/sub_account_details.dart';
// import '../../../models/tickect.dart';
// import '../../Home_Screen/home_screen.dart';

// class BankDetails extends StatefulWidget {
//   final String url;
//   const BankDetails({Key? key, required this.url}) : super(key: key);

//   @override
//   State<BankDetails> createState() => _BankDetailsState();
// }

// class _BankDetailsState extends State<BankDetails> {
//   List<String> bankName = [
//     'Absa Bank Ghana Ltd',
//     'Access Bank',
//     'ADB Bank Limited',
//     'AirtelTigo',
//     'ARB Apex Bank',
//     'Bank of Africa Ghana',
//     'Bank of Baroda Ghana Limited',
//     'Bank of Ghana',
//     'Barclays Bank of Ghana Limited',
//     'BSIC Ghana Limited',
//     'CAL Bank Limited',
//     'Consolidated Bank Ghana Limited',
//     'Ecobank Ghana Limited',
//     'Energy Bank Ghana Limited',
//     'FBNBank Ghana Limited',
//     'Fidelity Bank Ghana Limited',
//     'First Atlantic Bank Ghana Limited',
//     'First National Bank Ghana Limited',
//     'GCB Bank Limited',
//     'GHL Bank',
//     'Gn Bank',
//     'Guaranty Trust Bank (Ghana) Limited',
//     'Heritage Bank Ghana',
//     'HFC Bank Ghana Limited',
//     'MTN',
//     'National Investment Bank Limited',
//     'OmniBank Ghana Limited',
//     'Premium Bank Limited',
//     'Prudebtial Bank Limited',
//     'Services Integrity Savings and Loans',
//     'Sovereign Bank Ghana',
//     'Stanbic Bank Ghana Limited',
//     'Standard Chartered Bank Limited',
//     'The Royal Bank Limited',
//     'UniBank Ghana Limited',
//     'United Bank for Africa Ghana Limited',
//     'Universal Merchant Bank Ghana Limited',
//     'Vodafone',
//     'Zenith Bank Ghana',
//   ];

//   //String? selectedBank = 'Absa Bank Ghana Ltd';

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Account Details'),
//         centerTitle: true,
//         backgroundColor: kPrimaryLightColor,
//         foregroundColor: kPrimaryColor,
//         elevation: 0,
//       ),
//       bottomNavigationBar: BottomAppBar(
//           elevation: 0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: size.height * 0.07,
//                 width: size.width * 0.8,
//                 child: MaterialButton(
//                   //==== for buying from paystack =====
//                   onPressed: () async {
//                     if (tickController.accountName.text.trim().isEmpty ||
//                         tickController.accountNumber.text.trim().isEmpty ||
//                         tickController.tickectPrice.text.trim().isEmpty) {
//                       Get.snackbar(
//                         'Fill column',
//                         'Try again',
//                         // snackPosition: SnackPosition.BOTTOM,
//                       );
//                     } else {
//                       subAccountDetails();

//                       splitPayment(tickController.sendAccountNumber.value,
//                               tickController.eventName.text.trim())
//                           .whenComplete(() {
//                         if (tickController.splitCode.value != '') {
//                           showLoading();
//                           tickController.addTicket(
//                               // add to the admin
//                               TickectModel(
//                             id: tickController.eventName.text.trim(),
//                             location: tickController.eventLocation.text.trim(),
//                             city: tickController.eventCity.text.trim(),
//                             description: tickController.eventAbout.text.trim(),
//                             name: tickController.eventName.text.trim(),
//                             price: double.parse(
//                                 tickController.tickectPrice.text.trim()),
//                             startdate: controller.startDate(
//                                 controller.selectedStartDate.value,
//                                 controller.selectedStartTime.value),
//                             enddate: controller.endDate(
//                                 controller.selectedEndDate.value,
//                                 controller.selectedEndTime.value),
//                             picture: widget.url,
//                             subAccountNumber:
//                                 tickController.sendAccountNumber.value,
//                             adminId: auth.currentUser?.uid,
//                             path: tickController.getString(),
//                             contact: tickController.phoneNumber.text.trim(),
//                             splitCode: tickController.splitCode.value,
//                           ));

//                           // add to the user
//                           tickController
//                               .addAllTicket(
//                                 TickectModel(
//                                   id: tickController.eventName.text.trim(),
//                                   location:
//                                       tickController.eventLocation.text.trim(),
//                                   city: tickController.eventCity.text.trim(),
//                                   description:
//                                       tickController.eventAbout.text.trim(),
//                                   name: tickController.eventName.text.trim(),
//                                   price: double.parse(
//                                       tickController.tickectPrice.text.trim()),
//                                   startdate: controller.startDate(
//                                       controller.selectedStartDate.value,
//                                       controller.selectedStartTime.value),
//                                   enddate: controller.endDate(
//                                       controller.selectedEndDate.value,
//                                       controller.selectedEndTime.value),
//                                   picture: widget.url,
//                                   subAccountNumber:
//                                       tickController.sendAccountNumber.value,
//                                   adminId: auth.currentUser?.uid,
//                                   path: tickController.getString(),
//                                   contact:
//                                       tickController.phoneNumber.text.trim(),
//                                   splitCode: tickController.splitCode.value,
//                                 ),
//                               )
//                               .whenComplete(
//                                 () => Get.offAll(
//                                   () => const MyHomePage(),
//                                 ),
//                               );
//                         } else {
//                           return null;
//                         }
//                       });
//                     }
//                   },

//                   color: kPrimaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(29),
//                   ),
//                   child: Text(
//                     'Submit'.toUpperCase(),
//                     style: const TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//       // floatingActionButton: FloatingActionButton(
//       //   backgroundColor: kPrimaryLightColor,
//       //   foregroundColor: kPrimaryColor,
//       //   child: const Icon(
//       //     Icons.arrow_forward_ios_outlined,
//       //   ),

//       //   // work here
//       //   onPressed: () async {
//       //     if (tickController.accountName.text.trim().isEmpty ||
//       //         tickController.accountNumber.text.trim().isEmpty ||

//       body: SingleChildScrollView(
//         reverse: true,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Bank Name / MOMO Name'),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Obx(
//                   () => SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: SizedBox(
//                       child: DropdownButton(
//                           value: tickController.selectedBank.value,
//                           items: bankName
//                               .map(
//                                 (e) => DropdownMenuItem(
//                                   value: e,
//                                   child: SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     child: Text(
//                                       e,
//                                       style: TextStyle(fontSize: 24),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                               .toList(),
//                           onChanged: (String? e) =>
//                               tickController.selectedBank.value = e ?? 'MTN'),
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Account Name / Momo Name'),
//                   ),
//                 ],
//               ),
//               CustomTextField(
//                 controller: tickController.accountName,
//                 hintText: 'Account Name ',
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Account Number / Momo Number'),
//                   ),
//                 ],
//               ),
//               CustomTextField(
//                   controller: tickController.accountNumber,
//                   hintText: 'Account Number '),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('Ticket Price'),
//                   ),
//                 ],
//               ),
//               TextFormField(
//                 controller: tickController.tickectPrice,
//                 decoration: InputDecoration(
//                     prefixText: "₵",
//                     hintText: 'Price of Ticket',
//                     border: const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                       color: Colors.black38,
//                     ))),
//               ),
//               SizedBox(
//                 height: size.height * 0.09,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
