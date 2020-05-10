class User {
  String _userid;
  String _firstName;
  String _lastName;
  String _lastSignedIn = DateTime.now().toString();
  String _lastmodified = DateTime.now().toString();

  String get userName => _userid;
  String get firstName => _firstName;

  String get displayName {
    return '$_firstName $_lastName';
  }

  String get lastName => _lastName;
  String get lastSignIn => _lastSignedIn;
  String get lastModified => _lastmodified;

  User(this._userid, this._firstName, this._lastName);
 
}
