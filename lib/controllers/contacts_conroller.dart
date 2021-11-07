import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/models/contacts.dart';
import 'package:map_launcher/map_launcher.dart';

class ContactsController extends GetxController {
  Contacts _contacts;
  Contacts get contacts => _contacts;
  dynamic _availableMaps;
  dynamic get availableMaps => _availableMaps;

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
        address: data['address'],
        addressLat: double.parse(data['addressLat']),
        addressLong: double.parse(data['addressLong']),
        facebook: data['facebook'],
        facebookShort: data['facebookShort'],
        facebookUnlaunched: data['facebookUnlaunched'],
        instagram: data['instagram'],
        instagramShort: data['instagramShort'],
      );
      return _contacts;
    }
  }

  load() async {
    await getContacts();
    update();
    _availableMaps = await MapLauncher.installedMaps;
    print(_availableMaps);
    update();
  }
}
