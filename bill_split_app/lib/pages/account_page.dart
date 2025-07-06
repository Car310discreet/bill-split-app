import 'package:bill_split_app/widgets/Preferences.dart';
import 'package:bill_split_app/widgets/User_Profile.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfile(),
            Preferences(),
            Card(
              color: Colors.grey.shade900,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: ()=>{}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.logout,color: Colors.grey,size: 20,),
                      SizedBox(width: 20),
                      Text(
                        'Logout',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  )
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
