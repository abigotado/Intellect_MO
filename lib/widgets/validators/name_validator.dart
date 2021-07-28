String nameValidator(value) {
  RegExp regExp = RegExp(r'^(?!\s*$)[-а-яА-Я\s]{2,253}$');
  if (value.length == 0) {
    return 'Введите текст';
  } else if (!regExp.hasMatch(value)) {
    return 'Некорректный ввод';
  }
  return null;
}