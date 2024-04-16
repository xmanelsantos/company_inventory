import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  static bool get isLogged => FirebaseAuth.instance.currentUser != null;
}
