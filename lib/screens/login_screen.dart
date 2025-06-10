import 'package:chat/screens/home_layout.dart';
import 'package:chat/widgets/constants.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/hims_details/custom_hims_image.dart';
import 'package:chat/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/hims_details/hims_text.dart';
import '../widgets/show_snack_bar.dart';
import '../widgets/text_and_click_row.dart';
import '../widgets/validatoins/email_validation.dart';
import '../widgets/validatoins/password_validation.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? password1;
  String? email;
  bool isloadin = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: isloadin,
      color: Colors.greenAccent,
      blur: 2,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            autovalidateMode: autoValidateMode,
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  himsImage(),
                  himsText(),
                  const SizedBox(height: 40),
                  const Row(
                    children: [
                      Text(
                        "Login now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "myfont",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    labelText: "Email Address",
                    validator: emailValidation,
                    onChange: (data){
                      email= data;
                    },
                    hintText: "email",
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    autofillHints: const [AutofillHints.password],
                    validator: passwordValidation,
                    obscureText: true,
                    onChange: (data){
                      password1 = data;
                    },
                    hintText: "Password",
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: () async {
                      isloadin = true;
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        try {
                          await userSignUp();
                          showSnackBar(context, "Success");
                          Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context,'No user found for that email.');
                            isloadin = false;
                            setState(() {});
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,'Wrong password provided for that user.');
                            isloadin = false;
                            setState(() {});
                          }
                        }
                      }
                      else {
                        showSnackBar(context, "There is a problem");
                        isloadin= false;
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {
                        });
                      }
                      isloadin= false;
                      setState(() {
                      });
                      showSnackBar(context, "Check your input data");
                    },
                    text: "Login now", ),
                  const SizedBox(height: 9),
                  textAndClickRow(text: "If you have an account", click: "Click here", context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userSignUp() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password1!
    );
  }


}
