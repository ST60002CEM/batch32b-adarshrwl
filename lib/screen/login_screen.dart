import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snapdwell/screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const mybox = SizedBox(
    height: 25,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.deepPurpleAccent[100],
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
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
                    backgroundColor: const Color.fromARGB(255, 101, 249, 106),
                  ),
                  child: const Text("Login")),
            ),
            mybox,
            RichText(
                text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Don\'t have account? ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Sign up',
                  style: const TextStyle(
                    color: Colors.blue, // You can customize the color
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                ),
              ],
            )),
            mybox,
            const Text("Forget Password?"),
            mybox,
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      child: CircleAvatar(
                          child: Image.asset('assets/icons/google.png'))),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      child: CircleAvatar(
                          child: Image.asset('assets/icons/facebook.png')))
                ],
              ),
            )
          ]),
        ));
  }
}
