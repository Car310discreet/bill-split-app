import 'dart:convert';

import 'package:bill_split_app/pages/account_page.dart';
import 'package:bill_split_app/pages/activity_page.dart';
import 'package:bill_split_app/pages/friends_page.dart';
import 'package:bill_split_app/pages/groups_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  const HomePage(this.jwt,{super.key});

  final String jwt;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  var currindex = 0;

  @override
  Widget build(BuildContext context) {

    final pages = [
      GroupsPage(widget.jwt),
      FriendsPage(),
      ActivityPage(),
      AccountPage(),
    ];

    return Scaffold(
      body: pages[currindex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.group,
            semanticLabel: 'Groups',
          ),
          label: 'Groups'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_emotions_outlined,
              semanticLabel: 'Friends',
            ),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              semanticLabel: 'Activity',
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              semanticLabel: 'Account',
            ),
            label: 'Account',
          ),
        ],
        onTap: (index)=> {setState(() {
          currindex=index;
        })},
        currentIndex: currindex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.lightGreen,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        ),
    );
  }
}