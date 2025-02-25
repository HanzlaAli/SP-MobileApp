// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_engine.dart';
// //import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import '../../../Data/Models/AppointmentRoomModel/AppointmentRoomResponse.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// class VideoCallScreen extends StatefulWidget {
//   static const routeName = '/video-call';
//   AppoinmentRoomResponseModel? model;
//   VideoCallScreen({super.key, this.model});

//   @override
//   State<VideoCallScreen> createState() => _VideoCallScreenState();
// }

// class _VideoCallScreenState extends State<VideoCallScreen> {
//   final _users = <int>[];
//   String appId = "8052ee99c8e042e6ba0be026509fa2f2";
//   final _infoStrings = <String>[];
//   bool muted = false;
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   late RtcEngine _engine;
//   @override
//   void dispose() {
//     // clear users
//     _users.clear();
//     // destroy sdk
//     _engine.leaveChannel();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // initAgora();
//     // initialize agora sdk
//     initialize();
//   }

//   Future<void> handelPermission() async {
//     await _handleCameraAndMic(Permission.camera);
//     await _handleCameraAndMic(Permission.microphone);
//   }

//   Future<void> _handleCameraAndMic(Permission permission) async {
//     await permission.request();
//   }

//   Future<void> initialize() async {
//     if (appId.isEmpty) {
//       setState(() {
//         _infoStrings.add(
//           'APP_ID missing, please provide your APP_ID in settings.dart',
//         );
//         _infoStrings.add('Agora Engine is not starting');
//       });
//       return;
//     }

//     await _initAgoraRtcEngine();
//     _addAgoraEventHandlers();
//     VideoEncoderConfiguration configuration = VideoEncoderConfiguration(
//       dimensions: const VideoDimensions(width: 1280, height: 720),
//       frameRate: VideoFrameRate.Fps30,
//       bitrate: 20,
//     );
//     configuration.dimensions = const VideoDimensions(width: 1920, height: 1080);
//     await _engine.setVideoEncoderConfiguration(configuration);
// // Adjust the bitrate based on network conditions
//     _engine.setParameters(
//         '{"che.video.lowBitRateStreamParameter": {"width":320,"height":180,"frameRate":15,"bitRate":140,"minBitRate":80,"maxBitRate":220}}');

//     // String? token = widget.token!.contains('+')
//     //     ? widget.token!.replaceAll('+', '')
//     //     : widget.token;
//     await _engine.enableVideo();
//     await _engine.joinChannel(
//         widget.model!.rtcToken,
//         widget.model!.roomName!,
//         null,
//         widget.model!.appointmentId!,
//         ChannelMediaOptions(autoSubscribeVideo: true, publishLocalVideo: true));
//     // await _engine.joinChannel(
//     //     '007eJxTYOATWL13UeP9ObN73kftnHvnrPC06o2ygVxOe8081uz+tXSCAkOakYF5mkVKcpKxpblJSrKpRaKRhaFxmrGpuWFaimlSopR/cnJDICPDSYvPDIxQCOJzMuRWOmck5uWl5jAwAABh4iKf',
//     //     'myChannel',
//     //     null,
//     //     0);
//   }

//   /// Create agora sdk instance and initialize
//   Future<void> _initAgoraRtcEngine() async {
//     _engine = await RtcEngine.create(appId);
//     await _engine.enableVideo();
//     await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
//     await _engine.setClientRole(ClientRole.Broadcaster);
//     await _engine.setDefaultAudioRouteToSpeakerphone(true);
//   }

//   /// Add agora event handlers
//   void _addAgoraEventHandlers() {
//     _engine.setEventHandler(
//       RtcEngineEventHandler(
//         error: (code) {
//           setState(
//             () {
//               // final info = 'onError: $code';
//               // _infoStrings.add(info);
//             },
//           );
//         },
//         joinChannelSuccess: (channel, uid, elapsed) {
//           setState(() {
//             // final info = 'onJoinChannel: $channel';
//             // _infoStrings.add(info);
//           });
//         },
//         leaveChannel: (stats) {
//           setState(
//             () {
//               //    _infoStrings.add('onLeaveChannel');
//               _users.clear();
//             },
//           );
//         },
//         userJoined: (uid, elapsed) {
//           setState(
//             () {
//               // final info = 'userJoined: $uid';
//               // _infoStrings.add(info);
//               _users.add(uid);
//             },
//           );
//         },
//         userOffline: (uid, elapsed) {
//           setState(
//             () {
//               // final info = 'userOffline: $uid';
//               // _infoStrings.add(info);
//               _users.remove(uid);
//             },
//           );
//         },
//         firstRemoteVideoFrame: (uid, width, height, elapsed) {
//           setState(
//             () {
//               // final info = 'firstRemoteVideo: $uid ${width}x $height';
//               // _infoStrings.add(info);
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// Helper function to get list of native views
//   List<Widget> _getRenderViews() {
//     var role = ClientRole.Broadcaster;
//     final List<StatefulWidget> list = [];
//     if (role == ClientRole.Broadcaster) {
//       list.add(const RtcLocalView.SurfaceView());
//     }
//     for (var uid in _users) {
//       list.add(RtcRemoteView.SurfaceView(
//           channelId: widget.model!.roomName!, uid: uid));
//     }
//     return list;
//   }

//   // Future<void> initAgora() async {
//   //   // retrieve permissions
//   //   await [Permission.microphone, Permission.camera].request();

//   //   //create the engine
//   //   _engine = createAgoraRtcEngine();
//   //   await _engine.initialize(RtcEngineContext(
//   //     appId: appId,
//   //     channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//   //   ));

//   //   _engine.registerEventHandler(
//   //     RtcEngineEventHandler(
//   //       onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//   //         debugPrint("local user ${connection.localUid} joined");
//   //         setState(() {
//   //           _localUserJoined = true;
//   //         });
//   //       },
//   //       onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//   //         debugPrint("remote user $remoteUid joined");
//   //         setState(() {
//   //           _remoteUid = remoteUid;
//   //         });
//   //       },
//   //       onUserOffline: (RtcConnection connection, int remoteUid,
//   //           UserOfflineReasonType reason) {
//   //         debugPrint("remote user $remoteUid left channel");
//   //         setState(() {
//   //           _remoteUid = null;
//   //         });
//   //       },
//   //       onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//   //         debugPrint(
//   //             '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//   //       },
//   //     ),
//   //   );

//   //   await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//   //   await _engine.enableVideo();
//   //   await _engine.startPreview();

//   //   await _engine.joinChannel(
//   //     token: widget.model!.rtcToken!,
//   //     channelId: widget.model!.roomName!,
//   //     uid: 0,
//   //     options: const ChannelMediaOptions(),
//   //   );
//   // }

//   Widget _videoView(view) {
//     return Expanded(child: Container(child: view));
//   }

//   Widget _expandedVideoRow(List<Widget> views) {
//     final wrappedViews = views.map<Widget>(_videoView).toList();
//     return Expanded(
//       child: Row(
//         children: wrappedViews,
//       ),
//     );
//   }

//   Widget _viewRows() {
//     final views = _getRenderViews();
//     switch (views.length) {
//       case 1:
//         return Container(
//             child: Column(
//           children: <Widget>[_videoView(views[0])],
//         ));
//       case 2:
//         return Container(
//             child: Column(
//           children: <Widget>[
//             _expandedVideoRow([views[0]]),
//             _expandedVideoRow([views[1]])
//           ],
//         ));
//       case 3:
//         return Container(
//             child: Column(
//           children: <Widget>[
//             _expandedVideoRow(views.sublist(0, 2)),
//             _expandedVideoRow(views.sublist(2, 3))
//           ],
//         ));
//       case 4:
//         return Container(
//             child: Column(
//           children: <Widget>[
//             _expandedVideoRow(views.sublist(0, 2)),
//             _expandedVideoRow(views.sublist(2, 4))
//           ],
//         ));
//       default:
//     }
//     return Container();
//   }

//   void _onToggleMute() {
//     setState(() {
//       muted = !muted;
//     });
//     _engine.muteLocalAudioStream(muted);
//   }

//   Widget _toolbar() {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       padding: const EdgeInsets.symmetric(vertical: 48),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           RawMaterialButton(
//             onPressed: _onToggleMute,
//             child: Icon(
//               muted ? Icons.mic_off : Icons.mic,
//               color: muted ? Colors.white : Colors.blueAccent,
//               size: 20.0,
//             ),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: muted ? Colors.blueAccent : Colors.white,
//             padding: const EdgeInsets.all(12.0),
//           ),
//           RawMaterialButton(
//             onPressed: () => _onCallEnd(context),
//             child: Icon(
//               Icons.call_end,
//               color: Colors.white,
//               size: 35.0,
//             ),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: Colors.redAccent,
//             padding: const EdgeInsets.all(15.0),
//           ),
//           RawMaterialButton(
//             onPressed: _onSwitchCamera,
//             child: Icon(
//               Icons.switch_camera,
//               color: Colors.blueAccent,
//               size: 20.0,
//             ),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: Colors.white,
//             padding: const EdgeInsets.all(12.0),
//           )
//         ],
//       ),
//     );
//   }

//   void _onSwitchCamera() {
//     _engine.switchCamera();
//   }

//   void _onCallEnd(BuildContext context) {
//     Navigator.pop(context);
//   }

//   Widget _panel() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 48),
//       alignment: Alignment.bottomCenter,
//       child: FractionallySizedBox(
//         heightFactor: 0.5,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 48),
//           child: ListView.builder(
//             reverse: true,
//             itemCount: _infoStrings.length,
//             itemBuilder: (BuildContext context, int index) {
//               if (_infoStrings.isEmpty) {
//                 return Text(
//                     "null"); // return type can't be null, a widget was required
//               }
//               return Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 3,
//                   horizontal: 10,
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Flexible(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 2,
//                           horizontal: 5,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.yellowAccent,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(
//                           _infoStrings[index],
//                           style: TextStyle(color: Colors.blueGrey),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Stack(
//           children: <Widget>[
//             _viewRows(),
//             //_remoteVideo(),
//             _panel(),
//             // Align(
//             //   alignment: Alignment.topLeft,
//             //   child: SizedBox(
//             //     width: 100,
//             //     height: 150,
//             //     child: Center(
//             //       child: _localUserJoined
//             //           ? AgoraVideoView(
//             //               controller: VideoViewController(
//             //                 rtcEngine: _engine,
//             //                 canvas: const VideoCanvas(uid: 0),
//             //               ),
//             //             )
//             //           : const CircularProgressIndicator(),
//             //     ),
//             //   ),
//             // ),

//             _toolbar(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _remoteVideo() {
//   //   if (_remoteUid != null) {
//   //     return AgoraVideoView(
//   //       controller: VideoViewController.remote(
//   //         rtcEngine: _engine,
//   //         canvas: VideoCanvas(uid: _remoteUid),
//   //         connection: RtcConnection(channelId: widget.model!.roomName!),
//   //       ),
//   //     );
//   //   } else {
//   //     return const Text(
//   //       'Please wait for remote user to join',
//   //       textAlign: TextAlign.center,
//   //     );
//   //   }
//   // }
// }
