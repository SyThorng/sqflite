import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class admin extends StatefulWidget {
  admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  final Uri _url = Uri.parse('https://github.com/SyThorng');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

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
          ),
          TextButton(onPressed: _launchUrl, child: Icon(Icons.facebook)),
        ],
      ),
    );
  }
}
