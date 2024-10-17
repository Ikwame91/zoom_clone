import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_clone_101/resources/jits-_meet_method.dart';
import 'package:zoom_clone_101/utils/colors.dart';
import 'package:zoom_clone_101/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();
  createNewMeeting() async {
    var random = Random();
    String roomName =
        "Meeting-${random.nextInt(10000000) + 10000000}".toString();
    _jitsiMeetMethod.createMeeting(roomName: roomName);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Meet & Chat',
            style:
                GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.bold)),
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
                    onpressed: () {
                      createNewMeeting();
                    },
                    icon: Icons.videocam,
                    text: "New Meetings"),
                HomeMeetingButton(
                    onpressed: () => joinMeeting(context),
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
          Expanded(
              child: Center(
                  child: Text(
            'Create/Join Meeting with just a click',
            style: GoogleFonts.poppins(fontSize: 19),
          ))),
        ],
      ),
    );
  }
}
