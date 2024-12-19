import 'package:college_allert_application/homescreen.dart';
import 'package:college_allert_application/notificationscreen.dart';
import 'package:college_allert_application/settingscreen.dart';
import 'package:flutter/material.dart';
import 'appstyle.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

int pageIndex = 0;
static final List<Widget> page = [

      HomeScreen(),
      const Notificationscreen(),
      const Settings(),



];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: page[pageIndex],
      bottomNavigationBar: Container(
        height: 50,
        
        decoration: BoxDecoration(
          color: indigoColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: -10,
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              setState(() {
                pageIndex = 0;
              });
            }, icon: pageIndex == 0?
            Icon(Icons.home,color: blueGreyColor,size: 35,)
            :Icon(Icons.home,color: grey300Color,size: 35, )),
            IconButton(onPressed: (){
              setState(() {
                pageIndex = 1;
              });
            }, icon: pageIndex == 1?
            Icon(Icons.notifications,color: blueGreyColor,size: 35,)
            :Icon(Icons.notifications,color: grey300Color,size: 35, )),
            IconButton(onPressed: (){
              setState(() {
                pageIndex = 2;
              });
            },  icon: pageIndex == 2?
            Icon(Icons.settings,color: blueGreyColor,size: 35,)
            :Icon(Icons.settings,color: grey300Color,size: 35, )),
          ]
        ),
      ),
    );
  }
}