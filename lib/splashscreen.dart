import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(role: "student"),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // NEW LOGO
            Container(
              height: 170,
              width: 170,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),

                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // APP NAME
            const Text(
              "Tripzo",

              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            // TAG LINE
            const Text(
              "Ride Service of Chamoli",

              style: TextStyle(
                color: Colors.white70,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 40),

            // LOADING
            const CircularProgressIndicator(
              color: Colors.white,
            ),

          ],
        ),
      ),
    );
  }
}
