import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop_ui/pages/login_page.dart';
import 'package:plant_shop_ui/widgets/custom_field.dart';

import '../constants/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/reset-password.png'),
              const Text(
                'Forgot\nPassword',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomField(
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
                iconColor: Colors.green,
                controller: forgetPasswordController,
                filledColor: null,
                suffixIcon: null,
                suffixIconOnTap: null,
                keyboardType: TextInputType.name,
                obScure: true,
              ),
              SizedBox(height: height * 0.02),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: width * 1,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const LoginPage(),
                          type: PageTransitionType.leftToRightWithFade));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
