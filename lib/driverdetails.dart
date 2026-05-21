import 'package:flutter/material.dart';
import 'package:studentride/bookingdetails.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverDetailsScreen extends StatelessWidget {
  final String driverName;
  final String driverPhone;

  const DriverDetailsScreen({
    super.key,
    required this.driverName,
    required this.driverPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,

        title: const Text("Driver Details"),
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
                  /// DRIVER IMAGE
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,

                    child: Icon(Icons.person, size: 60, color: Colors.blue),
                  ),

                  const SizedBox(height: 15),

                  /// NAME
                  Text(
                    driverName,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: const [
                      Icon(Icons.star, color: Colors.amber),

                      SizedBox(width: 5),

                      Text(
                        "4.9 Rating",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// DETAILS CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),

              child: Column(
                children: [
                  /// VEHICLE CARD
                  buildInfoCard(
                    icon: Icons.directions_car,
                    title: "Vehicle",
                    value: "Swift Dzire",
                  ),

                  buildInfoCard(
                    icon: Icons.confirmation_number,
                    title: "Vehicle Number",
                    value: "UP15 AB 1234",
                  ),

                  buildInfoCard(
                    icon: Icons.people,
                    title: "Seats Available",
                    value: "3 Seats",
                  ),

                  buildInfoCard(
                    icon: Icons.location_on,
                    title: "Current Location",
                    value: "Near College Road",
                  ),

                  buildInfoCard(
                    icon: Icons.access_time,
                    title: "Arrival Time",
                    value: "10 Minutes",
                  ),

                  const SizedBox(height: 30),

                  /// BUTTONS
                  Row(
                    children: [
                      /// CALL BUTTON
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            final Uri phoneUri = Uri(
                              scheme: 'tel',
                              path: driverPhone,
                            );
                            launchUrl(phoneUri);
                          },

                          icon: const Icon(Icons.call),

                          label: const Text("Call"),

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,

                            foregroundColor: Colors.white,

                            minimumSize: const Size(double.infinity, 55),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      /// BOOK BUTTON
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BookingDetailsScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.check),

                          label: const Text("Book Ride"),

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,

                            foregroundColor: Colors.white,

                            minimumSize: const Size(double.infinity, 55),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// REUSABLE CARD
  Widget buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,

            child: Icon(icon, color: Colors.blue),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),

                const SizedBox(height: 5),

                Text(
                  value,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
