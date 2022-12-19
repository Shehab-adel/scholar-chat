import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/cubits/register_cubits/register_cubit.dart';
import 'package:scholar_chat/screens/widget/login_screen/buttonWidget.dart';
import 'package:scholar_chat/screens/widget/login_screen/text_field._widget.dart';

import '../utils/my_Strings.dart';
import '../utils/shared_functions.dart';
import 'chat_screen.dart';

class RegisterScreen extends StatelessWidget {
  late Size size;
  static const registerRoute = 'register';
  String? email;

  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var registerCubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSucceess) {
          Navigator.pushNamedAndRemoveUntil(
              context, ChatScreen.chatRoute, (route) => false,
              arguments: email);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(
            state.errorMessage,
            context,
          );
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kprimaryColor,
            ),
            backgroundColor: kprimaryColor,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: size.height * .1),
                  child: Column(children: [
                    Image.asset('assets/images/scholar.png'),
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
                        'REGISTER',
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
                      text: 'REGISTER',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          registerCubit.registerWithAuth(
                              email!, password!, context);
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already have an account ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.pop(context);
                          }),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Color(0xffC7EDE6), fontSize: 16),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
