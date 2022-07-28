class FormValidation {
  String? emailValidation(value) {
    if (value!.isEmpty) {
      return "* Required";
    }
    if (!value.contains("@") || !value.contains(".com")) {
      return "Enter a valid E-mail";
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value!.isEmpty) {
      return "Enter the password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 charcter's";
    }
    return null;
  }

  String? firstnameValidation(value) {
    if (value!.isEmpty) {
      return "* Required";
    } else {
      return null;
    }
  }

  String? lastnameValidation(value) => value!.isEmpty ? "* Required" : null;
}
