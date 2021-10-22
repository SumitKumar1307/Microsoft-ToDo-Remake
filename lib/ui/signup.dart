import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/firebase_methods.dart';
import 'package:todo/main.dart';
import 'package:todo/ui/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                ContinueWithEmail(signIn: true)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.065,
                    ),
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F9FC),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Sign In with Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            margin: EdgeInsets.only(left: 17),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Icon(
                              Icons.email_outlined,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CupertinoButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () async {
                      await signInWithGoogle();
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F9FC),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Sign In with Google",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              margin: EdgeInsets.only(left: 17),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 24),
                              child: Icon(
                                FontAwesomeIcons.google,
                                size: 28,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                ContinueWithEmail(signIn: false)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.065,
                    ),
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F9FC),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Register with Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            margin: EdgeInsets.only(left: 17),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Icon(
                              Icons.email_outlined,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () async {
                    await signInWithGoogle();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F9FC),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Register with Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            margin: EdgeInsets.only(left: 17),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Icon(
                              FontAwesomeIcons.google,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
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

class ContinueWithEmail extends StatefulWidget {
  final bool signIn;
  const ContinueWithEmail({Key? key, required this.signIn}) : super(key: key);

  @override
  _ContinueWithEmailState createState() => _ContinueWithEmailState();
}

class _ContinueWithEmailState extends State<ContinueWithEmail> {
  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Text(
                  widget.signIn ? "Sign In" : "Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.065,
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F9FC),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: CupertinoTextField(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(color: Colors.transparent),
                    prefix: Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                    placeholder: "example@email.com",
                    controller: _email,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F9FC),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: CupertinoTextField(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(color: Colors.transparent),
                    prefix: Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Icon(
                        Icons.lock_open_sharp,
                        color: Colors.black,
                      ),
                    ),
                    placeholder: "password",
                    obscureText: true,
                    controller: _password,
                  ),
                ),
                Container(
                  child: CupertinoButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      if (widget.signIn) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                ContinueWithEmail(signIn: false),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                ContinueWithEmail(signIn: true),
                          ),
                        );
                      }
                    },
                    child: Text(
                      widget.signIn
                          ? "Don't have an account?"
                          : "Already have an account?",
                      style: TextStyle(
                        color: CupertinoColors.activeBlue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.0111),
                ),
                Container(
                  child: CupertinoButton(
                    child: Text(
                      widget.signIn ? "Sign In" : "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      var email = _email.text;
                      var password = _password.text;
                      bool result = false;

                      if (email == '' || password == '') {
                        showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            title: Text("Something Went Wrong!"),
                            content: Text(
                                "Neither the Email nor the Password field can be empty."),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("OK"),
                                onPressed: () => {Navigator.pop(context)},
                              )
                            ],
                          ),
                        );
                      } else if (widget.signIn) {
                        result = await signInWithEmail(email, password);
                      } else if (!widget.signIn) {
                        result = await signUpWithEmail(email, password);
                      }

                      if (result == false) {
                        showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            title: Text("Something Went Wrong!"),
                            content: Text(
                                "Please try again with correct credentials and a working internet connection"),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("OK"),
                                onPressed: () => {Navigator.pop(context)},
                              )
                            ],
                          ),
                        ); 
                      } else {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => HomeView()));
                        }
                    },
                    padding: EdgeInsets.all(0),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFFCFEDFF),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: EdgeInsets.only(top: 60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
