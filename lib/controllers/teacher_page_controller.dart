import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/models/teacher.dart';
import 'package:video_player/video_player.dart';

class TeacherPageController extends GetxController {
  Teacher _teacher;
  Teacher get teacher => _teacher;
  VideoPlayerController _videoController;
  VideoPlayerController get videoController => _videoController;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  getTeacherInfo() async {
    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('teacher');
    final DocumentSnapshot<Map<String, dynamic>> document =
        await collection.doc('cmjtw87FsF7QZ3NwwyOl').get();
    if (document.exists) {
      Map<String, dynamic> data = document.data();
      _teacher = Teacher(
        name: data['nameTeacher'],
        patronimic: data['patronimicTeacher'],
        surname: data['surnameTeacher'],
        photo: data['photo'],
        photoSmall: data['photo_small'],
        video: data['video'],
        title: data['title'],
        phone: data['phone'],
        description: data['description'],
        lessons: data['lessons'],
        help: data['help'],
      );
      return _teacher;
    }
  }

  load() async {
    await getTeacherInfo().then((_) {
      update();
      debugPrint(_teacher.video);
      _videoController = VideoPlayerController.network(_teacher.video);
      _videoController.addListener(() {
        update();
      });
      _videoController.setLooping(true);
    });

    // ignore: prefer_final_parameters
    await _videoController.initialize().then((_) {
      update();
    });
  }

  videoPlayPause() {
    _videoController.value.isPlaying
        ? _videoController.pause()
        : _videoController.play();
    update();
  }

  @override
  void onClose() {
    super.onClose();
    _videoController.dispose();
  }
}
