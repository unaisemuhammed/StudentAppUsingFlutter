import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentapp2/controller/add_student_page_controller.dart';
import 'package:studentapp2/db/model_class.dart';

import 'home_page.dart';

class AddStudent extends StatelessWidget {
  final StudentsModel? student;
  final int? studentIndex;

  AddStudent({this.student, Key? key, this.studentIndex}) : super(key: key);

  late String dropValue;
  late String genderSelected;

  StudentController studentController = Get.put(StudentController());

  final items = ['Male', 'Female'];
  final items2 = ['Obc', 'General'];
  var value;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.off(HomePage());
            },
          ),
          title: Text(
            'Student Form',
            style: GoogleFonts.quantico(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: const Color(0xFFebebeb),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFebebeb),
        body: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: heightScreen,
            width: widthScreen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: heightScreen / 5,
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_add,
                      size: 95,
                    ),
                  ),
                ),
                heightsSpacerMaker(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: studentController.loginFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heightsSpacerMaker(),
                          TextFormField(
                            controller: studentController.nameController,
                            onSaved: (String? value) {
                              studentController.name = value!;
                            },
                            validator: (value) {
                              return studentController.validationName(value!);
                            },
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              labelText: "Student Name ",
                              labelStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 17),
                              fillColor: const Color(0xFFebebeb),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue.withOpacity(.6),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          heightsSpacerMaker(),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: widthScreen / 2,
                                  child: TextFormField(
                                    controller:
                                        studentController.classController,
                                    onSaved: (value) {
                                      studentController.sClass = value!;
                                    },
                                    validator: (value) {
                                      return studentController
                                          .validationClass(value!);
                                    },
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    decoration: InputDecoration(
                                      labelText: "Class",
                                      labelStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 17),
                                      fillColor: const Color(0xFFebebeb),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Colors.blue.withOpacity(.6),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              widthSpacerMaker(),
                              Expanded(
                                child: SizedBox(
                                  width: widthScreen / 2,
                                  child: TextFormField(
                                    controller: studentController.ageController,
                                    onSaved: (value) {
                                      studentController.age = value!;
                                    },
                                    validator: (value) {
                                      return studentController
                                          .validationAge(value!);
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    decoration: InputDecoration(
                                      labelText: "Age",
                                      labelStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 17),
                                      fillColor: Color(0xFFebebeb),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Colors.blue.withOpacity(.6),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          heightsSpacerMaker(),
                          TextFormField(
                            controller: studentController.numberController,
                            onSaved: (String? value) {
                              studentController.number = value!;
                            },
                            // validator: (value) {
                            //   return studentController.validationName(value!);
                            // },
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              labelText: "Mobile number",
                              labelStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 17),
                              fillColor: const Color(0xFFebebeb),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue.withOpacity(.6),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          heightsSpacerMaker(),
                          TextFormField(
                            controller: studentController.addressController,
                            onSaved: (value) {
                              studentController.address = value!;
                            },
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                              labelText: "Address",
                              alignLabelWithHint: true,
                              labelStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 17),
                              fillColor: const Color(0xFFebebeb),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue.withOpacity(.6),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          heightsSpacerMaker(),
                          heightsSpacerMaker(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.off(const HomePage());
                                  studentController.nameController.clear();
                                  studentController.classController.clear();
                                  studentController.ageController.clear();
                                  studentController.addressController.clear();
                                  studentController.numberController.clear();
                                },
                                child: const Text('Cancel'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    // background
                                    onPrimary: Colors.white, // foreground
                                    minimumSize: const Size(150, 40)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  studentController.saveForm();
                                  studentController.nameController.clear();
                                  studentController.classController.clear();
                                  studentController.ageController.clear();
                                  studentController.addressController.clear();
                                  studentController.numberController.clear();
                                },
                                child: const Text('Save'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    // background
                                    onPrimary: Colors.white, // foreground
                                    minimumSize: const Size(150, 40)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    height: heightScreen,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widthSpacerMaker() => const SizedBox(
        width: 5,
      );

  Widget heightsSpacerMaker() => const SizedBox(
        height: 15,
      );
}
