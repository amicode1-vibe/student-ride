import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Ride Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            /// MAP UI
            Container(
              height: 220,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),

                image: const DecorationImage(
                  image: AssetImage("assets/images/map_placeholder.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  /// DRIVER LOCATION
                  Positioned(
                    top: 40,
                    left: 60,

                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue,

                      child: const Icon(Icons.local_taxi, color: Colors.white),
                    ),
                  ),

                  /// STUDENT LOCATION
                  Positioned(
                    bottom: 40,
                    right: 70,

                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.red,

                      child: const Icon(Icons.location_on, color: Colors.white),
                    ),
                  ),

                  /// ETA BOX
                  Positioned(
                    top: 15,
                    right: 15,

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: const Text(
                        "10 min away",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 15),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      final Uri phoneUri = Uri(
                        scheme: 'tel',
                        path: '9876543210',
                      );

                      await launchUrl(phoneUri);
                    },
                    icon: const Icon(Icons.call, color: Colors.white),

                    label: const Text(
                      "Call",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    icon: const Icon(Icons.close, color: Colors.white),

                    label: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget rideInfo(IconData icon, String title, String value, Color color) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),

          child: Icon(icon, color: color),
        ),

        const SizedBox(width: 15),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

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
