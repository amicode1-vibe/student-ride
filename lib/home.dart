import 'package:flutter/material.dart';
import 'package:studentride/setting.dart';
import 'package:studentride/driverdetails.dart';
import 'package:studentride/ridedetails.dart';
import 'package:studentride/profile.dart';

class MainNavigation extends StatefulWidget {
  final String role;

  const MainNavigation({super.key, required this.role});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      /// HOME TAB
      HomeTab(role: widget.role),

      /// RIDES TAB
      Scaffold(
        appBar: AppBar(
          title: const Text("My Rides"),
          backgroundColor: Colors.blue,
        ),

        body: ListView(
          padding: const EdgeInsets.all(15),

          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "College Gate → Gopeshwar",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue),
                      SizedBox(width: 5),
                      Text("10 min away"),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Row(
                    children: [
                      Icon(Icons.currency_rupee, color: Colors.green),
                      SizedBox(width: 5),
                      Text("₹120"),
                    ],
                  ),
                  const SizedBox(height: 10),

                  const Row(
                    children: [
                      Icon(Icons.person, color: Colors.orange),
                      SizedBox(width: 5),
                      Text("Rahul Rawat"),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Row(
                    children: [
                      Icon(Icons.directions_car, color: Colors.purple),
                      SizedBox(width: 5),
                      Text("Swift Dzire"),
                    ],
                  ),
                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ride Completed Successfully"),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),

                    child: const Text(
                      "Completed",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// SETTINGS TAB
      widget.role == "driver"
          ? const ProfileScreen()
          : SettingsScreen(role: widget.role),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedFontSize: 12,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        selectedItemColor: Colors.blue,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: "Rides",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

/// HOME TAB

class HomeTab extends StatelessWidget {
  final String role;

  const HomeTab({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    bool isDriver = role == "driver";
    if (isDriver) {
      if (isDriver) {
        return Scaffold(
          backgroundColor: const Color(0xfff5f7fb),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TOP BLUE HEADER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),

                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.menu, color: Colors.white, size: 32),

                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.blue),
                          ),
                        ],
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        "Welcome Driver",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "You have 3 new ride requests",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),

                      const SizedBox(height: 30),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.people,
                                  color: Colors.blue,
                                  size: 35,
                                ),

                                SizedBox(height: 10),

                                Text(
                                  "12",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "Passengers",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),

                            Container(height: 80, width: 1, color: Colors.grey),

                            Column(
                              children: const [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.green,
                                  size: 40,
                                ),

                                SizedBox(height: 10),

                                Text(
                                  "₹850",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "Today's Earning",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
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

                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Ride Requests",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,

                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(26),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.orange.shade100,

                            child: const Icon(
                              Icons.school,
                              color: Colors.orange,
                              size: 32,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "Student ${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  "Pickup: College Gate",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RideDetailsScreen(),
                                ),
                              );
                            },

                            child: const Text(
                              "Accept",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      }
    }
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),

      body: SafeArea(
        child: Column(
          children: [
            /// TOP BLUE HEADER
            Container(
              padding: const EdgeInsets.all(25),

              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white, size: 30),

                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.blue),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  const Text(
                    "Welcome student",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Drivers Nearby",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Find nearby drivers quickly",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  const SizedBox(height: 25),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 20,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Icon(Icons.people, color: Colors.blue, size: 35),

                            SizedBox(height: 10),

                            Text(
                              "12",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Drivers",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),

                        Container(height: 80, width: 1, color: Colors.grey),

                        Column(
                          children: const [
                            Icon(
                              Icons.access_time,
                              color: Colors.green,
                              size: 35,
                            ),

                            SizedBox(height: 10),

                            Text(
                              "15 min",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Arrival",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
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

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Available Drivers",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: 5,

                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverDetailsScreen(
                            driverName: "Driver ${index + 1}",
                            driverPhone: "9876543210",
                          ),
                        ),
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(26),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue.shade100,

                            child: const Icon(
                              Icons.directions_car,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "Driver ${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  "Arriving in 10 mins",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: const Text(
                              "Nearby",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
