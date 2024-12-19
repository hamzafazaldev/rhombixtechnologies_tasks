import 'package:college_allert_application/navigationscreen.dart';
import 'package:college_allert_application/profilescreen.dart';
import 'package:flutter/material.dart';
import 'appstyle.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: whiteColor
        ),
        backgroundColor: indigoColor,
        leading: IconButton(onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => BottomNavigation()));
        }, icon: Icon(Icons.arrow_back)),
        title:  Text('Settings',style: Style.titleStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
             Text(
              'Profile',
              style: Style.titleStyle,
            ),
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/logo.png'), // Replace with your image
            ),
            const SizedBox(height: 10),
             Text(
              'John Doe', // Replace with student's name
              style: Style.titleStyle2,
            ),
            const Text(
              'Computer Science Major', // Replace with student's major
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Settings Options
             Text(
              'Settings',
              style: Style.titleStyle,
            ),
            const SizedBox(height: 10),
            ListTile(
              title:  Text('Account Settings',style: Style.regularStyle,),
              onTap: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context)=> ProfileScreen() ));
                // Navigate to account settings
              },
            ),
            ListTile(
              title:  Text('Notification Preferences',style: Style.regularStyle,),
              onTap: () {
                // Navigate to notification preferences
              },
            ),
            ListTile(
              title:  Text('Privacy Settings',style: Style.regularStyle,),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            ListTile(
              title:  Text('Help & Support',style: Style.regularStyle,),
              onTap: () {
                // Navigate to help and support
              },
            ),
            ListTile(
              title:  Text('Logout',style: Style.regularStyle,),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}