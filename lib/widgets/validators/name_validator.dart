String nameValidator(value) {
  Pattern pattern = r'^[а-яА-Я]{2,253}$';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return 'Введите текст';
  } else if (!regExp.hasMatch(value)) {
    return 'Некорректный ввод';
  }
  return null;
}
