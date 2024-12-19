import 'package:flutter/material.dart';
import 'appstyle.dart';
import 'navigationscreen.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
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
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavigation()),);
        },
        icon: Icon(Icons.arrow_back)),
        title: Text('Notifications',style: Style.titleStyle,),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          // Return each notification item widget
          return NotificationItem(
            title: 'Notification Title $index',
            subtitle: 'This is the subtitle for notification $index',
            timestamp: 'Just now', // You can customize this
          );
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timestamp;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications,color: Colors.white60,),
      title: Text(title,style: Style.titleStyle2,),
      subtitle: Text(subtitle,style: Style.regularStyle,),
      trailing: Text(timestamp, style: TextStyle(color: Colors.grey)),
    );
  }
}