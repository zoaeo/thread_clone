import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;

  bool _isSelfieMode = false;

  late FlashMode _flashMode;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initPermissions();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera();
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    await _cameraController.initialize();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _takePicture() async {
    final image = await _cameraController.takePicture();

    if (!mounted) return;

    Navigator.pop(context, image.path);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ImagePreviewScreen(
    //       imagePath: image.path,
    //       isPicked: false,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPickImagePressed() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;

    if (!mounted) return;

    Navigator.pop(context, image.path);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ImagePreviewScreen(
    //       imagePath: image.path,
    //       isPicked: true,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: !_hasPermission || !_cameraController.value.isInitialized
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator.adaptive()],
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CameraPreview(_cameraController),
                      Positioned(
                        top: Sizes.size40,
                        left: Sizes.size20,
                        child: Column(
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: _onBackTap,
                              icon: const Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                            Gaps.v10,
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: Sizes.size40,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () => _setFlashMode(
                                    _flashMode == FlashMode.off
                                        ? FlashMode.always
                                        : _flashMode == FlashMode.always
                                            ? FlashMode.auto
                                            : FlashMode.off,
                                  ),
                                  icon: Icon(
                                    _flashMode == FlashMode.off
                                        ? Icons.flash_off_rounded
                                        : _flashMode == FlashMode.always
                                            ? Icons.flash_on_rounded
                                            : Icons.flash_auto_rounded,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTapUp: (details) => _takePicture(),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: Sizes.size80,
                                    height: Sizes.size80,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: _toggleSelfieMode,
                                  icon: const Icon(
                                    Icons.repeat,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                Sizes.size16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Expanded(
                    child: Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: _onPickImagePressed,
                      child: const Text(
                        "Library",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onBackTap() {
    Navigator.of(context).pop();
  }
}
