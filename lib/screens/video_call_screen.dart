import 'package:flutter/material.dart';
import 'package:zoom_clone_101/authentication/auth_method.dart';
import 'package:zoom_clone_101/utils/colors.dart';
import 'package:zoom_clone_101/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController =
        TextEditingController(text: _authMethods.currentUser.displayName);
    super.initState();
  }

  _joinMeeting() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 65,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Meeting ID',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 65,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Name ',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Join Meeting',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: "Don\'t join meeting",
            isMute: isAudioMuted,
            onChanged: (p0) {},
          )
        ],
      ),
    );
  }
}