import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_video_call/home_meeting_button.dart';
import 'package:flutter_video_call/resources/jitsi_meet_methods.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          HomeMeetingButton(
              onPressed: createNewMeeting,
              text: "New Meeting",
              icon: Icons.videocam),
          HomeMeetingButton(
              onPressed: () => {},
              text: "Join Meeting",
              icon: Icons.add_box_rounded),
          HomeMeetingButton(
              onPressed: () => {},
              text: "Schedule ",
              icon: Icons.calendar_today),
          HomeMeetingButton(
              onPressed: () => {},
              text: "Share Screen ",
              icon: Icons.arrow_upward_rounded)
        ]),
        Expanded(
          child: Center(
            child: Text(
              "Create or join meeting with just a click",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
