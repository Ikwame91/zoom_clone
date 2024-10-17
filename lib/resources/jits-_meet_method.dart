// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone_101/authentication/auth_method.dart';
import 'package:zoom_clone_101/resources/firestore_methods.dart';

class JitsiMeetMethod {
  final AuthMethods _authmethods = AuthMethods();
  final FirestoreMethods firestoreMethods = FirestoreMethods();
  void createMeeting({
    required String roomName,
    String username = '',
  }) async {
    String name;
    if (username.isEmpty) {
      name = _authmethods.currentUser.displayName!;
    } else {
      name = username;
    }

    var options = JitsiMeetConferenceOptions(
      serverURL: "https://meet.jit.si",
      room: roomName,
      configOverrides: {
        "startWithAudioMuted": true,
        "startWithVideoMuted": true,
        "subject": roomName,
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false,
      },
      userInfo: JitsiMeetUserInfo(
        displayName: name,
        email: _authmethods.currentUser.email,
        avatar: _authmethods.currentUser.photoURL,
      ),
    );
    firestoreMethods.addToMeetingHistory(roomName);

    JitsiMeet().join(
      options,
      JitsiMeetEventListener(
        conferenceJoined: (url) {
          debugPrint("Joined conference: $url");
         
          _onMeetingStarted(); 
        },
        conferenceWillJoin: (url) {
          debugPrint("Attempting to join conference: $url");
  
          _onMeetingWillJoin(); 
        },
        conferenceTerminated: (url, error) {
          debugPrint("Conference ended: $url, Error: $error");
         
          _onMeetingEnded(); 
        },
      ),
    );
  }

  void _onMeetingWillJoin() {
    // Show some UI or message that indicates the user is waiting for the meeting to start
    debugPrint("Waiting for the moderator to start the meeting...");
    // Display a loading spinner or message
  }

  void _onMeetingStarted() {
    // Hide the loading UI
    debugPrint("Meeting has started");
    // Proceed with the meeting
  }

  void _onMeetingEnded() {
    // Clean up after meeting ends
    debugPrint("Meeting has ended");
    // Optionally, navigate back or show a message to the user
  }
}
