import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget
{
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>
{

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  void _handleSubmitted(String text)
  {
    _textController.clear();
    ChatMessage message = ChatMessage
    (
      text : text,
    );
    setState(()
    {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
  return Container(
    color: Theme.of(context).cardColor,
    child: Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Adjust the padding
            child: TextField(
              decoration: InputDecoration(
                hintText: "Send a message",
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              controller: _textController,
              onSubmitted: _handleSubmitted,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => _handleSubmitted(_textController.text),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Column
      (
        children : <Widget>
        [
          Flexible
          (
            child : ListView.builder
            (
              padding : const EdgeInsets.all(8.0),
              reverse : true,
              itemBuilder : (_, int index) => _messages[index],
              itemCount : _messages.length,
            ),
          ),
          const Divider
          (
            height : 1.0,
          ),
          Container
          (
            decoration : BoxDecoration
            (
              color : Theme.of(context).cardColor,
            ),
            child : _textComposerWidget(),
          ),
        ]
      );
  }
}