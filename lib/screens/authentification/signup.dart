import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:ihm/constants/controllers.dart';
import 'package:ihm/constants/fire_base_constants.dart';
import 'package:ihm/styles/app_colors.dart';
import 'package:ihm/screens/authentification/login.dart';
import 'package:ihm/widgets/global_widgets/custom_button2.dart';
import 'package:ihm/widgets/global_widgets/custom_formfield.dart';
import 'package:ihm/widgets/global_widgets/custom_header.dart';
import 'package:ihm/widgets/global_widgets/custom_richtext.dart';

class SignUp extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _passwordVisible = true;
  final _userName = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  String get userName => _userName.text.trim();

  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();
  String get name => _nameController.text.trim();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.blackshade,
              ),
              CustomHeader(
                  text: 'Sign Up.',
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.08,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: AppColors.whiteshade,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.09),
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        headingText: "UserName",
                        hintText: "username",
                        obsecureText: false,
                        suffixIcon: const SizedBox(),
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        controller: _userName,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        headingText: "Email",
                        hintText: "Email",
                        obsecureText: false,
                        suffixIcon: const SizedBox(),
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() => CustomFormField(
                            headingText: "Password",
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            hintText: "At least 8 Character",
                            obsecureText: !userController.passwordVisible.value,
                            suffixIcon: IconButton(
                                icon: Icon(
                                  userController.passwordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  userController.passwordVisible.value =
                                      !userController.passwordVisible.value;
                                }),
                            controller: _passwordController,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      AuthButton(
                        onTap: () async {
                          authController.register(
                              _userName.text.trim(),
                              _emailController.text.trim(),
                              _passwordController.text.trim());
                        },
                        text: 'Sign Up',
                      ),
                      const SizedBox(
                        height: 20.0,
                        child: Text("or", textAlign: TextAlign.right),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: SignInButton(
                          Buttons.GoogleDark,
                          //elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 20.0),
                          onPressed: () {
                            authController.signInWithGoogle();
                          },
                        ),
                      ),
                      /* AuthButton(
                          onTap: () async {
                            authController.signInWithGoogle();
                          },
                          text: "Sign in with google"),*/

                      CustomRichText(
                        discription: 'Already Have an account? ',
                        text: 'Log In here',
                        onTap: () {
                          Get.offAll(LoginScreen());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
