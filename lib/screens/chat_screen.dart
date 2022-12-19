import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:scholar_chat/model/message.dart';
import 'package:scholar_chat/screens/widget/chat_screen/container_chat_widget.dart';
import 'package:scholar_chat/screens/widget/chat_screen/text_field_widget.dart';
import 'package:scholar_chat/utils/my_Strings.dart';

class ChatScreen extends StatelessWidget {
  final scontroller = ScrollController();

  String? message;
  static const chatRoute = 'chat_screen';
  List<Message> messagesList = [];

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                kimage,
                width: 50,
                height: 50,
              ),
              const Text('Scholar chat'),
            ],
          ),
        ),
        body: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is ChatSuccess) {
              messagesList = state.messageList;
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: scontroller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? ContainerChatWidget(
                                color: kprimaryColor,
                                text: messagesList[index].message,
                                bottomRight: const Radius.circular(20),
                                alignment: Alignment.centerLeft,
                              )
                            : ContainerChatWidget(
                                color: Colors.green,
                                text: messagesList[index].message,
                                bottomRight: const Radius.circular(20),
                                alignment: Alignment.centerRight,
                              );
                      },
                      itemCount: messagesList.length),
                ),
                TextFieldWidget(
                  onEditingCompeleting: () {
                    scontroller.animateTo(
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                )
              ],
            );
          },
        ));
  }
}
