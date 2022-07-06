import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koolmind_task/loginScreen.dart';
import 'package:page_transition/page_transition.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late String email;
  late String password;
  late bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Image.asset(
                        "assets/Khomesicons/8E42E8EF-034F-4FC4-8952-E6755D820903.png"),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 30.0),
                    child: const Text(
                      "Fill Details to create account",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 30.0, right: 30.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 25),
                      ),
                      validator: (val) => !EmailValidator.validate(val!, true)
                          ? 'Not a valid email.'
                          : null,
                      onSaved: (val) => email = val!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 30.0, right: 30.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'UserName',
                        labelStyle: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 30.0, right: 30.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(fontSize: 25),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: TextButton(
                                onPressed: _toggle,
                                child: Text(
                                  _obscureText ? "Show" : "Hide",
                                )),
                          )),
                      validator: (val) =>
                          val!.length < 6 ? 'Password too short.' : null,
                      onSaved: (val) => password = val!,
                      obscureText: _obscureText,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const LoginScreen(),
                            isIos: true,
                            duration: const Duration(milliseconds: 400),
                          ),
                        );
                        Fluttertoast.showToast(
                          msg: "Account Created !!!",
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.CENTER,
                        );
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.green))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(left: 30.0, right: 30.0)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 30))),
                      child: const Text('Create Account'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
