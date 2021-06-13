

String phoneValidator(value) {
  Pattern pattern = r'(^(?:\+7|8)?[0-9]{10}$)';
  RegExp regExp = RegExp(pattern);
  if (value.length == 0) {
    return 'Введите номер телефона';
  }
  else if (!regExp.hasMatch(value)) {
    return 'Введите корректный номер телефона';
  }
  return null;
}