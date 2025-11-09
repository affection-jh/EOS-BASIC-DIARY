import 'package:diary/screen/home_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          Spacer(),
          Image.asset("assets/images/기쁨.png", width: 100, height: 100),
          Text(
            "EOS x BASIC",
            style: TextStyle(
              color: const Color.fromARGB(255, 44, 44, 44),
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "에오스 일기장,",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          _buildGoogleLoginButton(),
          _buildAppleLoginButton(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildAppleLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(double.infinity, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/apple_logo.png", width: 30, height: 30),
            SizedBox(width: 10),
            Text("애플로 시작하기", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogleLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ElevatedButton(
        onPressed: () async {
          // write logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(double.infinity, 60),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google_logo.png", width: 30, height: 30),
            SizedBox(width: 10),
            Text("구글로 시작하기", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
