// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:college_allert_application/appstyle.dart';
import 'package:flutter/material.dart';
import 'profilescreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define constant styles
  final Color primaryColor = Colors.blue;

 

  final TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  final TextStyle subtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  final TextStyle bodyTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: indigoColor,
        leading: Builder(
          builder:(BuildContext context){
            return  IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Open the drawer
          },
        );
          }
          ),
        
        
        title: Text('Dashboard', style: titleStyle),
        actions: [
          IconButton(icon:  Icon(Icons.notifications, color: Colors.white,),
          onPressed: (){
            _showNotificationDialog(context);
          },),
          
          
          IconButton(icon: Icon(Icons.person, color: Colors.white),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()
      ));
      },),
        
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle navigation to home
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle navigation to settings
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle navigation to about
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWelcomeSection(context),
            SizedBox(height: 20),
            _buildNoticeSection(),
            SizedBox(height: 20),
            _buildIconGrid(context),
            SizedBox(height: 30),
            _buildMissionStatement(),
            SizedBox(height: 50),
            _buildImageSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showNotificationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Notifications'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Notification 1: This is your first notification.'),
              Text('Notification 2: This is your second notification.'),
              Text('Notification 3: This is your third notification.'),
              // Add more notifications as needed
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}

  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome To!', style: titleStyle),
                Text('XYZ College', style: subtitleStyle),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/logo.png',
              scale: 10,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.error, color: Colors.white, size: 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoticeSection() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[100],
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 150,
              child: ListTile(
                leading: Image.asset(
                  'assets/images/Notice${index + 1}.jpg',
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error, color: Colors.black),
                ),
                title: Text("Notice ${index + 1}"),
                subtitle: Text(
                  "This is a notification for students",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIconGrid(BuildContext context) {
    return Container(
      height: 320,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Column(
        children: List.generate(3, (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (colIndex) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Icon ${rowIndex * 3 + colIndex + 1} tapped")),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      'assets/images/icon${rowIndex * 3 + colIndex + 1}.png',
                      scale: 0.1,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error, color: Colors.black),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  Widget _buildMissionStatement() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'We are committed to enhancing the potential of our students, faculty, and staff by bringing\n'
        'positive change in their personal and professional lives.\n'
        'We motivate them for self-enlightenment through Quality Education, Personality Development,\n'
        'True Professionalism, and Career Planning\n'
        'to add value to our nation and humanity.',
        style: bodyTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      children: [
        Image.asset(
          'assets/images/College.jpg',
          fit: BoxFit.fitWidth,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.error, color: Colors.black, size: 50),
        ),
        SizedBox(height: 10),
        Image.asset(
          'assets/images/College2.jpg',
          fit: BoxFit.fitWidth,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.error, color: Colors.black, size: 50),
        ),
      ],
    );
  }
}
