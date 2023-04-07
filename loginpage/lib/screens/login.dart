import 'package:flutter/material.dart';
import 'package:loginpage/screens/home.dart';
import 'package:loginpage/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 27,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value is Empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 27,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkLogin(context);
                  } else {
                    print('no data');
                  }
                  //checkLogin(context);
                },
                icon: const Icon(Icons.check),
                label: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    final user = 'rahul';
    final passwrd = '123*';

    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == 'rahul' && _password == '123*') {
      final _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setBool(Save_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => ScreenHome(),
        ),
      );
    } else {
      final _errorMessage = 'User name & Password doe not match';
      //SnackbAr
      ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text(_errorMessage)));
      // //Aler Dialoge pop up
      // showDialog(
      //     context: ctx,
      //     builder: (ctx1) {
      //       return AlertDialog(
      //         title: Text('Error'),
      //         content: Text(_errorMessage),
      //         actions: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.of(ctx1).pop();
      //             },
      //             child: Text('Close'),
      //           )
      //         ],
      //       );
      //     });
    }
  }
}
