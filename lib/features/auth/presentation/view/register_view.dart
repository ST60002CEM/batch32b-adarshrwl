import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const mybox = SizedBox(height: 25);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  List<String> typeOfAccount = <String>['Buyer', 'Seller'];
  String dropDownValue = 'Buyer';
  bool isChecked = false;
  bool obscureTextVal = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-Up'),
        backgroundColor: Colors.deepPurpleAccent[100],
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xffF4EEF2),
                Color(0xffF4EEF2),
                Color(0xffE3EDF5),
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create an Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Username",
                      hintStyle:
                          const TextStyle(color: Colors.black45, fontSize: 19),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Email",
                      hintStyle:
                          const TextStyle(color: Colors.black45, fontSize: 19),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: obscureTextVal,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Password",
                      hintStyle:
                          const TextStyle(color: Colors.black45, fontSize: 19),
                      suffixIcon: IconButton(
                        icon: Icon(obscureTextVal
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            obscureTextVal = !obscureTextVal;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: obscureTextVal,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Confirm Password",
                      hintStyle:
                          const TextStyle(color: Colors.black45, fontSize: 19),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Phone number",
                      hintStyle:
                          const TextStyle(color: Colors.black45, fontSize: 19),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                  child: DropdownButtonFormField<String>(
                    value: dropDownValue,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                    items: typeOfAccount
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Type of Account",
                      hintStyle:
                          const TextStyle(color: Colors.black45, fontSize: 19),
                      prefixIcon: const Icon(Icons.house),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      },
                    ),
                    const Text(
                      "By submitting this form I agree to the Terms\nand Conditions.",
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
                    textColor: isChecked ? Colors.white : Colors.grey,
                    disabledColor: const Color.fromARGB(255, 186, 146, 255),
                    child: const Text(
                      'Confirm',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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
