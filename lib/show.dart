import 'package:fb_sqlit/database/dbHelper.dart';
import 'package:fb_sqlit/model/u_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class show extends StatefulWidget {
  show({super.key});

  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  late Dbhelper db;

  List<User> users = [];

  @override
  void initState() {
    super.initState();
    db = Dbhelper();
    db.getUser().then((value) {
      setState(() {
        users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(users[index].uemail.toString()),
              subtitle: Text(users[index].upw.toString()),

              //show ID that we use as Auto ID
              // leading: CircleAvatar(child: Text(users[index].uid.toString())),

              // trailing:
              //     IconButton(onPressed: () async {}, icon: Icon(Icons.delete)),
            ),
          );
        },
      ),
    );
  }
}
