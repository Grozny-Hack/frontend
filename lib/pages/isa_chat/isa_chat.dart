import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/utils/app_colors.dart';

import '../../service/api_requests.dart';
import '../../utils/app_routes.dart';

import 'package:flutter/cupertino.dart';

import '../../utils/assets.dart';

class IsaChatPage extends StatefulWidget {
  IsaChatPage({super.key});

  @override
  State<IsaChatPage> createState() => _IsaChatPageState();
}

class _IsaChatPageState extends State<IsaChatPage> {
  List<ChatMessage> messages = [
    // ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    // ChatMessage(
    //     messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  final String _user = "sender";
  final String _ai = "receiver";

  final TextEditingController _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 160,
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                reverse: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType == "receiver"
                              ? Colors.grey.shade300
                              : AppColors.color7e56e8),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _Header(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.color7e56e8,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _chatController,
                        decoration: InputDecoration(
                            hintText: "Напишите сообщение...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        _handleSendPressed(_chatController.text);
                        _chatController.clear();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: AppColors.color7e56e8,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addMessage(ChatMessage m) {
    setState(() {
      print(1);
      messages.insert(0, m);
    });
  }

  void _handleSendPressed(String message) async {
    final textUserMessage =
        ChatMessage(messageContent: message, messageType: _user);
    _addMessage(textUserMessage);

    final String _messageText =
        await AuthService.askNeuralNetwork(message: message);

    final textNeuraLinkMessage =
        ChatMessage(messageContent: _messageText, messageType: _ai);

    _addMessage(textNeuraLinkMessage);
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_left_rounded),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Чат с ассистентом Иса',
                  style: TextStyle(
                    fontFamily: 'VarelaRound',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 100,
            height: 100,
            child: Image.asset(A.assetsHomePageIsaAvaImg),
          ),
        ],
      ),
    );
  }
}
