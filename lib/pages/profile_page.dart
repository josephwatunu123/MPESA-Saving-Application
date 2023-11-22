import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_app/authentication/authentication.dart';

class profilePage extends StatelessWidget {
  final String? userId;

  profilePage({Key? key, required this.userId}) : super(key: key);

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getUserData() async {
    DocumentSnapshot userDoc = await db.collection('test').doc(userId).get();
    return userDoc.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: FutureBuilder<Map<String, dynamic>>(
                future: getUserData(),
                builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return Text("User data not found");
                  }
                  Map<String, dynamic> userData = snapshot.data!;
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 290.0,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/images/profilepage.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "${userData['firstname'] ?? 'ERR'} ${userData['lastname'] ?? 'ERR'}",
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${userData['phone'] ?? 'ERR'} ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Additional widgets below the image container
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Saving History',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,

                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.access_time),
                                  onPressed: (){},
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 1),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Get Help',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,

                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.phone_callback_outlined),
                                  onPressed: (){},
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Logout',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,

                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.logout),
                                  onPressed: (){
                                    AuthenticationRepository.instance.logout();
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Additional Information",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      // Add more widgets as needed
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
