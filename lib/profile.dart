import 'package:flutter/material.dart';
import 'package:studentride/editprofile.dart';
import 'package:studentride/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Driver Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// TOP CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [
                  /// PROFILE IMAGE
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 60, color: Colors.blue),
                  ),

                  const SizedBox(height: 15),

                  /// NAME
                  const Text(
                    "Amit Rawat",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  /// PHONE
                  const Text(
                    "+91 9876543210",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),

                  const SizedBox(height: 20),

                  /// ONLINE SWITCH
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.green, size: 14),

                        SizedBox(width: 10),

                        Text(
                          "Online",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// VEHICLE CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),

              child: Column(
                children: [
                  profileTile(Icons.directions_car, "Vehicle", "Swift Dzire"),

                  const Divider(),

                  profileTile(
                    Icons.confirmation_number,
                    "Vehicle Number",
                    "UK07 AB 1234",
                  ),

                  const Divider(),

                  profileTile(Icons.star, "Rating", "4.9"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// BUTTONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 55),
                    ),

                    child: const Text("Edit Profile"),
                  ),

                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LoginScreen(role: "driver"),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 55),
                    ),

                    child: const Text("Logout"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileTile(IconData icon, String title, String value) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade50,

          child: Icon(icon, color: Colors.blue),
        ),

        const SizedBox(width: 15),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 5),

            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
