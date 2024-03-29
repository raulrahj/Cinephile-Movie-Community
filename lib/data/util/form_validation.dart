class FormValidation {
  String? emailValidation(value) {
    final RegExp nameExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (value!.isEmpty) {
      return "* Required";
    }
    if (!nameExp.hasMatch(value)) return 'Invalid email address';

    if (!value.contains("@") || !value.contains(".")) {
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
    final RegExp nameExp = RegExp(r'^[A-za-zğüşöçİĞÜŞÖÇ ]+$');

    if (value!.isEmpty) {
      return "* Required";
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    } else {
      return null;
    }
  }

  String? lastnameValidation(value) => value!.isEmpty ? "* Required" : null;
}
