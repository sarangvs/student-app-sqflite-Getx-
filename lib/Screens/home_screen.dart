import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:student_app/Database/db_model.dart';
import 'package:student_app/Database/students_handler.dart';
import 'package:student_app/Screens/add_student.dart';
import 'package:student_app/Screens/edit_students.dart';
import 'package:student_app/controller/student_controller.dart';



class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);

   StudentController studentController = Get.put(StudentController());
  StudentHandler handler = Get.put(StudentHandler());

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:  Text('Student App',style: GoogleFonts.josefinSans(textStyle: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black)),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: null,
                icon: Image.asset('Assets/profile.jpg')
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*0.04),
          child: GetBuilder<StudentController>(

              builder: (controller){
                return FutureBuilder(
                  future: handler.retrieveStudents(),
                    builder: (BuildContext ctx, AsyncSnapshot<List<Students>> snapshot){
                    if(snapshot.hasData){
                      return ListView.separated(
                          itemBuilder: (_,index){
                            return Material(
                              borderRadius: BorderRadius.circular(10),
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                title: Text(snapshot.data![index].studentNamedb,style: const TextStyle(fontSize: 20),),
                                subtitle: Text('Class:${snapshot.data![index].studentClassdb} ${snapshot.data![index].studentDivdb}'),
                                trailing:  IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: ()async{
                                    await handler.deleteStudents(snapshot.data![index].id!);
                                    studentController.update();
                                    Get.snackbar('', '${snapshot.data![index].studentNamedb} has been deleted',snackPosition: SnackPosition.BOTTOM,);
                                  },
                                ),
                                onTap: (){
                                  Get.to( EditStudent(studentModel: snapshot.data![index],));
                                },
                              ),
                            );
                          },
                          separatorBuilder: (_, index)=>SizedBox(height: screenHeight*0.02),
                          itemCount: snapshot.data!.length,
                      );
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                }
                );
              }
          ),
        ),
        floatingActionButton:  Hero(
          tag: 'tag',
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: (){
              Get.to(AddStudent(),transition: Transition.downToUp);
              studentController.studentNameController.clear();
              studentController.studentClassController.clear();
              studentController.addressController.clear();
              studentController.rollnumberController.clear();
              studentController.ageController.clear();
              studentController.phoneNumberController.clear();

            },
            child: const Icon(Icons.add,color: Colors.black,size: 40,),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:  BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: const [
               IconButton(onPressed: null, icon:Icon (Icons.home,color: Colors.black,)),
               IconButton(onPressed: null, icon:Icon (Icons.home,color: Colors.transparent,)),
               IconButton(onPressed: null, icon:Icon (Icons.search,color: Colors.transparent,)),
               IconButton(onPressed: null, icon:Icon (Icons.nightlight_outlined,color: Colors.black,))
             ],
            ),
          ),
        ),
        //bottomNavigationBar: const BottomNavBarV2(),
      ),
    );
  }

}

