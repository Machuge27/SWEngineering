import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'package:e_banking/screens/maindashboard.dart';

class Splashscreen extends StatefulWidget {
    const Splashscreen({Key? key}) : super(key: key);

    @override
    _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
    @override
    Widget build(BuildContext context) {
        return SafeArea(
                child: Scaffold(
            backgroundColor: Colors.blue.shade500,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    _topTextSection(),
                    Flexible(child: _topImageSection()),
                    _middleScreenText(),
                    _spashButton(context),
                ],
            ),
        ));
    }
}

Widget _topTextSection() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: const Column(
      children: [
        Text("Welcome to E-Banking",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),

        ),
        SizedBox(
          height: 16,
        ),
        Text("Your one stop for all your banking needs"),
      ],
    ),
    
  );
}

Widget _topImageSection() {
    return Container(
        child: Center(child: Image.asset("assets/images/splash.png")),
    );
}

Widget _middleScreenText() {
    return Container(
        child: Column(
            children: [
                Text("Get Started."),
            ],
            
        ),
    );
}

Widget _spashButton(context) {
    return Container(
      padding: const EdgeInsets.all(16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                FloatingActionButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(30),
                        ),
                        side: BorderSide(
                            width: 2.0,
                        ),
                    ),
                    onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                    },
                    child: const Icon(Icons.arrow_forward),
                ),
            ],
        ),
    );
}