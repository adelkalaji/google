import 'package:flutter/material.dart';
import 'package:google/login_screen.dart';
import 'package:google/share/comp.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
  
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // مشان اعرف طول وعرض بدقة اش ما كان الجهاز واشتغل فيون عكيفي
    // double width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // لما منضيفو يكون مرن متل اذا طلع كيبورد او صار شي بالشاشة بضل مرن scroll بخلي
      resizeToAvoidBottomInset: true,
      body:
          // crollable ويدجت بتخلي الولاد تبعا
          GestureDetector(
             onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
                  child: Form(
                    key:formKey ,
                    child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipPath(
                                  clipper: MyClipper(),
                                  child: Stack(
                    children: [
                      Container(
                        color: Colors.purple,
                        height: size.height / 3,
                        child: const Center(
                            child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                      Positioned(
                          top: size.height / 30,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )))
                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      myTextFormField(
                        controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                            return null;
                          },
                          labelText: "Full Name",
                          prefixIcon: Icons.person,
                          padding: 8.0,
                          keyboardtype: TextInputType.name),
                      myTextFormField(
                        controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                            else if (emailController.text.contains('@') ==
                                    false ||
                                emailController.text.contains('.') == false) {
                              return 'Please Enter a Valid Email';
                            }
                            return null;
                          },
                          labelText: "Email",
                          prefixIcon: Icons.email,
                          padding: 8.0,
                          keyboardtype: TextInputType.emailAddress),
                        Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            else if (value.length < 8) {
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
                      ),
                       Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: confirmController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            else if (value.length < 8) {
                              return 'Password must be at least 8 charcters';
                            }
                            return null;
                          },
                          obscureText: isPassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: 'Confirm Passsword',
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
                      ),
                      myTextFormField(
                        controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Phone';
                            }
                            else if (value.length < 12) {
                              return 'Please Enter a Valid Phone Number';
                            }
                            return null;
                          },
                          labelText: "Phone",
                          prefixIcon: Icons.phone,
                          padding: 8.0,
                          keyboardtype: TextInputType.phone),
                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: size.height / 60),
                                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width / 3, vertical: size.height / 60),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: const Text("Register"),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                                  },
                                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 3, vertical: size.height / 60),
                      side: const BorderSide(color: Colors.purple, width: 2),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.purple),
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
