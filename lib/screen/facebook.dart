import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class fb extends StatefulWidget {
  const fb({super.key});

  @override
  State<fb> createState() => _fbState();
}

class _fbState extends State<fb> {
  File? fileImage;

  Future openCamera() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      fileImage = File(file!.path);
    });
  }

  Future getImageFromGallary() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      fileImage = File(file!.path);
    });
  }

  void Bottomsheet(context) {
    showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      builder: (context) => Container(
        height: 600,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.grey,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ),
                Text('Admin'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 100),
                    width: 60,
                    child: MaterialButton(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    child: MaterialButton(
                      child: Icon(
                        Icons.photo,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        getImageFromGallary();
                      },
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          children: [Text('Post'), Icon(Icons.arrow_right)],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Center(
            child: Container(
              width: 300,
              height: 400,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.blue,
                      offset: Offset(20, 20),
                    ),
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.blue,
                      offset: Offset(-10, -10),
                    )
                  ]),
              padding: const EdgeInsets.all(50),
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_swtpoqxk.json'),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // MaterialButton(
          //   elevation: 20,
          //   onPressed: () {},
          //   child: const Text('Create Post'),
          //   color: Colors.blue,
          // )
          Container(
            child: ElevatedButton(
              onPressed: () {
                Bottomsheet(context);
              },
              child: Text('Create Post'),
            ),
          )
        ],
      ),
    );
  }
}
