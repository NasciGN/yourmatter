import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getUser() {
    return _auth.currentUser;
  }

  getUserName() {
    return limitarComReticencias(getUser().displayName.split(' ')[0]);
  }

  limitarComReticencias(String texto, {int limite = 25}) {
    if (texto.length <= limite) {
      return texto;
    } else {
      return '${texto.substring(0, limite - 3)}...';
    }
  }
}
