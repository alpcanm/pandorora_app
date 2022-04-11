class FirebaseURI {
  String baseUri = 'https://identitytoolkit.googleapis.com/v1';
  final String _firebaseApiKey;
  late String signInUri;
  late String signUpUri;
  late String changePassword;
  late String mailSender;
  late String getUserData;
  FirebaseURI(this._firebaseApiKey) {
    signInUri = '/accounts:signInWithPassword?key=$_firebaseApiKey';
    signUpUri = '/accounts:signUp?key=$_firebaseApiKey';
    mailSender = '/accounts:sendOobCode?key=$_firebaseApiKey';
    changePassword = '/accounts:update?key=$_firebaseApiKey';
    getUserData = '/accounts:lookup?key=$_firebaseApiKey';
  }
}
