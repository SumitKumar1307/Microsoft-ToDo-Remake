// ignore: import_of_legacy_library_into_null_safe
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, dynamic>> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return {
    "email": googleUser.email,
    "photoUrl": googleUser.photoUrl,
    "credentials": await FirebaseAuth.instance.signInWithCredential(credential),
  };
}

Future<bool> signInWithEmail(String email, String password) async {
  try {
    FirebaseAuth.instance.
    signInWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch(e){
    print(e.code);
    return false;
  }
}

Future<bool> signUpWithEmail(String email, String password) async {
  try {
    FirebaseAuth.instance.
    createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch(e){
    print(e.code);
    return false;
  }
}

