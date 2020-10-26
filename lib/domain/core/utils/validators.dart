/// This is the validator that checks the users input on the register and login screen
class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _usernameRegExp = RegExp(
    r'^[a-zA-Z]+$',
  );

  // static final RegExp _passwordRegExp = RegExp(
  //   r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  // );

  static isSearchMatch(String original, String search) {
    return original.contains(search);
  }

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidUsername(String username) {
    return _usernameRegExp.hasMatch(username);
  }

  static isValidPassword(String password) {
    // return _passwordRegExp.hasMatch(password);
    return true;
  }
}
