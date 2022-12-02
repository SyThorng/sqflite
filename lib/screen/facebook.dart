import 'dart:io';

import 'package:fb_sqlit/database/dbHelper.dart';
import 'package:fb_sqlit/model/u_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

class fb extends StatefulWidget {
  const fb({super.key});
  @override
  State<fb> createState() => _fbState();
}

class _fbState extends State<fb> {
  TextEditingController _con_cap = TextEditingController();
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
      builder: (context) => SingleChildScrollView(
        child: Container(
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                  ),
                  const Text('Admin'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 120),
                      width: 60,
                      child: MaterialButton(
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          openCamera();
                        },
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      child: MaterialButton(
                        child: const Icon(
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
                          onPressed: () async {
                            if (_con_cap.text == '') {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  actions: [
                                    Text('Cannot post,plz input caption')
                                  ],
                                ),
                              );
                            } else {
                              Dbhelper().insertUser(User(
                                  uemail: 'Admin post',
                                  ucap: _con_cap.text,
                                  uimg: fileImage!.path.toString()));
                            }
                          },
                          child: Row(
                            children: [
                              const Text('Post'),
                              const Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: const Color.fromARGB(255, 198, 194, 194),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _con_cap,
                        decoration: InputDecoration(
                          hintText: 'Capiton',
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            image: fileImage == null
                                ? const DecorationImage(
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxNYteSfGL2nH_KaFgrO1-E7Bf2uDelvIQRmm9pYCz60SbEVv2clHf_3l1TfJ_6Vb985Q&usqp=CAU'),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(File(fileImage!.path))),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
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
              child: const Text('Create Post'),
            ),
          ),
        ],
      ),
    );
  }
}
