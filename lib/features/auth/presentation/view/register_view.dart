import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';
import 'package:snapdwell/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:snapdwell/screen/login_screen.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {

  final _formKey = GlobalKey<FormState>();
  bool obscureTextVal = true;
  Color backgroundColor1 = const Color(0xffE9EAF7);
  Color backgroundColor2 = const Color(0xffF4EEF2);
  Color backgroundColor3 = const Color(0xffEBEBF2);
  Color backgroundColor4 = const Color(0xffE3EDF5);
  Color primaryColor = const Color(0xffD897FD);
  Color textColor1 = const Color(0xff353047);
  Color textColor2 = const Color(0xff6F6B7A);
  Color buttonColor = const Color(0xffFD6B68);


  // create an email and password controller
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              backgroundColor2,
              backgroundColor2,
              backgroundColor4,
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: SafeArea(
              child: ListView(
                children: [
                  SizedBox(height: size.height * 0.03),
                  // create an account text
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
                  // add image of my platform
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/fund_nepal_logo.png'),
                      height: 100,
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  // for username and password
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 4,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      validator: ((value){
                        if(value!.isEmpty){
                          return "Please enter email";
                        }
                        return null;

                      }),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Email",
                        focusColor: Colors.black,
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7,),Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 4,
                    ),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Username",
                        focusColor: Colors.black,
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7,),Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 4,
                    ),
                    child: TextFormField(

                      // add the input type to only accept numbers and not alphabets
                      keyboardType: TextInputType.number,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Phone number",
                        focusColor: Colors.black,
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 4,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      // change the border color to black
                      obscureText: obscureTextVal,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Password",
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 19,
                          ),
                          suffixIcon: IconButton(
                            icon:  Icon(
                              obscureTextVal ? Icons.visibility : Icons.visibility_off
                            ),
                            color: Colors.black, onPressed: () {
                            setState(() {
                              obscureTextVal = !obscureTextVal;
                            });
                          },
                          )),
                    ),
                  ),
                  const SizedBox(height: 1),

                  SizedBox(height: size.height * 0.04),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                var user = AuthEntity(
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                );

                                ref
                                    .read(authViewModelProvider.notifier)
                                    .registerUser(user);
                              }
                            },
                            style: ElevatedButton.styleFrom(

                              backgroundColor: Colors.blueAccent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ), child: const Text("Sign Up",
                            style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 2,
                              width: size.width * 0.2,
                              color: Colors.black12,
                            ),
                            Text(
                              "  Or ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textColor2,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              height: 2,
                              width: size.width * 0.2,
                              color: Colors.black12,
                            ),
                          ],
                        ),

                        SizedBox(height: size.height * 0.02),
                        // sign in with google button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  height: 30,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Sign in with Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                        SizedBox(height: size.height * 0.03),
                        // don't have an account text and then a text button to take the user to signup page
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // navigate to the signup page
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
