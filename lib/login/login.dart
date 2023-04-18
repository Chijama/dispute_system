import 'package:dispute_system/login/login_provider.dart';
import 'package:dispute_system/navBar.dart';
import 'package:flutter/material.dart';
import 'package:dispute_system/theme.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:email_validator/email_validator.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:dispute_system/textbox.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _passwordVisible = false;
  bool switchValue = false;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future login() async {
    showDialog(
        context: context,
        builder: (context) => SizedBox(
              height: 40,
              width: 40,
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  CircularProgressIndicator(
                      color: Theme.of(context).primaryColor)
                ],
                actionsAlignment: MainAxisAlignment.center,
              ),
            ));

    Response r;
    print('${emailController.text}, ${passwordController.text}');

    Map<String, String> body = {
      'email': emailController.text,
      'password': passwordController.text
    };
    r = await post(
      Uri.parse(
          "https://sddms-backend-production.up.railway.app/api/v1/auth/student/login"),
      body: body,
    );
   

    if (r.statusCode == 200) {
      if (!mounted) return;
 print(json.decode(r.body).toString());
    print(json.decode(r.body)['accessToken']);

    var state = Provider.of<LoginProvider>(context, listen: false);
    state.getToken(
        json.decode(r.body)['accessToken'],
        json.decode(r.body)['firstName'],
        json.decode(r.body)['matriculationNumber'],
        json.decode(r.body)['demerit']);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    } else if (r.statusCode == 404) {
      if (!mounted) return;
      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              contentPadding: const EdgeInsets.only(top: 10.0),
              content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2, color: Colors.red)),
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                    Text(
                      "Incorrect Email or Password",
                      style: TextStyles().kAlertTitleTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Try Again',
                      style: TextStyles().kAlertContentTextStyle,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themes().whiteColor,
        body: Container(
          //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/login_background.jpg'))),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              Text(
                'Welcome Back !',
                style: TextStyles()
                    .defaultText(19, FontWeight.w500, themes().primaryColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Login to view your demerits',
                style:
                    TextStyles().defaultText(15, FontWeight.w400, Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    MainTextInput(
                      controller: emailController,
                      mainText: 'Email Address',
                      labelText: 'user@mail.com',
                      validator: (value) {
                        if (value!.isEmpty || EmailValidator.validate(value)) {
                          null;
                        } else {
                          return "Please enter a valid email";
                        }
                        log("Validator is ${EmailValidator.validate(value)}");
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    MainTextInput(
                        validator: (password) {
                          if (password!.isEmpty ||
                              RegExp(r'(\s)').hasMatch(password)) {
                            return "Please enter a valid password";
                          } else {
                            return null;
                          }
                        },
                        mainText: 'Password',
                        controller: passwordController,
                        obscureText: _passwordVisible,
                        suffixWidget: InkWell(
                          onTap: () {
                            setState(() {
                              if (_passwordVisible == false) {
                                _passwordVisible = true;
                              } else {
                                _passwordVisible = false;
                              }

                              //_passwordVisible = !_passwordVisible;
                            });
                          },
                          child: _passwordVisible == false
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                   final form = formKey.currentState;
                            if (form!.validate()) {
                              login();
                            }
                },
                child: Text(
                  'Login',
                  style: TextStyles()
                      .defaultText(16, FontWeight.w600, Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.white,
                  backgroundColor: themes().primaryColor,
                  textStyle: const TextStyle(fontSize: 16),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute<Widget>(
                        //         builder: (BuildContext context) =>
                        //             const ResetPasswordPage()));
                      },
                      child: Text(
                        'Forget password ?',
                        style: TextStyles().defaultText(
                            14, FontWeight.w500, themes().darkerGreyColor),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
