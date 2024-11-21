String? passWordValidation(val) {
  if (val == null || val.isEmpty) {
    return 'Password can not be empty';
  }
  return null;
}

String? emailValidation(val) {
  if (val == null || val.isEmpty) {
    return 'Password can not be empty';
  }
  return null;
}
