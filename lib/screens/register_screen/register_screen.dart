import 'package:chat/cubits/register_cubit/register_cubit.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/widgets/constants.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_text_form_field.dart';
import 'package:chat/widgets/hims_details/hims_text.dart';
import 'package:chat/widgets/text_and_click_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widgets/hims_details/custom_hims_image.dart';
import '../../widgets/show_snack_bar.dart';
import '../../widgets/validations/email_validation.dart';
import '../../widgets/validations/password_validation.dart';

class RegisterScreen extends StatelessWidget {
  String? password;
  static String id = "RegisterPage";

  bool isloadin = false;

  String? email;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          isloadin = true;
        } else if (state is RegisterSuccessState) {
          showSnackBar(context, "Success");
          Navigator.pushNamed(context, LoginScreen.id);
          isloadin = false;
        } else if (state is RegisterFailureState) {
          showSnackBar(context, state.errorMessage);
          isloadin = false;
        }
      },
      builder: (context, state) {
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
                      const SizedBox(height: 25),
                      himsImage(),
                      himsText(),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Text(
                            "register now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "myfont",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        autofillHints: const [AutofillHints.email],
                        labelText: "Email Address",
                        validator: emailValidation,
                        onChange: (data) {
                          email = data;
                        },
                        hintText: "email",
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Text(
                            "Password requirements \n- At least 8 characters long \n- Contains at least one uppercase letter \n- Contains at least one lowercase letter \n- Contains at least one number \n- Contains at least one special character",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        autofillHints: const [AutofillHints.password],
                        labelText: "Password",
                        validator: passwordValidation,
                        onChange: (data) {
                          password = data;
                        },
                        hintText: "Password",
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(
                              context,
                            ).registerUser(email: email!, password: password!);
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                          }
                        },
                        text: "register now",
                      ),
                      const SizedBox(height: 6),
                      textAndClickRow(
                        text: "If you have an account",
                        click: "Click here",
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
