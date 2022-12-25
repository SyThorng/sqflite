import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class admin extends StatelessWidget {
  admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/J.JPG'),
              )),
            ),
          ),
          Text(
            'Admin : Sythorng',
            style:
                GoogleFonts.aBeeZee(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
