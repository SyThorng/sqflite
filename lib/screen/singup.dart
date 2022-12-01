import 'package:fb_sqlit/database/dbHelper.dart';
import 'package:fb_sqlit/model/u_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class singup extends StatefulWidget {
  singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  TextEditingController con_emial = TextEditingController();

  TextEditingController con_pw = TextEditingController();

  TextEditingController con_cf_pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 300,
              child: Lottie.network(
                  'https://assets3.lottiefiles.c2om/packages/lf20_mjlh3hcy.json'),
            ),
            const Text('Email'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: TextField(
                  controller: con_emial,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text('Input Email'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const Text('Password'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: TextField(
                  obscureText: true,
                  controller: con_pw,
                  decoration: const InputDecoration(
                    label: Text('Input Password'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const Text('Comfrom password'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: TextField(
                  obscureText: true,
                  controller: con_cf_pw,
                  // keyboardType: TextInputType,
                  decoration: const InputDecoration(
                    label: Text('Comfrom password'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            CupertinoButton(
                child: const Text('Sigup'),
                onPressed: () async {
                  await Dbhelper().insertUser(User(
                      uemail: con_emial.text,
                      upw: con_cf_pw.text == con_pw.text
                          ? con_pw.text
                          : con_cf_pw.text
                      // != con_pw.text
                      // ? showDialog(context: context, builder: (context) {
                      //   return const AlertDialog(
                      //     // title: Text('Field password'),
                      //     actionsAlignment: MainAxisAlignment.center,
                      //     actions: [
                      //       Text('feild password')
                      //     ],
                      //   );
                      // },)
                      ));
                })
          ],
        ),
      ),
    );
  }
}
