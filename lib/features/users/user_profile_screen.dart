import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/home/widgets/post_widget.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistents_tab_bar.dart';
import 'package:tiktok_clone/utils.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

const myProfileURL = "https://avatars.githubusercontent.com/u/12131172?v=4";

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<Post> threads = [
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
  ];
  List<Post> replies = [
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
    Post.myPost(author: "zoaeo", profileUrl: myProfileURL),
  ];

  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor:
                    isDarkMode(context) ? Colors.black : Colors.white,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.globe,
                      size: Sizes.size24,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: Sizes.size28,
                    ),
                  ),
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.barsStaggered,
                      size: Sizes.size20,
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "조아",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size24,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "zoaeo",
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                  Gaps.h4,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: Sizes.size6,
                                      horizontal: Sizes.size8,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(Sizes.size16))),
                                    child: Text(
                                      "theads.net",
                                      style: TextStyle(
                                        fontSize: Sizes.size12,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 30,
                            foregroundImage: NetworkImage(myProfileURL),
                          ),
                        ],
                      ),
                      Gaps.v16,
                      const Text(
                        "헬로 에블바디",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.v16,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            foregroundImage: NetworkImage(
                                "https://placedog.net/${random.integer(300, min: 200)}/${random.integer(300, min: 200)}"),
                          ),
                          Gaps.h8,
                          const Text(
                            "1 follows",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v16,
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(Sizes.size8),
                                ),
                              ),
                              child: const Text(
                                'Edit profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Gaps.h12,
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(Sizes.size8),
                                ),
                              ),
                              child: const Text(
                                'Share profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView(
                children: [
                  for (var post in replies)
                    PostWidget(
                      post: post,
                    ),
                ],
              ),
              ListView(
                children: [
                  for (var post in threads)
                    PostWidget(
                      post: post,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
