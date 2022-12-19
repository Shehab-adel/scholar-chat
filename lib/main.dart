import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:scholar_chat/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/cubits/register_cubits/register_cubit.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/login_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: ((context) => LoginCubit())),
      BlocProvider(create: ((context) => RegisterCubit())),
      BlocProvider(create: ((context) => ChatCubit())),
    ],
    child: const ScholarChat(),
  ));
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LoginScreen.loginRoute: ((context) => LoginScreen()),
        RegisterScreen.registerRoute: ((context) => RegisterScreen()),
        ChatScreen.chatRoute: ((context) => ChatScreen())
      },
      initialRoute: LoginScreen.loginRoute,
    );
  }
}
