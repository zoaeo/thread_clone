import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/home/widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gaps.v80,
            const FaIcon(
              FontAwesomeIcons.at,
              size: Sizes.size40,
            ),
            Gaps.v40,
            for (var post in posts)
              PostWidget(
                post: post,
              ),
          ],
        ),
      ),
    );
  }
}
