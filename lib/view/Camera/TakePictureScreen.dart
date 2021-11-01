import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liveness_plugin/liveness_plugin.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:toko_netzme/repository/retrofit/advance/advance_client.dart';
import 'package:toko_netzme/view/Camera/PreviewImageScreen.dart';
import 'package:toko_netzme/view/Liveness/LivenessBloc.dart';

class CameraPage extends StatefulWidget {
  int totalPrice = 0;

  CameraPage(this.totalPrice);

  @override
  State<StatefulWidget> createState() {
    return _cameraPageState();
  }
}

class _cameraPageState extends State<CameraPage> {
  CameraController? controller;

  @override
  void initState() {
  }
  Future<void> initializeCamera() async {
    var cameras = await availableCameras();
    print(cameras);
    controller = CameraController(
      cameras[0],
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller?.initialize();
  }

  Future<File?> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/NetzPhotos';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      await controller?.takePicture();
    } catch (e) {
      return null;
    }
    return File(filePath);
  }

  Future<void> inizializza() async {
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
    // To display the current output from the Camera,
    // create a CameraController.
    controller = CameraController(
      // Get a specific camera from the list of available cameras.
      firstCamera,
      // Define the resolution to use.
      ResolutionPreset.veryHigh,
    );

    // Next, initialize the controller. This returns a Future.
    await controller?.initialize();
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller!.value.isInitialized) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      );
    }

    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!),
    );
  }

  /// Display the control bar with buttons to take pictures
  Widget _captureControlRowWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                child: Icon(Icons.camera),
                backgroundColor: Colors.blueGrey,
                onPressed: () {
                  _onCapturePressed(context);
                })
          ],
        ),
      ),
    );
  }

  void _onCapturePressed(context) async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Attempt to take a picture and log where it's been saved
      final path = join(
        // In this example, store the picture in the temp directory. Find
        // the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      print(path);
      XFile? picture = await controller?.takePicture();
      picture?.saveTo(path);
      Navigator.of(context).pushNamed(
        '/payment.camera.preview',
        arguments: {
          "price": widget.totalPrice,
          "imagePath": path
        },
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: inizializza(),
          builder: (_, snapshot) => Container(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: _cameraPreviewWidget(),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [_captureControlRowWidget(context)],
                  ),
                  SizedBox(height: 20.0)
                ],
              ),
            ),
          ),
        ));
  }
}
