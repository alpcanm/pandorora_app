class Validators {
  static String? mailValidator(String? value) {
    if (value != null || value!.isNotEmpty) {
      bool _check = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
      if (_check) {
        return null;
      } else {
        return "Lütfen gerçek bir e-posta giriniz.";
      }
    } else {
      return null;
    }
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty || value.length != 10) {
      return 'Must not be empty. Must be 10 digits';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Alan boş olamaz';
    } else if (value != null && value.length < 6) {
      return '6 karakterden büyük olmak zorundadır.';
    } else {
      return null;
    }
  }

  static String? emptyValidator(String? value) {
    if (value != null && value.isEmpty) {
      return "Alan boş olamaz.";
    } else {
      return null;
    }
  }
}
