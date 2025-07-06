import 'dart:convert';
import 'package:bill_split_app/classes/Group.dart';
import 'package:bill_split_app/main.dart';
import 'package:bill_split_app/widgets/GroupsDisplay.dart';
import 'package:bill_split_app/widgets/No_Groups_Display.dart';
import 'package:bill_split_app/widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroupsPage extends StatefulWidget{
  
  GroupsPage(this.jwt,{super.key});

  String jwt;

  @override
  State<GroupsPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupsPage>{

  Future<List<Group>>? groupsFuture;

  Future<List<Group>> getGroups() async {
    final uri = Uri.parse('$SERVER_IP/user/groups');
    final header = {
      "Authorization": "Bearer ${widget.jwt}"
    };
    final response = await http.get(uri,headers: header);

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json)=>Group.fromJson(json)).toList();
    }
    else{
      throw Exception("Data not found");
    }
  }

  @override
  void initState() {
    super.initState();
    groupsFuture = getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(padding: EdgeInsetsGeometry.all(24),
      child: FutureBuilder<List<Group>>(
        future: groupsFuture,
        builder: (context, asyncSnapshot) {
      
          if(asyncSnapshot.hasData){
            if(asyncSnapshot.data!.isEmpty){
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50, child: Searchbar()),
                    SizedBox(height: 200),

                    NoGroupsDisplay(),
                  ],
                );
            }

            final groups = asyncSnapshot.data!;

            return GroupsDisplay(groups: groups, jwt: widget.jwt,);
            
          }
          else if(asyncSnapshot.hasError){
            return Center(child: Text('${asyncSnapshot.error}',style: TextStyle(color: Colors.white),));
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        }
      )
      ),
    );
  }
}