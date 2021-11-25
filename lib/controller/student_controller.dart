import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/Database/db_model.dart';
import 'package:student_app/Database/students_handler.dart';
import 'package:student_app/Screens/home_screen.dart';

class StudentController extends GetxController {
  final GlobalKey<FormState> studentFormKey = GlobalKey<FormState>();

  ///TEXT EDITING CONTROLLERS
  late TextEditingController studentNameController = TextEditingController();
  late TextEditingController studentClassController = TextEditingController();
  late TextEditingController rollnumberController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();



  /// VARIABLES TO STORE STUDENT DETAILS
  var studentName = '';
  var studentClass = '';
  var rollNumber = '';
  var address = '';
  var studentAge = "";
  var studentPhoneNo = '';

  ///LOCAL DB

  StudentHandler? studentHandler;
  List<Students> studentList = [];
  int currentIndex = 0;




  Future<int> addStudentToDb(String studentName,String studentClass,String rollNumber,String address,
      studentAge, selectedValue) async {
    final Students firstStudent = Students(
        studentNamedb: studentName,
        studentClassdb: studentClass,
        studentDivdb: rollNumber,
        studentAgedb: studentAge,
        studentGenderdb: selectedValue,
        studentAddressdb: address);
    final List<Students> listOfStudents = [firstStudent];
    return await studentHandler!.insertStudents(listOfStudents);
  }


  // editUpdate(String studentName,String studentClass,String rollNumber,String address,
  //     studentAge, selectedValue)async{
  //   stdnt = await studentHandler!.updateStudent(id, studentNamedb, studentClassdb, studentDivdb, studentAgedb, studentGenderdb, studentAddressdb);
  // }



  ///DROP DOWN LIST FOR GENDER
  var selectedValue;
  final gender = ["Male", "Female"];

  void onSelected(String value) {
    selectedValue = value;
    update();
  }

  ///INIT STATE METHOD
  @override
  void onInit() {
    super.onInit();
    studentNameController = TextEditingController();
    studentClassController = TextEditingController();
    rollnumberController = TextEditingController();
    addressController = TextEditingController();
    ageController = TextEditingController();
    studentHandler = StudentHandler();
    update();
  }

  ///DISPOSE METHOD
  @override
  void onClose() {
    super.onClose();
    studentNameController.dispose();
    studentClassController.dispose();
    rollnumberController.dispose();
    addressController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
  }

  String? validateName(String name) {
    if (name.isEmpty||name== null) {
      return "This field is required";
    } else if (name.length <= 3) {
      return "Provide a valid name";
    } else if(name.isAlphabetOnly) {
      return null;
    }else{
      return "Provide valid Information";
    }
  }

  String? validateClass(String classs) {
    if (classs.isEmpty||classs==null) {
      return "This Field is Required";
    } else if(classs.isNumericOnly||classs.isAlphabetOnly) {
      return null;
    }else{
      return "Provide valid Information";
    }

  }

  String? validateGender(String gender) {
    if (gender.isEmpty) {
      return "This Field is Required";
    } else {
      return null;
    }
  }

  String? validateAge(String age) {
    if (age.isEmpty||age==null) {
      return "This Field is Required";
    } else if(age.isNumericOnly) {
      return null;
    }else{
      return "Provide valid Information";
    }
  }

  String? validatePhone(String phoneNo) {
    if (phoneNo.isEmpty||phoneNo==null) {
      return "This Field is Required";
    } else if(phoneNo.isPhoneNumber) {
      return null;
    }else{
      return "Provide valid Information";
    }
  }

  String? validateRollNO(String rollNo) {
    if (rollNo.isEmpty||rollNo==null) {
      return "This Field is Required";
    }else if(rollNo.isAlphabetOnly) {
      return null;
    }else{
      return "Provide valid Information";
    }
  }

  String? validateAddress(String address) {
    if (address.isEmpty||address==null) {
      return "This Field is Required";
    }else{
      return null;
    }
  }

  ///Add Student method
  void addStudent() {
    final isValid = studentFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      studentFormKey.currentState!.save();
      String sName = studentNameController.text;
      String sClass = studentClassController.text;
      String sDiv = rollnumberController.text;
      String sAge = ageController.text;
      String sGender = phoneNumberController.text;
      String sAddress = addressController.text;

     addStudentToDb(sName,sClass,sDiv,sAge,sGender,sAddress);
    }


    Get.offAll(MyHomePage());
    ///TODO: add student to the list
  }

  void updateStudent(int id){
    Get.offAll( MyHomePage());
    studentFormKey.currentState!.save();
    String uName = studentNameController.text;
    String uClass = studentClassController.text;
    String uDiv = rollnumberController.text;
    String uAge = ageController.text;
    String uGender = phoneNumberController.text;
    String uAddress = addressController.text;
    studentHandler!.updateStudent(id, uName, uClass, uDiv, uAge, uGender, uAddress);
  print('ASDDSFDSAFDAFADFDAFADF${[uName,uClass,uDiv,uAge,uGender,uAddress]}');
  }

}
