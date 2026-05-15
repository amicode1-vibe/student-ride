import 'package:flutter/material.dart';

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
      const RideTab(),

      /// SETTINGS TAB
      const SettingsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

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
    return Scaffold(
      appBar: AppBar(title: Text("$role Home"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(
              role == "Driver" ? Icons.drive_eta : Icons.school,
              size: 100,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            Text(
              "Welcome $role",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/// RIDES TAB

class RideTab extends StatelessWidget {
  const RideTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rides"), centerTitle: true),

      body: const Center(
        child: Text("Available Rides", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

/// SETTINGS TAB

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), centerTitle: true),

      body: const Center(
        child: Text("Settings Screen", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
