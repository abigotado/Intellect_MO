import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/controllers/teacher_page_controller.dart';
import 'package:intellect_mo/models/school.dart';

class SchoolPageController extends GetxController {
  TeacherPageController _teacherPageController;
  TeacherPageController get teacherPageController => _teacherPageController;

  School _school;
  School get school => _school;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  getSchoolInfo() async {
    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('school');
    final DocumentSnapshot<Map<String, dynamic>> document =
        await collection.doc('jv8KQF1UNxUtalvG4huO').get();
    if (document.exists) {
      Map<String, dynamic> data = document.data();
      _school = School(
        classPhoto: data['classPhoto'],
        schoolPhoto: data['school_photo'],
        aboutSchool: data['aboutUs'],
        weDevelop: data['weDevelop'],
        advantages: data['advantages'],
        licenses: data['licenses'],
      );
      return _school;
    }
  }

  load() async {
    _teacherPageController = Get.put(TeacherPageController());
    await _teacherPageController.getTeacherInfo();
    update();
    await getSchoolInfo();
    update();
  }
}
