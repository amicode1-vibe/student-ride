import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends State<EditProfileScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController phoneController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController dobController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    /// DUMMY DATA
    nameController.text = "Amit Rawat";
    phoneController.text = "9876543210";
    emailController.text = "studentride@gmail.com";
    dobController.text = "10/10/2005";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Form(

            key: _formKey,

            child: Column(
              children: [

                /// PROFILE IMAGE
                Stack(

                  children: [

                    CircleAvatar(
                      radius: 55,
                      backgroundColor:
                      Colors.blue.shade100,

                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),

                    Positioned(

                      bottom: 0,
                      right: 0,

                      child: Container(

                        padding: const EdgeInsets.all(8),

                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.circular(50),
                        ),

                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),




                /// NAME FIELD
                TextFormField(

                  controller: nameController,

                  decoration: InputDecoration(

                    labelText: "Full Name",

                    prefixIcon:
                    const Icon(Icons.person),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return "Enter your name";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),




                /// PHONE FIELD
                TextFormField(

                  controller: phoneController,

                  keyboardType: TextInputType.phone,

                  decoration: InputDecoration(

                    labelText: "Phone Number",

                    prefixIcon:
                    const Icon(Icons.phone),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return "Enter phone number";
                    }

                    if (value.length != 10) {

                      return "Enter valid number";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),




                /// EMAIL FIELD
                TextFormField(

                  controller: emailController,

                  keyboardType:
                  TextInputType.emailAddress,

                  decoration: InputDecoration(

                    labelText: "Email",

                    prefixIcon:
                    const Icon(Icons.email),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return "Enter email";
                    }

                    if (!value.contains("@")) {

                      return "Enter valid email";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),




                /// DOB FIELD
                TextFormField(

                  controller: dobController,
                  readOnly: true,

                  decoration: InputDecoration(

                    labelText: "Date of Birth",

                    prefixIcon:
                    const Icon(Icons.calendar_month),

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  onTap: () async {

                    DateTime? pickedDate =
                    await showDatePicker(

                      context: context,

                      firstDate: DateTime(1950),

                      lastDate: DateTime.now(),

                      initialDate: DateTime.now(),
                    );

                    if (pickedDate != null) {

                      dobController.text =
                      "${pickedDate.day}/"
                          "${pickedDate.month}/"
                          "${pickedDate.year}";
                    }
                  },

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return "Select DOB";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 40),




                /// SAVE BUTTON
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
                                "Profile Updated Successfully",
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

                      "Save Changes",

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