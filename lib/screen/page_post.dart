import 'dart:io';

import 'package:fb_sqlit/database/dbHelper.dart';
import 'package:fb_sqlit/model/u_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class post extends StatefulWidget {
  post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  File? fileImage;
  dynamic col = Colors.white;
  List<User> users = [];
  late Dbhelper db;
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
      drawer: Drawer(),
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 610,
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                      ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 60,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                  image: users[index].uemail.toString() ==
                                          'Thorng@gmail.com'
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              'https://upload.wikimedia.org/wikipedia/en/thumb/5/5f/TomandJerryTitleCardc.jpg/220px-TomandJerryTitleCardc.jpg'),
                                          fit: BoxFit.cover)
                                      : DecorationImage(
                                          image: FileImage(File(
                                              users[index].uimg.toString())),
                                          fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  users[index].uemail.toString(),
                                  style: const TextStyle(fontSize: 17),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      const Text(
                                        '1h ago',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const Icon(
                                        Icons.public,
                                        color: Colors.grey,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.more_horiz,
                                size: 25,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              users[index].ucap.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(55, 255, 255, 255)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 380,
                          decoration: BoxDecoration(
                            image: users[index].uemail.toString() ==
                                    'Thorng@gmail.com'
                                ? DecorationImage(
                                    image: NetworkImage(
                                        'https://metvcdn.metv.com/ePoCZ-1581617695-14368-list_items-tomjerry_jasperjinx.jpg'),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: FileImage(
                                        File(users[index].uimg.toString())),
                                    fit: BoxFit.cover),
                            color: const Color.fromARGB(255, 176, 179, 181),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                          ),
                          Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('1.5K'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    color: Colors.grey,
                                  ),
                                  Text(' Like')
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.comment,
                                    color: Colors.grey,
                                  ),
                                  Text(' Comment')
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.share,
                                    color: Colors.grey,
                                  ),
                                  Text(' Share')
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
    );
  }
}

// Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 600,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             width: 60,
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 color: Colors.amber, shape: BoxShape.circle),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Names',
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 5),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       '1h ago',
//                                       style: TextStyle(color: Colors.grey),
//                                     ),
//                                     Icon(
//                                       Icons.public,
//                                       color: Colors.grey,
//                                       size: 15,
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 120),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(
//                               Icons.more_horiz,
//                               size: 30,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.close,
//                             size: 30,
//                           ),
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: double.infinity,
//                         height: 65,
//                         decoration: BoxDecoration(color: Colors.red),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: double.infinity,
//                         height: 380,
//                         decoration: BoxDecoration(color: Colors.blue),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),