import 'package:flutter/material.dart';
import 'package:studentride/signup.dart';

class LoginScreen extends StatelessWidget {
  final String role;

  const LoginScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    var image = Image.asset("assets/images/logo.png", fit: BoxFit.cover);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: image,
              ),
            ),

            const SizedBox(height: 25),

            // APP NAME
            const Text(
              "Tripzo",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Choose Login Type",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 40),

            // DRIVER BUTTON
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(role: "driver"),
                    ),
                  );
                },

                icon: const Icon(Icons.drive_eta, color: Colors.white),

                label: const Text(
                  "Login as Driver",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // STUDENT BUTTON
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(role: "student"),
                    ),
                  );
                },

                icon: const Icon(Icons.school, color: Colors.white),

                label: const Text(
                  "Login as Student",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
