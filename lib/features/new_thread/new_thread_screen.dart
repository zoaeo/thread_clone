import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/home/widgets/post_widget.dart';
import 'package:tiktok_clone/features/new_thread/camera_record_screen.dart';
import 'package:tiktok_clone/utils.dart';

class NewThreadScreen extends StatefulWidget {
  const NewThreadScreen({super.key});

  @override
  State<NewThreadScreen> createState() => _NewThreadScreenState();
}

class _NewThreadScreenState extends State<NewThreadScreen> {
  final TextEditingController _articleController = TextEditingController();

  String? imagePath = null;
  String _article = "";

  @override
  void initState() {
    super.initState();
    _articleController.addListener(() {
      setState(() {
        _article = _articleController.text;
      });
    });
  }

  @override
  void dispose() {
    _articleController.dispose();
    super.dispose();
  }

  bool _isValid() {
    if (_article.isEmpty) return false;
    return true;
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
  }

  void _onStartWriting() {}

  String profileUrl =
      "https://placedog.net/${random.integer(500, min: 100)}/${random.integer(500, min: 100)}";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor:
            isDarkMode(context) ? Colors.black : Colors.grey.shade50,
        appBar: AppBar(
          title: const Text("New thread"),
          backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              Container(
                height: 1.0,
                color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: PostLefSide(
                              profileUrl: profileUrl,
                              showThread: true,
                            ),
                          ),
                          CircleAvatar(
                            radius: Sizes.size8,
                            backgroundImage: NetworkImage(profileUrl),
                            backgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Gaps.h10,
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AuthorText(author: "jane_mobbin"),
                          Gaps.v8,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Sizes.size44,
                                  child: TextField(
                                    controller: _articleController,
                                    onTap: _onStartWriting,
                                    expands: true,
                                    minLines: null,
                                    maxLines: null,
                                    textInputAction: TextInputAction.newline,
                                    cursorColor: Theme.of(context).primaryColor,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: const InputDecoration(
                                      hintText: "Start a thread...",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: Sizes.size1,
                                        vertical: Sizes.size1,
                                      ),
                                    ),
                                  ),
                                ),
                                Gaps.v12,
                                if (imagePath != null)
                                  Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(Sizes.size12)),
                                      ),
                                      child: Image.file(File(imagePath!)))
                                else
                                  GestureDetector(
                                    onTap: _onClipTap,
                                    child: const FaIcon(
                                      FontAwesomeIcons.paperclip,
                                      color: Colors.grey,
                                      size: Sizes.size16,
                                    ),
                                  ),
                                Gaps.v12,
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  color: isDarkMode(context) ? Colors.black : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size10,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Anyone can reply",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Gaps.h10,
                        GestureDetector(
                          child: Text(
                            "Post",
                            style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w700,
                                color: _isValid()
                                    ? Colors.blue
                                    : Colors.blue.shade200),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClipTap() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
        fullscreenDialog: true,
      ),
    );

    setState(() {
      imagePath = result as String?;
    });
  }
}
