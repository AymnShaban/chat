String? emailValidation(value){
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  }
  final bool isValid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
  ).hasMatch(value);
  if (!isValid) {
    return 'Please enter a valid email';
  }
  return null;
}
