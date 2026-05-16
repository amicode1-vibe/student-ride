import 'package:flutter/material.dart';
import 'package:studentride/editprofile.dart';
import 'package:studentride/changepassword.dart';
import 'package:studentride/main.dart';
class SettingsScreen extends StatelessWidget {

  final String role;

  const SettingsScreen({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {

    final bool isDriver = role == "Driver";

    return Scaffold(

      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,

        backgroundColor:
        isDriver ? Colors.green : Colors.blue,
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              /// PROFILE CARD
              Container(

                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color:
                  isDriver
                      ? Colors.green.shade50
                      : Colors.blue.shade50,

                  borderRadius:
                  BorderRadius.circular(20),
                ),

                child: Column(
                  children: [

                    CircleAvatar(

                      radius: 40,

                      backgroundColor:
                      isDriver
                          ? Colors.green
                          : Colors.blue,

                      child: const Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "$role Account",

                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "studentride@gmail.com",

                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),




              /// EDIT PROFILE
              buildTile(
                icon: Icons.person_outline,
                title: "Edit Profile",

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
              ),




              /// CHANGE PASSWORD
              buildTile(
                icon: Icons.lock_outline,
                title: "Change Password",

                onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Change Password Clicked"),
                    ),
                  );
                },
              ),




              /// RIDE HISTORY
              buildTile(
                icon: Icons.history,
                title: "Ride History",

                onTap: () {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ride History Opened"),
                    ),
                  );
                },
              ),




              /// HELP & SUPPORT
              buildTile(
                icon: Icons.help_outline,
                title: "Help & Support",

                onTap: () {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Support Opened"),
                    ),
                  );
                },
              ),




              /// ABOUT APP
              buildTile(
                icon: Icons.info_outline,
                title: "About App",

                onTap: () {

                  showAboutDialog(

                    context: context,

                    applicationName: "Student Ride",

                    applicationVersion: "1.0.0",

                    children: [

                      const Text(
                        "Student Ride is a smart ride sharing app for students and drivers.",
                      ),
                    ],
                  );
                },
              ),




              /// DELETE ACCOUNT
              buildTile(

                icon: Icons.delete_outline,

                title: "Delete Account",

               onTap: () {

  showDialog(

    context: context,

    builder: (context) {

      return AlertDialog(

        title: const Text("Delete Account"),

        content: const Text(
          "Are you sure you want to delete your account?",
        ),

        actions: [

          /// CANCEL BUTTON
          TextButton(

            onPressed: () {

              Navigator.pop(context);
            },

            child: const Text("Cancel"),
          ),

          /// DELETE BUTTON
          ElevatedButton(

            onPressed: () {

              /// POPUP CLOSE
              Navigator.pop(context);

              /// SUCCESS MESSAGE
              ScaffoldMessenger.of(context).showSnackBar(

                const SnackBar(
                  content: Text(
                    "Account Deleted Successfully",
                  ),
                ),
              );

              /// REDIRECT TO MAIN SCREEN
              Navigator.pushAndRemoveUntil(

                context,

                MaterialPageRoute(

                  builder: (context) =>
                  const MyApp(),
                ),

                    (route) => false,
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),

            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
},
              ),

              const SizedBox(height: 40),




              /// LOGOUT BUTTON
              SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(

                  onPressed: () {

                    Navigator.popUntil(
                      context,
                          (route) => route.isFirst,
                    );
                  },

                  icon: const Icon(Icons.logout),

                  label: const Text(

                    "Logout",

                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }






  /// REUSABLE TILE
  Widget buildTile({

    required IconData icon,
    required String title,
    required VoidCallback onTap,

  }) {

    return Card(

      elevation: 2,

      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(

        leading: Icon(icon),

        title: Text(title),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        onTap: onTap,
      ),
    );
  }
}