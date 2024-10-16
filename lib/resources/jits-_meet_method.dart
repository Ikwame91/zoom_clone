// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone_101/authentication/auth_method.dart';

class JitsiMeetMethod{
  void createNewMeeting() async{
    final AuthMethods _authmethods = AuthMethods();
  
    var options = JitsiMeetConferenceOptions(
    serverURL: "https://meet.jit.si",
    room: "flutterZoomClone",
    configOverrides: {
      "startWithAudioMuted": true,
      "startWithVideoMuted": true,
      "subject" : "Zoom Clone Meeting",
    },
    featureFlags: {
      "unsaferoomwarning.enabled": false
    },
    userInfo: JitsiMeetUserInfo(
        displayName:_authmethods.currentUser.displayName,
        email: _authmethods.currentUser.email,
        avatar: _authmethods.currentUser.photoURL,
    ),
);

JitsiMeet().join(options, JitsiMeetEventListener(
  conferenceJoined: (url) => debugPrint("Joined conference: $url"),
  conferenceTerminated: (url, error) => debugPrint("Conference ended: $url"),
  conferenceWillJoin: (url) => debugPrint("Joining conference: $url"),
));
  }}