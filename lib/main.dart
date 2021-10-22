import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/ui/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF185ABD),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/unnamed.png",
                    width: 120,
                    height: 120,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "TO-DO",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Stay organised by keeping all your\nwork at one place",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 300,
              height: 70,
              margin: EdgeInsets.only(bottom: 25),
              child: CupertinoButton(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      letterSpacing: 0.5,
                      color: Colors.black),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  )
                },
              ),
              decoration: BoxDecoration(
                color: Color(0xFFCFEDFF),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
