import 'package:dispute_system/navBar.dart';
import 'package:flutter/material.dart';
import 'package:dispute_system/theme.dart';
import 'package:dispute_system/textbox.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _passwordVisible = false;

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
              const MainTextInput(
                mainText: 'Email Address',
                labelText: 'user@mail.com',
              ),
              const SizedBox(
                height: 9,
              ),
              MainTextInput(
                  mainText: 'Password',
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => const NavBar()));
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

