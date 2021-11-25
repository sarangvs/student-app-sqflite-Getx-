// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:studentapp2/controller/add_student_page_controller.dart';
// import 'package:studentapp2/db/handler.class.dart';
// import 'package:studentapp2/db/model_class.dart';
//
// import 'home_page.dart';
//
// class UpdateStudent extends StatefulWidget {
//   StudentsModel? students;
//
//   UpdateStudent({Key? key, this.students}) : super(key: key);
//
//   @override
//   State<UpdateStudent> createState() => _UpdateStudentState();
// }
//
// class _UpdateStudentState extends State<UpdateStudent> {
//   StudentController studentController = Get.put(StudentController());
//
//   StudentHandler handler = Get.put(StudentHandler());
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     studentController.nameController.text = widget.students!.studentName;
//     studentController.classController.text = widget.students!.studentClass;
//     studentController.ageController.text = widget.students!.studentAge;
//     studentController.numberController.text=widget.students!.studentGender;
//     studentController.addressController.text=widget.students!.studentAddress;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double heightScreen = MediaQuery.of(context).size.height;
//     final double widthScreen = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Get.off(const HomePage());
//           },
//         ),
//         title: Text(
//           'Student Form',
//           style: GoogleFonts.quantico(color: Colors.black, fontSize: 25),
//         ),
//         backgroundColor: const Color(0xFFebebeb),
//         elevation: 0,
//       ),
//       backgroundColor: const Color(0xFFebebeb),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: heightScreen,
//           width: widthScreen,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: heightScreen / 5,
//                 child: const CircleAvatar(
//                   radius: 80,
//                   backgroundColor: Colors.white,
//                   child: Icon(
//                     Icons.person_add,
//                     size: 95,
//                   ),
//                 ),
//               ),
//               heightsSpacerMaker(),
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Form(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         heightsSpacerMaker(),
//                         TextFormField(
//                           controller: studentController.nameController,
//                           style: const TextStyle(
//                               color: Colors.black, fontSize: 20),
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.person,
//                               color: Colors.grey,
//                             ),
//                             labelText: "Student Name ",
//                             labelStyle: const TextStyle(
//                                 color: Colors.grey, fontSize: 17),
//                             fillColor: const Color(0xFFebebeb),
//                             filled: true,
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                               borderSide: BorderSide(
//                                 color: Colors.blue.withOpacity(.6),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                                 width: 1.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                         heightsSpacerMaker(),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: SizedBox(
//                                 width: widthScreen / 2,
//                                 child: TextFormField(
//                                   controller: studentController.classController,
//                                   style: const TextStyle(
//                                       color: Colors.black, fontSize: 20),
//                                   decoration: InputDecoration(
//                                     labelText: "Class",
//                                     labelStyle: const TextStyle(
//                                         color: Colors.grey, fontSize: 17),
//                                     fillColor: const Color(0xFFebebeb),
//                                     filled: true,
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                       borderSide: BorderSide(
//                                         color: Colors.blue.withOpacity(.6),
//                                       ),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                       borderSide: const BorderSide(
//                                         color: Colors.grey,
//                                         width: 1.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             widthSpacerMaker(),
//                             Expanded(
//                               child: SizedBox(
//                                 width: widthScreen / 2,
//                                 child: TextFormField(
//                                   controller: studentController.ageController,
//                                   keyboardType: TextInputType.number,
//                                   style: const TextStyle(
//                                       color: Colors.black, fontSize: 20),
//                                   decoration: InputDecoration(
//                                     labelText: "Age",
//                                     labelStyle: const TextStyle(
//                                         color: Colors.grey, fontSize: 17),
//                                     fillColor: const Color(0xFFebebeb),
//                                     filled: true,
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                       borderSide: BorderSide(
//                                         color: Colors.blue.withOpacity(.6),
//                                       ),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                       borderSide: const BorderSide(
//                                         color: Colors.grey,
//                                         width: 1.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         heightsSpacerMaker(),
//                         TextFormField(
//                           controller: studentController.numberController,
//                           style: const TextStyle(
//                               color: Colors.black, fontSize: 20),
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.person,
//                               color: Colors.grey,
//                             ),
//                             labelText: "Mobile number",
//                             labelStyle: const TextStyle(
//                                 color: Colors.grey, fontSize: 17),
//                             fillColor: const Color(0xFFebebeb),
//                             filled: true,
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                               borderSide: BorderSide(
//                                 color: Colors.blue.withOpacity(.6),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                                 width: 1.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                         heightsSpacerMaker(),
//                         TextFormField(
//                           controller: studentController.addressController,
//                           maxLines: 4,
//                           style: const TextStyle(
//                               color: Colors.black, fontSize: 20),
//                           decoration: InputDecoration(
//                             labelText: "Address",
//                             alignLabelWithHint: true,
//                             labelStyle: const TextStyle(
//                                 color: Colors.grey, fontSize: 17),
//                             fillColor: const Color(0xFFebebeb),
//                             filled: true,
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                               borderSide: BorderSide(
//                                 color: Colors.blue.withOpacity(.6),
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                                 width: 1.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                         heightsSpacerMaker(),
//                         heightsSpacerMaker(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 Get.off(const HomePage());
//                               },
//                               child: const Text('Cancel'),
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.blue,
//                                   // background
//                                   onPrimary: Colors.white, // foreground
//                                   minimumSize: const Size(150, 40)),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 studentController
//                                     .updateForm(widget.students!.id!);
//                               },
//                               child: const Text('update'),
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.blue,
//                                   // background
//                                   onPrimary: Colors.white, // foreground
//                                   minimumSize: const Size(150, 40)),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   height: heightScreen,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(40),
//                       ),
//                       color: Colors.white
//                     // gradient: LinearGradient(
//                     //   begin: Alignment.centerRight,
//                     //   end: Alignment.centerLeft,
//                     //   colors: [
//                     //     Color(0xFFebebeb),
//                     //     Color(0xFFebebeb),
//                     //   ],
//                     // ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   DropdownMenuItem<String> buildMenuItem(String item) {
//     return DropdownMenuItem(
//         value: item,
//         child: Text(
//           item,
//           style: const TextStyle(fontSize: 17, color: Colors.black),
//         ));
//   }
//
//   Widget widthSpacerMaker() => const SizedBox(
//     width: 5,
//   );
//
//   Widget heightsSpacerMaker() => const SizedBox(
//     height: 15,
//   );
// }