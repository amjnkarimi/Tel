import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home:ChatListPage(),
))
;
    class ChatListPage extends StatelessWidget {
    final List<String> contacts = ['علی', 'سارا', 'رضا'];

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('چت‌ها')),
    body: ListView.builder(
    itemCount: contacts.length,
    itemBuilder: (context, index) {
    return ListTile(
    leading: CircleAvatar(child: Text(contacts[index][0])),
    title: Text(contacts[index]),
    subtitle: Text('آخرین پیام...'),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) => ChatPage(name: contacts[index]),
    ),
    );
    },
    );
    },
    ),
    );
    }
    }
class ChatPage extends StatefulWidget {
  final String name;
  ChatPage({required this.name});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];
  TextEditingController controller = TextEditingController();

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      setState(() {
        messages.add(controller.text);
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(messages[index]),
                ),
              ),
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: 'پیام بنویس...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}