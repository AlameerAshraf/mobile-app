import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogle {
  GoogleSignIn googleSignIn;

  Future<void> login() async {
    googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final account = await googleSignIn.signIn().catchError((e) => print(e));
    final GoogleSignInAuthentication googleSignInAuthentication =
        await account.authentication;
  }
}
