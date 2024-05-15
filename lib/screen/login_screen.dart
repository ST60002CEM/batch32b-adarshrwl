import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const mybox = SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.amber[100],
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          mybox,
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Username/Email",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
          mybox,
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
          mybox,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 101, 249, 106),
                ),
                child: const Text("Login")),
          )
        ],
      ),
    );
  }
}
