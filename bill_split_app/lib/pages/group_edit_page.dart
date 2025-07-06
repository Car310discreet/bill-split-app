import 'dart:convert';

import 'package:bill_split_app/classes/Expense.dart';
import 'package:bill_split_app/classes/Group.dart';
import 'package:bill_split_app/main.dart';
import 'package:bill_split_app/widgets/Expenses_Display.dart';
import 'package:bill_split_app/widgets/No_Expenses_Display.dart';
import 'package:bill_split_app/widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroupEditPage extends StatefulWidget{

  final Group group;
  final String jwt;

  const GroupEditPage({super.key,required this.group, required this.jwt});

  @override
  State<GroupEditPage> createState()=> _GroupEditPageState();
}

class _GroupEditPageState extends State<GroupEditPage>{

  Future<int>? splitExpenseFuture;
  Future<List<Expense>>? expensesFuture;

  Future<int> getSplitExpense() async {
    final uri = Uri.parse('${SERVER_IP}/user/groups/group/split-expense');
    final header = {"Authorization": "Bearer ${widget.jwt}"};
    final body = {"groupName": widget.group.groupName};
    final responce = await http.post(uri, headers: header, body: body);

    if (responce.statusCode == 200) {
      final Map<String,dynamic> data = jsonDecode(responce.body);
      return data['splitExpense'];
    } else if (responce.statusCode == 404) {
      throw Exception('Group not found');
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Expense>> getExpenses() async {
    final uri = Uri.parse('${SERVER_IP}/user/groups/group/expenses');
    final header = {"Authorization": "Bearer ${widget.jwt}"};
    final body = {"groupName": widget.group.groupName};
    final responce = await http.post(uri,headers: header,body: body);

    if(responce.statusCode == 200){
      final List<dynamic> data = jsonDecode(responce.body);
      return data.map((json)=>Expense.fromJson(json)).toList();
    }
    else if(responce.statusCode == 404){
      throw Exception('Group not found');
    }
    else{
      throw Exception('An error occurred');
    }
  }

  @override
  void initState() {
    super.initState();
    expensesFuture = getExpenses();
    splitExpenseFuture = getSplitExpense();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder<List<Expense>>(
                future: expensesFuture,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    if (asyncSnapshot.data!.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50, child: Searchbar()),
                          SizedBox(height: 200),
              
                          NoExpensesDisplay(),
                        ],
                      );
                    }
              
                    final expenses = asyncSnapshot.data!;
              
                    return ExpensesDisplay(expenses: expenses);
                  } else if (asyncSnapshot.hasError) {
                    return Center(
                      child: Text(
                        '${asyncSnapshot.error}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 300,
              width: 300,
              child: FutureBuilder<int>(
              future: splitExpenseFuture,
              builder: (context, asyncSnapshot){
                  if(asyncSnapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  else if(asyncSnapshot.hasData && asyncSnapshot.data!=null){
                    return Center(child: Text('Split Expense: ${asyncSnapshot.data}',style: TextStyle(color: Colors.lightGreen, fontSize: 25, fontWeight: FontWeight.bold),),);
                  }
                  else if(asyncSnapshot.hasError){
                    return Center(
                      child: Text(
                        '${asyncSnapshot.error}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  else{
                    return SizedBox();
                  }
                }
              
              ),
            )
          ],
        ),
      ),
    );
  }
}