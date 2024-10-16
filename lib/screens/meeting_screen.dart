import 'package:flutter/material.dart';
import 'package:zoom_clone_101/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                  onpressed: () {}, icon: Icons.videocam, text: "New Meeting"),
              HomeMeetingButton(
                  onpressed: () {}, icon: Icons.add_box_rounded, text: "Join "),
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
    );
  }
}
