import 'package:educately/screens/home/widgets/allTeachersSection.dart';
import 'package:educately/screens/home/widgets/notesSection.dart';
import 'package:educately/screens/home/widgets/randomFactCard.dart';
import 'package:educately/screens/home/widgets/tutorButton.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'upcomingClasses.dart';

import 'connectStudents.dart';
import '../widgets/sidebaritems.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'userProfile.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// QrService _qrService = locator<QrService>();

final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  void changeIndex({@required int index}) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    String formatter = DateFormat.yMMMMd('en_US').format(now);

    Size size = MediaQuery.of(context).size;
    return SideMenu(
      closeIcon: Icon(LineAwesomeIcons.times, color: Colors.black, size: 35),
      key: _endSideMenuKey,
      background: Color(0xFFedeeef),
      type: SideMenuType.slide,
      menu: buildMenu(
        context,
        _endSideMenuKey,
      ),
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Color(0xFFFFFFFF),
          child: DotNavigationBar(
            // itemPadding: EdgeInsets.all(5),
            currentIndex: currentIndex,
            onTap: (index) {
              changeIndex(index: index);

              pageController.jumpToPage(index);
            },
            dotIndicatorColor: Colors.orange,
            items: [
              DotNavigationBarItem(
                icon: Icon(
                  LineAwesomeIcons.home,
                ),
                selectedColor: Colors.orange,
              ),

              /// Likes
              DotNavigationBarItem(
                icon: Icon(LineAwesomeIcons.newspaper),
                selectedColor: Colors.orange,
              ),

              /// Search
              DotNavigationBarItem(
                icon: Icon((LineAwesomeIcons.list)),
                selectedColor: Colors.orange,
              ),

              /// Profile
              DotNavigationBarItem(
                icon: Icon(LineAwesomeIcons.user_astronaut),
                selectedColor: Colors.orange,
              ),
            ],
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(right: 15.0, top: 25),
                                child: GestureDetector(
                                  onTap: () {
                                    final _state = _endSideMenuKey.currentState;

                                    if (_state.isOpened)
                                      _state.closeSideMenu();
                                    else
                                      _state.openSideMenu();
                                  },
                                  child: Icon(LineAwesomeIcons.bars,
                                      color: Colors.black, size: 40),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15.0, top: 25),
                              child: Text(
                                "${DateFormat('EEEE').format(DateTime.now())}, $formatter",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "QuickSand",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height / 9),
                        NotesSection(),
                        TutorNearbyCard(),
                        SizedBox(height: 50),
                        AllTeachersSection(),
                        SizedBox(height: 50),
                        RandomFactCard()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            UpcomingClasses(),
            ConnectWithStudents(),
            UserProfileView()
          ],
        ),
      ),
    );
  }
}
