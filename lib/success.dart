import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 120),

              const SizedBox(height: 30),

              const Text(
                "Ride Booked Successfully!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              const Text(
                "Driver is on the way 🚖",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  child: const Text("Done", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
