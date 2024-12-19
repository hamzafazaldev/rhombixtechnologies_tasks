import 'package:college_allert_application/appstyle.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample data for the profile
  String name = 'John Doe';
  String email = 'john.doe@example.com';
  String major = 'Computer Science';
  String bio = 'Aspiring software developer and tech enthusiast.';

  // Controllers for the text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with current profile data
    nameController.text = name;
    emailController.text = email;
    majorController.text = major;
    bioController.text = bio;
  }

  void saveProfile() {
    setState(() {
      name = nameController.text;
      email = emailController.text;
      major = majorController.text;
      bio = bioController.text;
    });
    // Optionally, show a snackbar or dialog to confirm the save
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: whiteColor
        ),
        title:  Text('Edit Profile',style: Style.titleStyle,),
        backgroundColor: indigoColor, // Darker app bar for contrast
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // White text
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white), // White label text
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // White border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Blue border when focused
                  ),
                ),
                style: const TextStyle(color: Colors.white), // White text input
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white), // White label text
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // White border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Blue border when focused
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white), // White text input
              ),
              const SizedBox(height: 10),
              TextField(
                controller: majorController,
                decoration: const InputDecoration(
                  labelText: 'Major',
                  labelStyle: TextStyle(color: Colors.white), // White label text
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // White border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Blue border when focused
                  ),
                ),
                style: const TextStyle(color: Colors.white), // White text input
              ),
              const SizedBox(height: 10),
              TextField(
                controller: bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  labelStyle: TextStyle(color: Colors.white), // White label text
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // White border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Blue border when focused
                  ),
                ),
                maxLines: 3,
                style: const TextStyle(color:              Colors.white), // White text input
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor // Button background color
                ),
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    nameController.dispose();
    emailController.dispose();
    majorController.dispose();
    bioController.dispose();
    super.dispose();
  }
}