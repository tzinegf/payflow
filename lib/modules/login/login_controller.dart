import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSingnIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
          name: response!.displayName!,
          email: response.email,
          photoUrl: response.photoUrl);
      authController.setUser(user, context);
    } catch (e) {
      authController.setUser(null, context);
    }
  }
}
