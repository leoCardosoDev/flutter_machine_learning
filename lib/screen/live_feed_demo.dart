import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(LiveFeedDemo());
}

class LiveFeedDemo extends StatefulWidget {
  @override
  _LiveFeedDemoState createState() => _LiveFeedDemoState();
}

class _LiveFeedDemoState extends State<LiveFeedDemo> {
  CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) return;

      _controller.startImageStream((image) => {
            //
          });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return Scaffold(
        body: Flexible(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CameraPreview(_controller),
          ),
        ),
      );
    } else {
      return Scaffold();
    }
  }
}
