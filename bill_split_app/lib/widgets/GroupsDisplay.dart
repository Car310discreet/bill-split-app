import 'package:bill_split_app/classes/Group.dart';
import 'package:bill_split_app/pages/group_edit_page.dart';
import 'package:flutter/material.dart';

class GroupsDisplay extends StatefulWidget{

  final List<Group> groups;
  final String jwt;

  const GroupsDisplay({super.key, required this.groups, required this.jwt});

  @override
  State<GroupsDisplay> createState() => _GroupDisplayState();
}

class _GroupDisplayState extends State<GroupsDisplay>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.groups.length,
      itemBuilder: (context,index){
        final group = widget.groups[index];

        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.grey.shade900,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            title: Text('${group.groupName}',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightGreen),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> GroupEditPage(group: group, jwt: widget.jwt)));
            },
          ),
        );
      }
    );
  }
}