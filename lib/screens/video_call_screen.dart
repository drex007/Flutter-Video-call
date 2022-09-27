import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_video_call/resources/auth_method.dart';
import 'package:flutter_video_call/resources/jitsi_meet_methods.dart';
import 'package:flutter_video_call/screens/meeting_option.dart';
import 'package:flutter_video_call/utils/colors.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeting() {
    _jitsiMeetMethods.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          "Join a meeting ",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room ID"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Name"),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => _joinMeting(),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Join",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MeetingOption(
            text: "Mute audio",
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: "Turn off video",
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          )
        ],
      ),
    );
  }

  onAudioMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onVideoMuted(bool? val) {
    setState(() {
      isVideoMuted = val!;
    });
  }
}
