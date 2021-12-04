import 'dart:core';

// ignore_for_file: prefer_final_parameters

class School {
  School({
    this.schoolPhoto,
    this.classPhoto,
    this.aboutSchool,
    this.weDevelop,
    this.advantages,
    this.licenses,
  });

  final String classPhoto;
  final String schoolPhoto;
  final String aboutSchool;
  final List<dynamic> weDevelop;
  final List<dynamic> advantages;
  final List<dynamic> licenses;
}
