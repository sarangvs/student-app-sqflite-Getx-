import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/Database/db_model.dart';
import 'package:student_app/controller/student_controller.dart';

class AddStudent extends StatelessWidget {
   AddStudent({Key? key}) : super(key: key);


///INSTANCE OF GETX CONTROLLER
  StudentController studentController = Get.put(StudentController());


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.black,
                  ),
                  onPressed: () => Get.back(),
                )),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: SingleChildScrollView(
                reverse: true,
                child: SizedBox(
                  height: screenHeight,
                  width: screenWidth,
                  child: Form(
                    key: studentController.studentFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Text(
                          'Add Student',
                          style: GoogleFonts.josefinSans(
                              textStyle: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        const Text('Student Name',
                            style:
                                TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(13),
                                gapPadding: 5,
                              ),
                              fillColor: const Color(0xffe8e7e3),
                              filled: true),
                          controller: studentController.studentNameController,
                          onSaved: (name){
                            studentController.studentName = name!;
                          },
                          validator: (name){
                            return studentController.validateName(name!);
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        const Text('Class & Div:',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(13),
                                      gapPadding: 5,
                                    ),
                                    fillColor: const Color(0xffe8e7e3),
                                    filled: true),
                                controller: studentController.studentClassController,
                                onSaved: (classs){
                                  studentController.studentClass=classs!;
                                },
                                validator: (classs){
                                  return studentController.validateClass(classs!);
                                },
                              ),
                            ),
                            SizedBox(width: screenWidth*0.02,),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(13),
                                      gapPadding: 5,
                                    ),
                                    fillColor: const Color(0xffe8e7e3),
                                    filled: true),
                                controller: studentController.rollnumberController,
                                onSaved: (roll){
                                  studentController.rollNumber = roll!;
                                },
                                validator: (roll){
                                  return studentController.validateRollNO(roll!);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight*0.04,),
                        const Text('Age & Phone No:',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                        SizedBox(height: screenHeight*0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(13),
                                      gapPadding: 5,
                                    ),
                                    fillColor: const Color(0xffe8e7e3),
                                    filled: true),
                                controller: studentController.ageController,
                                onSaved: (age){
                                  studentController.studentAge=age!;
                                },
                                validator: (age){
                                  return studentController.validateAge(age!);
                                },
                              ),
                            ),
                            SizedBox(width: screenWidth*0.02,),
                            Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent, style: BorderStyle.none),
                                        borderRadius: BorderRadius.circular(13),
                                        gapPadding: 5,
                                      ),
                                      fillColor: const Color(0xffe8e7e3),
                                      filled: true
                                  ),
                                  controller: studentController.phoneNumberController,
                                  onSaved: (phone){
                                    studentController.studentPhoneNo = phone!;
                                  },
                                  validator: (phone){
                                    return studentController.validatePhone(phone!);
                                  },
                                )
                            )
                            ///TODO:DROPDOWN
                            // Expanded(
                            //     child: GetBuilder<StudentController>(
                            //       builder: (controller){
                            //         return Container(
                            //           margin: const EdgeInsets.all(16),
                            //           padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                            //           decoration: BoxDecoration(
                            //             color: const Color(0xffe8e7e3),
                            //             borderRadius: BorderRadius.circular(13),
                            //             border: Border.all()
                            //           ),
                            //           child: DropdownButton<String>(
                            //             isExpanded: true,
                            //             hint: const Text('Gender'),
                            //             value: studentController.selectedValue,
                            //             icon: const Icon(Icons.arrow_drop_down_sharp),
                            //             iconSize: 25,
                            //             elevation: 0,
                            //             dropdownColor: const Color(0xffe8e7e3),
                            //             style: const TextStyle(color: Colors.black),
                            //             onChanged: (String? newValue) {
                            //               studentController.selectedValue = newValue!;
                            //               studentController.update();
                            //             },
                            //
                            //             items:studentController.gender
                            //                 .map<DropdownMenuItem<String>>((String value) {
                            //               return DropdownMenuItem<String>(
                            //                 value: value,
                            //                 child: Text(value),
                            //               );
                            //             }).toList(),
                            //           ),
                            //         );
                            //       },
                            //     )
                            // )

                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        const Text('Address',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),

                        TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(13),
                                gapPadding: 5,
                              ),
                              fillColor: const Color(0xffe8e7e3),
                              filled: true),
                          controller: studentController.addressController,
                          onSaved: (addresss){
                            studentController.address = addresss!;
                          },
                          validator: (add){
                            return studentController.validateAddress(add!);
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: (){


                                studentController.addStudent();
                               // print([sName,sClass,sDiv,sAge,sGender,sAddress]);
                              },
                              child: const Text('Done',style: TextStyle(fontSize: 18),),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              //maximumSize: Size(350, 45),
                              minimumSize: Size(screenWidth*10, screenHeight*0.08),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
