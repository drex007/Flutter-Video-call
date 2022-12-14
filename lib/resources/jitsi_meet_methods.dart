import 'package:flutter/material.dart';
import 'package:flutter_video_call/resources/auth_method.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = "",
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
      // Limit video resolution to 360p
      String name;
      if (!username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      // ..audioOnly = true
      // ..room = "myroom" // Required, spaces will be trimmed
      // ..serverURL = "https://someHost.com"
      // ..subject = "Meeting with Gunschu"
      // ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
