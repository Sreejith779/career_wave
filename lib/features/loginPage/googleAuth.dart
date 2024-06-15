import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final   googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        final AuthCredential authCredential =   GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken
        );
        await auth.signInWithCredential(authCredential);
      }
    }
    on FirebaseAuthException
    catch (e) {}
  }
   googleSignOut()async{
    await googleSignIn.signOut();
  }
}
