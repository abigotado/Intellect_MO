import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/models/contacts.dart';

class ContactsController extends GetxController with StateMixin<Contacts> {
  Contacts _contacts;
  Contacts get contacts => _contacts;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  getContacts() async {
    final collection = FirebaseFirestore.instance.collection('contacts');
    final document = await collection.doc('mjcy4Cpq3afJF2ifZTjp').get();
    if (document.exists) {
      Map<String, dynamic> data = document.data();
      _contacts = Contacts(
        managerName: data['nameManager'],
        managerPhone: data['phoneManager'],
        teacherPhone: data['phoneTeacher'],
        schoolEmail: data['schoolEmail'],
        schoolLogo: data['schoolLogo'],
        website: data['website'],
        websiteShort: data['websiteShort'],
        emailShort: data['emailShort'],
      );
      return _contacts;
    }
  }

  load() async {
    await getContacts();
    update();
  }
}
