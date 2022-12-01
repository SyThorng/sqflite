import 'package:fb_sqlit/database/dbHelper.dart';
import 'package:fb_sqlit/model/u_data.dart';
import 'package:fb_sqlit/screen/singup.dart';
import 'package:fb_sqlit/show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class home_sig extends StatefulWidget {
  home_sig({super.key});

  @override
  State<home_sig> createState() => _home_sigState();
}

class _home_sigState extends State<home_sig> {
  late Dbhelper db;
  List<User> users = [];

  TextEditingController emial_controller = TextEditingController();

  TextEditingController pw_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    db = Dbhelper();
    db.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 250,
                child: Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_xwabp3dh.json'),
              ),
            ),

            Container(margin: EdgeInsets.only(left: 20), child: Text('Email')),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: TextField(
                  controller: emial_controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text('Input Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Container(
            //     child: Text('Password'),
            //   ),
            // ),
            Container(
                margin: EdgeInsets.only(left: 20), child: Text('password')),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: TextField(
                  controller: pw_controller,
                  // keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.red,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    label: Text('Input password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                minWidth: 330,
                onPressed: () {},
                child: const Text('Logo'),
                color: Colors.blue,
              ),
            ),
            // const SizedBox(
            //   height: 200,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Do your have account?'),
                  ),
                  Container(
                      child: CupertinoButton(
                          child: const Text(
                            'Sigin',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => singup(),
                                ));
                          })),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
