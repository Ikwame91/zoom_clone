import 'package:flutter/material.dart';
import 'package:zoom_clone_101/utils/colors.dart';
import 'package:zoom_clone_101/widgets/home_meeting_button.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;
  onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & Chat',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(
                    onpressed: () {},
                    icon: Icons.videocam,
                    text: "New Meeting"),
                HomeMeetingButton(
                    onpressed: () {},
                    icon: Icons.add_box_rounded,
                    text: "Join "),
                HomeMeetingButton(
                    onpressed: () {},
                    icon: Icons.calendar_today,
                    text: "Schedule "),
                HomeMeetingButton(
                    onpressed: () {},
                    icon: Icons.arrow_upward_rounded,
                    text: "Share Screen"),
              ],
            ),
          ),
          const Expanded(
              child: Center(
                  child: Text(
            'Create/Join Meeting with just a click',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ))), // Add this line
        ],
      ),
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
}
