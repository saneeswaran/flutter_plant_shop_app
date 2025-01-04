// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop_ui/pages/bottomNavBar.dart';
import 'package:plant_shop_ui/pages/login_page.dart';

import '../screens/forgot_password.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';
import '../widgets/other_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

final emailController = TextEditingController();
final passController = TextEditingController();
bool isObscure = false;

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Plant",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "  Fresher",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 24,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
            const Text(
              "Let's Get Started!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: height * 0.10,
            ),
            //custom text field
            CustomField(
                controller: emailController,
                suffixIcon: null,
                filledColor: Colors.grey.shade100,
                suffixIconOnTap: () {},
                hintText: "Enter your email address",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress),
            SizedBox(
              height: height * 0.02,
            ),
            CustomField(
              controller: passController,
              filledColor: Colors.grey.shade100,
              suffixIcon:
                  isObscure ? Icons.remove_red_eye : Icons.visibility_off,
              suffixIconOnTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              hintText: "Enter your password",
              icon: Icons.password,
              keyboardType: TextInputType.text,
              obScure: isObscure ? false : true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const ForgotPassword()));
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  )),
            ),
            //button
            CustomButton(
              onTap: () {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pushReplacement(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const Bottomnavbar()));
                });
              },
              text: "Sign up",
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text("or Sign up with social account",
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(
              height: height * 0.02,
            ),
            OtherButton(
              icon: Icons.facebook,
              iconColor: Colors.blue,
              onPressed: () {},
              text: "Continue with Facebook",
            ),
            SizedBox(
              height: height * 0.02,
            ),
            OtherButton(
                icon: Icons.apple,
                iconColor: Colors.black,
                text: "Continue with Apple",
                onPressed: () {}),

            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const LoginPage()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
