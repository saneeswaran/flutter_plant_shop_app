// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop_ui/data/plants.dart';
import 'package:plant_shop_ui/pages/bottomNavBar.dart';
import 'package:plant_shop_ui/pages/signin_page.dart';
import 'package:plant_shop_ui/widgets/custom_field.dart';

import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  bool isObscure = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.04),
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
                height: height * 0.50,
                width: width * 1,
                child: Image.asset(
                  introPlantImages[2],
                  fit: BoxFit.cover,
                )),
            CustomField(
                hintText: "Enter your email address",
                icon: Icons.email,
                filledColor: Colors.grey.shade100,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                suffixIcon: null,
                suffixIconOnTap: null),
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
            SizedBox(
              height: height * 0.02,
            ),
            CustomButton(
              onTap: navigation,
              text: "Login",
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const SigninPage()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> navigation() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(PageTransition(
          type: PageTransitionType.rightToLeft, child: const Bottomnavbar()));
    });
  }
}
