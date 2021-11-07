import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/models/school.dart';

import 'contacts_conroller.dart';

class SchoolPageController extends GetxController {
  ContactsController _contactsController;
  ContactsController get contactsController => _contactsController;

  School _school;
  School get school => _school;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  getSchoolInfo() async {
    final collection = FirebaseFirestore.instance.collection('school');
    final document = await collection.doc('jv8KQF1UNxUtalvG4huO').get();
    if (document.exists) {
      Map<String, dynamic> data = document.data();
      _school = School(
        classPhoto: data['classPhoto'],
        aboutSchool: data['aboutUs'],
        weDevelop: data['weDevelop'],
        advantages: data['advantages'],
        licenses: data['licenses'],
      );
      return _school;
    }
  }

  load() async {
    _contactsController = Get.put(ContactsController());
    await _contactsController.getContacts();
    update();
    await getSchoolInfo();
    update();
  }
}
