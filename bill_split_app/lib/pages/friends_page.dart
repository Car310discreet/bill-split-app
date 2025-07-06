import 'package:bill_split_app/widgets/No_Freinds_Display.dart';
import 'package:bill_split_app/widgets/searchBar.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50, child: Searchbar()),
            SizedBox(height: 50),
            Text(
              'Your Friends',
              style: TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 200),
            NoFriendsDisplay(),
          ],
        ),
      ),
    );
  }
}
