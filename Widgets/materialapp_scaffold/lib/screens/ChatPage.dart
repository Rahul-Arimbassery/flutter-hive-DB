import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: ListView(
        children: List.generate(
          20,
          (index) {
            return Column(
              children: [
                ListTile(
                  title: Text('Person $index'),
                  subtitle: Text('Message $index'),
                  leading: const CircleAvatar(radius:40 ,backgroundImage: NetworkImage('https://tse3.mm.bing.net/th?id=OIP.TaLVIehZ_ZwbUaL06XNf4gHaE8&pid=Api&P=0'),),
                  trailing: Text('1$index:00 PM'),
                ),
                const Divider(
                  height: 18,
                  thickness: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
