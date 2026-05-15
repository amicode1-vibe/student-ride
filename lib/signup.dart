import 'package:flutter/material.dart';
import 'package:studentride/home.dart';

class SignupScreen extends StatefulWidget {
  final String role;

  const SignupScreen({super.key, required this.role});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController vehicleNumberController = TextEditingController();

  final TextEditingController vehicleNameController = TextEditingController();

  final TextEditingController seatingCapacityController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    vehicleNumberController.dispose();
    vehicleNameController.dispose();
    seatingCapacityController.dispose();

    super.dispose();
  }

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime(2005),

      firstDate: DateTime(1980),

      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dobController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDriver = widget.role == "Driver";

    return Scaffold(
      appBar: AppBar(
        title: Text("Register as ${widget.role}"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                const SizedBox(height: 10),

                CircleAvatar(
                  radius: 50,

                  backgroundColor: isDriver
                      ? Colors.green.shade100
                      : Colors.blue.shade100,

                  child: Icon(
                    isDriver ? Icons.directions_bus : Icons.school,

                    size: 50,

                    color: isDriver ? Colors.green : Colors.blue,
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  "Create ${widget.role} Account",

                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                /// NAME
                TextFormField(
                  controller: nameController,

                  decoration: inputDecoration("Full Name", Icons.person),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Name is required";
                    }

                    if (value.length < 3) {
                      return "Enter valid name";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// DOB
                TextFormField(
                  controller: dobController,

                  readOnly: true,

                  onTap: pickDate,

                  decoration: inputDecoration(
                    "Date of Birth",
                    Icons.calendar_month,
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "DOB is required";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// PHONE
                TextFormField(
                  controller: phoneController,

                  keyboardType: TextInputType.phone,

                  decoration: inputDecoration("Contact Number", Icons.phone),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number required";
                    }

                    if (value.length != 10) {
                      return "Enter valid 10 digit number";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                TextFormField(
                  controller: passwordController,

                  obscureText: true,

                  decoration: inputDecoration("Password", Icons.lock),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }

                    if (value.length < 6) {
                      return "Minimum 6 characters";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                /// DRIVER FIELDS
                if (isDriver) ...[
                  TextFormField(
                    controller: vehicleNumberController,

                    decoration: inputDecoration(
                      "Vehicle Number",
                      Icons.confirmation_number,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vehicle number required";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: vehicleNameController,

                    decoration: inputDecoration(
                      "Vehicle Name",
                      Icons.directions_bus,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vehicle name required";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: seatingCapacityController,

                    keyboardType: TextInputType.number,

                    decoration: inputDecoration(
                      "Seating Capacity",
                      Icons.event_seat,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Capacity required";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                ],

                const SizedBox(height: 10),

                /// REGISTER BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDriver ? Colors.green : Colors.blue,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                MainNavigation(role: widget.role),
                          ),
                        );
                      }
                    },

                    child: const Text(
                      "Create Account",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text("Already have an account?"),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text("Login"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,

      prefixIcon: Icon(icon),

      filled: true,

      fillColor: Colors.grey.shade100,

      contentPadding: const EdgeInsets.symmetric(vertical: 18),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide: BorderSide(
          color: widget.role == "Driver" ? Colors.green : Colors.blue,
          width: 2,
        ),
      ),
    );
  }
}
