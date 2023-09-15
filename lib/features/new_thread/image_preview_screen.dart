import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String imagePath;
  final bool isPicked;

  const ImagePreviewScreen({
    super.key,
    required this.imagePath,
    required this.isPicked,
  });

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  Future<void> _initVideo() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideo();

    _saveToGallery();
  }

  Future<void> _saveToGallery() async {
    await GallerySaver.saveImage(
      widget.imagePath,
      albumName: "Thread Clone",
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Image.file(File(widget.imagePath)),
    );
  }
}
