import 'package:flutter/material.dart';
import 'package:google/animated_list.dart';
import 'package:google/register_screen.dart';
import 'package:google/share/comp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //@override
  //void initState() {
  //super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: size.height / 3,
                    color: const Color.fromARGB(255, 11, 76, 216),
                    child: Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height / 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      myTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (emailController.text.contains('@') ==
                                    false ||
                                emailController.text.contains('.') == false) {
                              return 'Please Enter a Valid Email';
                            }
                            return null;
                          },
                          labelText: 'Email',
                          prefixIcon: Icons.email,
                          padding: 15.0,
                          keyboardtype: TextInputType.emailAddress),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 charcters';
                            }
                            return null;
                          },
                          obscureText: isPassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: 'Passsword',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  icon: Icon(isPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height / 10),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height / 60),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                          debugPrint (emailController.text);
                          debugPrint (passwordController.text);
                        MyNavigator(context: context, widget: const AnimatedListScreen());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 11, 76, 216),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width / 3,
                            vertical: size.height / 60),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: const Text("Login"),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    MyNavigator(
                        context: context, widget: const RegisterScreen());
                  },
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 3.3,
                          vertical: size.height / 60),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 11, 76, 216), width: 2),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Color.fromARGB(255, 11, 76, 216)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
