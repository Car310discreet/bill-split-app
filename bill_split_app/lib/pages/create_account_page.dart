import 'package:bill_split_app/main.dart';
import 'package:bill_split_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) => AlertDialog(title: Text(title), content: Text(text)),
  );

  Future<int?> attemptSignUp(String name, String email, String password) async {
    final uri = Uri.parse('$SERVER_IP/signup');
    Map<String, String> request = {
      'name': name,
      'email': email,
      'password': password,
    };

    final response;

    try{
      response = await http.post(uri, body: request);
      if (true) {
        return response.statusCode;
      }
    }
    catch(err){
      print(err);
    }
  }

  void signup(BuildContext context) async{
    var name = _nameController.text;
    var email = _emailController.text;
    var password = _passwordController.text;

    var res = await attemptSignUp(name, email, password);

    if(res==201){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    }
    else if(res == 400){
      displayDialog(context, "User with email already exists", "Sign up with another email or log in if you already have an account");
    }
    else{
      displayDialog(context, "Error","An unkown error occurred ${res}" );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  labelText: 'Enter name',
                  labelStyle: TextStyle(color: Colors.lightGreen),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.lightGreen)
                  ),
                  labelText: 'Enter email',
                  labelStyle: TextStyle(color: Colors.lightGreen),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  labelText: 'Enter password',
                  labelStyle: TextStyle(color: Colors.lightGreen),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()=>signup(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: Text(
                  'Create account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
