import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:scholar_chat/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';
import 'package:scholar_chat/screens/widget/login_screen/buttonWidget.dart';
import 'package:scholar_chat/screens/widget/login_screen/text_field._widget.dart';
import 'package:scholar_chat/utils/shared_functions.dart';

import '../utils/my_Strings.dart';

class LoginScreen extends StatelessWidget {
  late Size size;
  static const loginRoute = 'login';
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginCubit>(context);
    size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucceess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamedAndRemoveUntil(
              context, ChatScreen.chatRoute, (route) => false,
              arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(
            state.errorMessage,
            context,
          );
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kprimaryColor,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height * .1),
                child: Column(children: [
                  Image.asset(kimage),
                  const Text(
                    'Scholar Chat',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      left: size.width * .05,
                      top: size.height * .06,
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  TextFormFieldWidget(
                    hintText: 'Email',
                    onChange: (text) {
                      email = text;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormFieldWidget(
                    hintText: 'Password',
                    onChange: (text) {
                      password = text;
                    },
                  ),
                  ButtonWidget(
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        loginCubit.loginWithAuth(email!, password!, context);
                      } else {}
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.registerRoute);
                        },
                        child: const Text(
                          'Register',
                          style:
                              TextStyle(color: Color(0xffC7EDE6), fontSize: 16),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
