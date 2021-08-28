import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../widgets/widgets.dart';

class ConnectWithStudents extends StatefulWidget {
  const ConnectWithStudents({Key key}) : super(key: key);

  @override
  _ConnectWithStudentsState createState() => _ConnectWithStudentsState();
}

class _ConnectWithStudentsState extends State<ConnectWithStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            leading: Container(),
            pinned: true,
            backgroundColor: Colors.blue,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Positioned(
                            right: 25,
                            bottom: 40,
                            child: Image.asset(
                              'assets/images/help.png',
                              height: 220,
                            ),
                          ),
                          Container(
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            child: SafeArea(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [],
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.red,
                                            blurRadius: 15.0,
                                          ),
                                        ],
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "Help",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "QuickSand",
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 7),
                                      child: Text(
                                        "\n\nTapping on help will send your location to every nearby police officer",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "QuickSand",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            expandedHeight: 350,
          ),
          SliverFillRemaining(
            child: Container(
              margin: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    "Your past help requests",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "QuickSand",
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset('assets/images/notFound.png',
                                height: 250),
                            SizedBox(height: 20),
                            Text(
                              "No notes found",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "QuickSand",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
