import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Activity', style: TextStyle(color: Colors.lightGreen, fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 300,
            ),
            Center(child: Text('No activity yet', style: TextStyle(color: Colors.grey, fontSize: 25),)),
          ],
        )
      ),
    );
  }
}
