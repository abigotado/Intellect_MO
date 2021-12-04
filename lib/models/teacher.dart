// ignore_for_file: prefer_final_parameters

class Teacher {
  Teacher({
    this.name,
    this.patronimic,
    this.surname,
    this.photo,
    this.photoSmall,
    this.video,
    this.title,
    this.phone,
    this.description,
    this.lessons,
    this.help,
  });

  final String name;
  final String patronimic;
  final String surname;
  final String photo;
  final String photoSmall;
  final String video;
  final String title;
  final String phone;
  final String description;
  final List<dynamic> lessons;
  final List<dynamic> help;
}
