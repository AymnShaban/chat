import 'package:chat/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/widgets/constants.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/hims_details/custom_hims_image.dart';
import 'package:chat/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/hims_details/hims_text.dart';
import '../widgets/show_snack_bar.dart';
import '../widgets/text_and_click_row.dart';
import '../widgets/validations/email_validation.dart';
import '../widgets/validations/password_validation.dart';
import 'chat_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";

  String? password;
  String? email;
  bool isloadin = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isloadin = true;
        } else if (state is LoginSuccessState) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatScreen.id, arguments: email);
          showSnackBar(context, 'Enjoy your chatting ');
          isloadin = false;
        } else if (state is LoginFailureState) {
          showSnackBar(context, state.errorMessage);
          isloadin = false;
        }
      },
      builder:
          (context, state) => ModalProgressHUD(
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
                          onChange: (data) {
                            email = data;
                          },
                          hintText: "email",
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          autofillHints: const [AutofillHints.password],
                          validator: passwordValidation,
                          obscureText: true,
                          onChange: (data) {
                            password = data;
                          },
                          hintText: "Password",
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(
                                context,
                              ).userSignIn(email: email!, password: password!);
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                              isloadin = false;
                            }
                          },
                          text: "Login now",
                        ),
                        const SizedBox(height: 9),
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
          ),
    );
  }
}
