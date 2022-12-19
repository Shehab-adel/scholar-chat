import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat/model/message.dart';
import 'package:scholar_chat/utils/my_Strings.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  List<Message> messageList = [];

  void sendMessage({required String message, required String email}) async {
    await messages.add({
      kMessage: message,
      kCreatedAt: DateTime.now(),
      'id': email // John Doe
    }).then((value) {
      print('***************************************');
      print('message is added ');
      print('***************************************');
      emit(ChatSuccess(messageList: messageList));
    }).catchError(() {
      print('***************************************');
      print('message is added ');
      print('***************************************');
    });
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messageList: messageList));
    });
  }
}
