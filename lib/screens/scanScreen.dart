import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite/tflite.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {


  dynamic cameras;
  dynamic backCam;

  CameraController _controller;
  Future<void> _initializeControllerFuture;


  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
//    permissionCheck();
    openCam();
  }

  void permissionCheck() async{
    var cameraPermission=Permission.camera;
    if(await cameraPermission.status.isUndetermined || await Permission.camera.status.isDenied){
      Map<Permission, PermissionStatus> statuses = await [
        cameraPermission,
      ].request();
      print(statuses[cameraPermission]);
    }

    if (await Permission.camera.isPermanentlyDenied) {
      alertDialog();
//      openAppSettings();
      print(Permission.camera);
    }

    if(await Permission.camera.status.isGranted){
      openCam();
    }
  }


  void openCam() async{
    cameras =await availableCameras();
    backCam=cameras.first;
    print(backCam);


    setState(() {
      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        backCam,
        // Define the resolution to use.
        ResolutionPreset.high,
      );

      // Next, initialize the controller. This returns a Future.
      _initializeControllerFuture = _controller.initialize();
    });


  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    imageCache.clear();
    super.dispose();
  }


  Future classifyImage(var path) async {
    await Tflite.loadModel(model: "assets/model_unquant.tflite",labels: "assets/labels.txt");
    var output = await Tflite.runModelOnImage(path: path);
    print(output.toString());
    resultDialog(output.toString());
  }


  Future<void> alertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('We need to provide Camera Permission'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> resultDialog(var result) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(result),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void captureImage() async{
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Construct the path where the image should be saved using the
      // pattern package.
      final path = Path.join(
        // Store the picture in the temp directory.
        // Find the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.jpg',
      );

      // Attempt to take a picture and log where it's been saved.
      await _controller.takePicture(path);
      print(path);
      classifyImage(path);

    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  Future galleryPick() async{
    final image = await picker.getImage(source: ImageSource.gallery);
    print(image.path);
    classifyImage(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            color: Colors.grey,
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              backgroundColor: Colors.tealAccent[700],
              radius: 30,
              child: IconButton(
                icon: Icon(Icons.camera),
                color: Colors.white,
                iconSize: 40,
                onPressed: () {
                  print("Capture");
                  captureImage();


                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: IconButton(
                icon: Icon(Icons.file_upload),
                color: Colors.tealAccent[700],
                iconSize: 40,
                onPressed:() {
                  print("Gallery");
                  galleryPick();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
