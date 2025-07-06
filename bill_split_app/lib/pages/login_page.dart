import 'package:bill_split_app/classes/loginPost.dart';
import 'package:bill_split_app/main.dart';
import 'package:bill_split_app/pages/create_account_page.dart';
import 'package:bill_split_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) => AlertDialog(title: Text(title), content: Text(text)),
  );

  Future<String?> attemptLogin(String email, String password) async {
    final uri = Uri.parse('$SERVER_IP/login');
    Map<String, String> request = {'email': email, 'password': password};

    final response = await http.post(uri, body: request);

    if (response.statusCode == 200) {
      return LoginPost.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  void login(BuildContext context) async {
    var email = _emailController.text;
    var password = _passwordController.text;

    var jwt = await attemptLogin(email, password);

    if (jwt != null) {
      storage.write(key: "jwt", value: jwt);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(jwt)),
      );
    } else {
      displayDialog(
        context,
        "An error occurred",
        "No account was found matching the username and password",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelStyle: TextStyle(color: Colors.lightGreen),

                    labelText: 'Enter your username',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                    labelStyle: TextStyle(color: Colors.lightGreen),
                    labelText: 'Enter your password',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                  onPressed: () => {login(context)},
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                Text(
                  'Dont have an account?',
                  style: TextStyle(color: Colors.lightGreen),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                  child: Text(
                    'Create account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
