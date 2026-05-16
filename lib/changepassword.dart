import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends State<ChangePasswordScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isCurrentPasswordHidden = true;
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const SizedBox(height: 20),

                /// ICON
                CircleAvatar(

                  radius: 45,
                  backgroundColor: Colors.blue.shade100,

                  child: const Icon(
                    Icons.lock,
                    size: 45,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 30),

                /// CURRENT PASSWORD
                TextFormField(

                  controller:
                  currentPasswordController,

                  obscureText:
                  isCurrentPasswordHidden,

                  decoration: InputDecoration(

                    labelText: "Current Password",

                    prefixIcon:
                    const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(

                      onPressed: () {

                        setState(() {

                          isCurrentPasswordHidden =
                          !isCurrentPasswordHidden;
                        });
                      },

                      icon: Icon(

                        isCurrentPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return "Enter current password";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// NEW PASSWORD
                TextFormField(

                  controller:
                  newPasswordController,

                  obscureText:
                  isNewPasswordHidden,

                  decoration: InputDecoration(

                    labelText: "New Password",

                    prefixIcon:
                    const Icon(Icons.lock),

                    suffixIcon: IconButton(

                      onPressed: () {

                        setState(() {

                          isNewPasswordHidden =
                          !isNewPasswordHidden;
                        });
                      },

                      icon: Icon(

                        isNewPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return "Enter new password";
                    }

                    if (value.length < 6) {

                      return "Password must be 6 characters";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// CONFIRM PASSWORD
                TextFormField(

                  controller:
                  confirmPasswordController,

                  obscureText:
                  isConfirmPasswordHidden,

                  decoration: InputDecoration(

                    labelText: "Confirm Password",

                    prefixIcon:
                    const Icon(Icons.security),

                    suffixIcon: IconButton(

                      onPressed: () {

                        setState(() {

                          isConfirmPasswordHidden =
                          !isConfirmPasswordHidden;
                        });
                      },

                      icon: Icon(

                        isConfirmPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return "Confirm your password";
                    }

                    if (value !=
                        newPasswordController.text) {

                      return "Passwords do not match";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 40),

                /// UPDATE BUTTON
                SizedBox(

                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed: () {

                      if (_formKey.currentState!
                          .validate()) {

                        showDialog(

                          context: context,

                          builder: (context) {

                            return AlertDialog(

                              title:
                              const Text("Success"),

                              content: const Text(
                                "Password Changed Successfully",
                              ),

                              actions: [

                                TextButton(

                                  onPressed: () {

                                    Navigator.pop(
                                        context);
                                  },

                                  child:
                                  const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.blue,

                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                    ),

                    child: const Text(

                      "Update Password",

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}