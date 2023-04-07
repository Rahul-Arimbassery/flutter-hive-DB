import 'package:flutter/material.dart';
import 'package:materialapp_scaffold/screens/ChatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 71, 25, 0.733),
        title: const Text("WhatsApp"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "New Group",
                child: Text("New Group"),
              ),
              const PopupMenuItem(
                value: "New Broadcast",
                child: Text("New Broadcast"),
              ),
              const PopupMenuItem(
                value: "WhatsApp Web",
                child: Text("WhatsApp Web"),
              ),
              const PopupMenuItem(
                value: "Starred Messages",
                child: Text("Starred Messages"),
              ),
              const PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
            ];
          })
        ],
        bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ]),
      ),
      body: TabBarView(controller: _controller, children: const [
        Text('Camera'),
        ChatPage(),
        Text('Status'),
        Text('Calls'),
      ]),
    );
  }
}
