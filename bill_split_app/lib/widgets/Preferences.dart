import 'package:flutter/material.dart';

class Preferences extends StatelessWidget{

  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Preferences', style: TextStyle(color: Colors.grey, fontSize: 18),),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          color: Colors.grey.shade900,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: ()=>{},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined, size: 20,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text('Email Settings', style: TextStyle(color: Colors.grey, fontSize: 20),),
                    ],
                  )
                ),
                TextButton(
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications, size: 20, color: Colors.grey),
                      SizedBox(width: 20),
                      Text(
                        'Notification Settings',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_outline_sharp, size: 20, color: Colors.grey,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Security',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}