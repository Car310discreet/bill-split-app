import 'package:flutter/material.dart';

class NoGroupsDisplay extends StatelessWidget{

  const NoGroupsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('No Groups Yet',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
          ),
          SizedBox(
            height: 80,
          ),
          TextButton(onPressed: ()=>{},
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_add_alt_1, color: Colors.lightGreen,size: 25,),
              SizedBox(
                width: 10,
              ),
              Text(
                    'Create a new Group',
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
            ],
           ),
          ),
      ],
    );
  }
}