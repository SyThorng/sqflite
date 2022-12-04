import 'dart:io';

import 'package:fb_sqlit/database/dbHelper.dart';
import 'package:fb_sqlit/model/u_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class post extends StatefulWidget {
  post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  int select = 0;
  // List<Color> colr = [Colors.blue];
  File? fileImage;
  dynamic col = Colors.white;
  List<User> users = [];
  late Dbhelper db;
  late User user;

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
      // drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: select,
          onTap: (value) {
            setState(() {
              value = select;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.group,
                ),
                label: 'Friend'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin), label: 'menu'),
          ]),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message_sharp,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          )
        ],
        backgroundColor: Color.fromARGB(0, 238, 234, 234),
        elevation: 0,
        leadingWidth: 130,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'facebook',
            style: GoogleFonts.actor(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ),
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
                          height: 35,
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