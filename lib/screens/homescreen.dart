import 'package:flutter/material.dart';
import 'package:zoom_clone_101/screens/history_meeting.dart';
import 'package:zoom_clone_101/screens/meeting_screen.dart';
import 'package:zoom_clone_101/screens/more_screen.dart';
import 'package:zoom_clone_101/utils/colors.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeeting(),

    const Text("state"),
    MoreScreen()
    // CustomButton(text: "Log Out", onPressed: ()=> AuthMethods().signOut)
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: pages[3],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & char',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
