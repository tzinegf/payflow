import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: size.height * 0.36,
            ),
            Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Image.asset(AppImages.person, height: 300, width: 208)),
            Positioned(
              right: 0,
              left: 0,
              bottom: size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      style: AppTextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: SocialLoginButton(
                      onTap: () {
                        controller.googleSingnIn(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
