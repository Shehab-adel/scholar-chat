import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:scholar_chat/utils/my_Strings.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    this.onEditingCompeleting,
  }) : super(key: key);

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  String? message;
  TextEditingController controller = TextEditingController();

  Function()? onEditingCompeleting;
  late String email;

  @override
  Widget build(BuildContext context) {
    var chatCubit = BlocProvider.of<ChatCubit>(context);
    email = ModalRoute.of(context)!.settings.arguments as String;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: controller,
        onEditingComplete: onEditingCompeleting,
        onSubmitted: (text) {
          message = text;
          chatCubit.sendMessage(message: message ?? '', email: email);
          controller.clear();
        },
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            hintText: 'Send Message',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                color: kprimaryColor,
              ),
            ),
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
