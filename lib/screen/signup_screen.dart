import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const mybox = SizedBox(
    height: 25,
  );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Retain 'Buyer' and 'Seller' in the dropdown options
  List<String> typeOfAccount = <String>[
    'Buyer',
    'Seller',
  ];
  // Set 'Buyer' as the default dropdown value
  String dropDownValue = 'Buyer';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign-Up'),
          backgroundColor: Colors.deepPurpleAccent[100],
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SignUpScreen.mybox,
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SignUpScreen.mybox,
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SignUpScreen.mybox,
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SignUpScreen.mybox,
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SignUpScreen.mybox,
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SignUpScreen.mybox,
              DropdownButtonFormField<String>(
                value: dropDownValue,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
                items:
                    typeOfAccount.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: "Type of Account",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.house),
                ),
              ),
              SignUpScreen.mybox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      }),
                  const Text(
                    """By submitting this form I agree to the Terms
                       and Conditions.""",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  onPressed: isChecked ? () {} : null,
                  color:
                      isChecked ? Colors.deepPurpleAccent[200] : Colors.white,
                  textColor: isChecked ? Colors.white : Colors.white,
                  disabledColor: const Color.fromARGB(255, 186, 146, 255),
                  child: const Text(
                    'Confirm',
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
