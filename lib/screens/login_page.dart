// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:todo_list/screens/admin/allBook_page.dart';

import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      if (passwordController.text.isNotEmpty &&
          emailController.text.isNotEmpty) {
        var response = await http.post(
            Uri.parse("http://10.153.134.203:5000/api/users/login"),
            body: ({
              'email': emailController.text,
              'password': passwordController.text
            }));
        //debugPrint(response.body);
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => AllBook())));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid credential")));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Back field is not allowed")));
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.menu_book,
                    color: Colors.blueGrey,
                    size: 160,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Modip Books",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      controller: emailController,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 30,
                        ),
                        labelText: "Email",
                        labelStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(
                            Icons.lock_clock_outlined,
                            size: 30,
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          suffixIcon: IconButton(
                            onPressed: () => setState(
                                () => obscurePassword = !obscurePassword),
                            icon: Icon(obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        login();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "List of",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: Text(
                          " Books",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
