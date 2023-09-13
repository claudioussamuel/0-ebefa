import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organiser/constants/controllers.dart';
import '../../../helper/custom_button.dart';
import '../../../helper/custom_textfield.dart';
import '../../../helper/password_textfeild.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            padding: EdgeInsets.all(
              8,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "EBEFA",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // ========== Sign Up ============
              ListTile(
                title: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: themeController.theme.primaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),

              if (_auth == Auth.signup)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: authController.name,
                            hintText: "Organizer Name",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: authController.email,
                            hintText: "Organizer Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextField(),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => authController.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: themeController.theme.primaryColor,
                                    ),
                                  )
                                : CustomButton(
                                    text: "Login",
                                    onTap: () {
                                      authController.signUp();
                                    },
                                  ),
                          ),
                        ],
                      )),
                ),
              // ============ Sign In =============
              ListTile(
                title: const Text(
                  "SignIn",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: themeController.theme.primaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: authController.email,
                            hintText: "Organizer Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextField(),
                          InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: "Forget Password?",
                                  content: Container(
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          controller:
                                              authController.forgetPword,
                                          hintText: "Email",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: Get.height * 0.02,
                              ),
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => authController.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: themeController.theme.primaryColor,
                                    ),
                                  )
                                : CustomButton(
                                    text: "Login",
                                    onTap: () {
                                      authController.signIn();
                                    },
                                  ),
                          ),
                        ],
                      )),
                ),
            ]),
          ),
        ),
      ),
    );
  }
}
