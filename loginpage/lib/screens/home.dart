import 'package:flutter/material.dart';
import 'package:loginpage/screens/login.dart';
//import 'package:loginpage/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
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
                  leading: const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://tse3.mm.bing.net/th?id=OIP.TaLVIehZ_ZwbUaL06XNf4gHaE8&pid=Api&P=0'),
                  ),
                  trailing: Text('1$index:00 PM'),
                ),
                const Divider(
                  height: 18,
                  thickness: 1,
                ),
              ],
            );

            // return Column(
            //   children: [
            //     ListTile(
            //       title: Text('Person $index'),
            //       subtitle: Text('Message $index'),
            //       leading: ClipRRect(
            //         borderRadius: BorderRadius.circular(8.0),
            //         child: const Image(
            //           width: 80.0,
            //           height: 80.0, // set the same value to make it a square
            //           image: NetworkImage(
            //               'https://tse3.mm.bing.net/th?id=OIP.TaLVIehZ_ZwbUaL06XNf4gHaE8&pid=Api&P=0'),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       trailing: Text('1$index:00 PM'),
            //     ),
            //     const Divider(
            //       height: 18,
            //       thickness: 1,
            //     ),
            //   ],
            // );
          },
        ),
      ),
    );
  }

  signOut(BuildContext ctx) async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
