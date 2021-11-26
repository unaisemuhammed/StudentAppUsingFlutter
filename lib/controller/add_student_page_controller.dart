import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp2/db/handler.class.dart';
import 'package:studentapp2/db/model_class.dart';
import 'package:studentapp2/screens/home_page.dart';

class StudentController extends GetxController {
  StudentsModel? students;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      classController,
      ageController,
      numberController,
      addressController;
  var name = '';
  var sClass = '';
  var age = '';
  var number = '';
  var address = '';
  StudentHandler? handler;

  @override
  void onInit() {
    // TODO: implement onInit
    nameController = TextEditingController();
    classController = TextEditingController();
    ageController = TextEditingController();
    numberController = TextEditingController();
    addressController = TextEditingController();
    handler = StudentHandler();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameController.dispose();
    classController.dispose();
    ageController.dispose();
    numberController.dispose();
    addressController.dispose();
    super.onClose();
  }


  // void assingn(){
  //   nameController.text = students!.studentName;
  //   classController.text = students!.studentClass;
  //   ageController.text = students!.studentAge;
  //   numberController.text = students!.studentGender;
  //   addressController.text = students!.studentAddress;
  // }

  Future<int> addStudents(String sName, String sClass, String sAge,
      String sGender, String sAddress) async {
    final StudentsModel eachStudent = StudentsModel(
        studentName: sName,
        studentClass: sClass,
        studentAge: sAge,
        studentGender: sGender,
        studentAddress: sAddress);
    final List<StudentsModel> listOfStudent = [eachStudent];
    print("kdsfjfkdzhf$sName");
    return await handler!.insertStudent(listOfStudent);
  }

  String? validationName(String value) {
    if (!GetUtils.isAlphabetOnly(value)) {
      return 'Enter Your Name Properly!';
    } else if (value.isEmpty) {
      return 'Enter Your Name';
    } else {
      return null;
    }
  }

  String? validationClass(String value) {
    if (value.isEmpty) {
      return 'Add class';
    } else {
      return null;
    }
  }

  String? validationAge(String value) {
    if (value.isEmpty) {
      return 'Enter your age';
    } else if (value.isNumericOnly) {
      return null;
    } else {
      return null;
    }
  }

  String? validationGender(String value) {
    if (value == 'Gender') {
      return 'Select your gender';
    } else {
      return null;
    }
  }

  void saveForm() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    Get.offAll(const HomePage());
    var name = nameController.text;
    var sClass = classController.text;
    var age = ageController.text;
    var gender = numberController.text;
    var address = addressController.text;
    addStudents(name, sClass, age, gender, address);
  }

  void updateForm(int id) {
    Get.offAll(const HomePage());
    var name = nameController.text;
    var sClass = classController.text;
    var age = ageController.text;
    var gender = numberController.text;
    var address = addressController.text;
    handler!.updateStudent(id, name, sClass, age, gender, address);
    print('GAGGING:${[name, sClass, age, gender, address]}');
  }

}
