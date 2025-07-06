import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget{

  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Card(
              color: Colors.grey.shade900,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      radius: 25,
                    ),
                    Column(
                      children: [
                        Text('Anshul', style: TextStyle(color: Colors.lightGreen, fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 5,
                        ),
                        Text('anshulmarathe@gmail.com', style: TextStyle(color: Colors.grey, fontSize: 10),),
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}