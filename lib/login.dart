import 'package:flutter/material.dart';
import 'package:studentride/signup.dart';
import 'package:studentride/home.dart';

class LoginScreen extends StatelessWidget {
  final String role;

  const LoginScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login as $role"), centerTitle: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            children: [
              const SizedBox(height: 40),

              Icon(
                role == "Driver" ? Icons.directions_bus : Icons.school,
                size: 110,
                color: role == "Driver" ? Colors.green : Colors.blue,
              ),

              const SizedBox(height: 30),

              Text(
                "Welcome $role",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Login to continue",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              /// PHONE FIELD
              TextField(
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                  hintText: "Enter Contact Number",

                  prefixIcon: const Icon(Icons.phone),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// PASSWORD FIELD
              TextField(
                obscureText: true,

                decoration: InputDecoration(
                  hintText: "Enter Password",

                  prefixIcon: const Icon(Icons.lock),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              /// LOGIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: role == "Driver"
                        ? Colors.green
                        : Colors.blue,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("$role Logged In")));
                  },

                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// SIGNUP BUTTON
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(role: role),
                    ),
                  );
                },

                child: Text(
                  "Create New $role Account",
                  style: TextStyle(
                    fontSize: 17,
                    color: role == "Driver" ? Colors.green : Colors.blue,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// FORGOT PASSWORD
              TextButton(
                onPressed: () {},

                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
