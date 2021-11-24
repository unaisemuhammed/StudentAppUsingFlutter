import 'package:get/get.dart';

class StudentsModel extends GetxController {
  int? id;
  String studentName;
  String studentClass;
  String studentAge;
  String studentGender;
  String studentAddress;

  StudentsModel({required this.studentName,
    required this.studentClass,
    required this.studentAge,
    required this.studentGender,
    required this.studentAddress});

  StudentsModel.fromMap(Map<String, dynamic>std)
      :
        id =std['id'],
        studentName=std['studentName'],
        studentClass=std['studentClass'],
        studentAge = std['studentAge'],
        studentGender=std['studentGender'],
        studentAddress=std['studentAddress'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'studentName': studentName,
      'studentClass': studentClass,
      'studentAge': studentAge,
      'studentGender': studentGender,
      'studentAddress': studentAddress,
    };
  }
  }