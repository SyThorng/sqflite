import 'package:fb_sqlit/screen/singup.dart';
import 'package:fb_sqlit/screen/home_sin.dart';
import 'package:fb_sqlit/show.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(home());
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_sig(),
    );
  }
}
