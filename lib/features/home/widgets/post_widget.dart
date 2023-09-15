import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/home/more_sheet.dart';

class Post {
  String author = faker.person.firstName();
  String profileUrl =
      "https://placedog.net/${random.integer(500, min: 100)}/${random.integer(500, min: 100)}";
  bool showBadge = random.boolean();
  String article = faker.lorem.sentence();
  String createDate =
      "${random.integer(10) + 1}${random.boolean() ? "m" : "h"}";

  bool showPhoto = random.boolean();
  List<String> articleFiles = [
    "https://placedog.net/${random.integer(300, min: 200)}/${random.integer(300, min: 200)}",
    "https://placedog.net/${random.integer(300, min: 200)}/${random.integer(300, min: 200)}",
    "https://placedog.net/${random.integer(300, min: 200)}/${random.integer(300, min: 200)}",
  ];

  List<String> replyProfile = [
    "https://placedog.net/${random.integer(200, min: 200)}/${random.integer(200, min: 200)}",
    "https://placedog.net/${random.integer(200, min: 200)}/${random.integer(200, min: 200)}",
    "https://placedog.net/${random.integer(200, min: 200)}/${random.integer(200, min: 200)}",
  ];
  bool showThread = random.boolean();

  int replies = random.integer(100);
  int likes = random.integer(1000);

  Post();
  Post.myPost({required this.author, required this.profileUrl});
}

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final GlobalKey _parentKey = GlobalKey();
  final GlobalKey _photoKey = GlobalKey();
  Offset? parentOffset;
  Offset? photoOffset;

  double photoPosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        parentOffset = _getOffset(_parentKey);
        photoOffset = _getOffset(_photoKey);
        double y1 = parentOffset == null ? 0.0 : parentOffset!.dy;
        double y2 = photoOffset == null ? 0.0 : photoOffset!.dy;
        photoPosition = y2 - y1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMoreTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const MoreSheet(),
    );
  }

  Offset? _getOffset(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Offset offset = renderBox.localToGlobal(Offset.zero);
      return offset;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            key: _parentKey,
            children: [
              const Divider(),
              Gaps.v10,
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gaps.h12,
                    Expanded(
                      child: PostLefSide(
                        profileUrl: widget.post.profileUrl,
                        showThread: widget.post.showThread,
                      ),
                    ),
                    Gaps.h10,
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AuthorText(author: widget.post.author),
                              Gaps.h4,
                              if (widget.post.showBadge)
                                const Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.certificate,
                                      color: Colors.blue,
                                      size: Sizes.size12,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.check,
                                      color: Colors.white,
                                      size: Sizes.size8,
                                    ),
                                  ],
                                ),
                              const Spacer(),
                              Text(
                                widget.post.createDate,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Gaps.h16,
                              GestureDetector(
                                  onTap: () => _onMoreTap(context),
                                  child:
                                      const FaIcon(FontAwesomeIcons.ellipsis)),
                              Gaps.h24,
                            ],
                          ),
                          Gaps.v4,
                          Row(
                            children: [
                              Expanded(child: Text(widget.post.article)),
                              Gaps.h24,
                            ],
                          ),
                          Gaps.v10,
                          if (widget.post.showPhoto)
                            Container(
                              key: _photoKey,
                              height:
                                  MediaQuery.of(context).size.width - 120 + 16,
                            ),
                          Gaps.v4,
                          const Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size20,
                              ),
                              Gaps.h16,
                              FaIcon(
                                FontAwesomeIcons.comment,
                                size: Sizes.size20,
                              ),
                              Gaps.h16,
                              FaIcon(
                                FontAwesomeIcons.repeat,
                                size: Sizes.size20,
                              ),
                              Gaps.h16,
                              FaIcon(
                                FontAwesomeIcons.paperPlane,
                                size: Sizes.size20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.post.showThread)
                Row(
                  children: [
                    Gaps.h16,
                    userThumbs(thumbs: widget.post.replyProfile),
                    Gaps.h10,
                    Text(
                      "${widget.post.replies} replies",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Gaps.h8,
                    const Text(
                      "•",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Gaps.h8,
                    Text(
                      "${widget.post.likes} likes",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              Gaps.v10,
            ],
          ),
          if (widget.post.showPhoto)
            Positioned(
              top: photoPosition + 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Gaps.h72,
                          for (var file in widget.post.articleFiles)
                            Row(children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size14),
                                ),
                                child: Image.network(
                                  file,
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width - 120,
                                  height:
                                      MediaQuery.of(context).size.width - 120,
                                ),
                              ),
                              Gaps.h12,
                            ]),
                          Gaps.h12,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AuthorText extends StatelessWidget {
  const AuthorText({
    super.key,
    required this.author,
  });

  final String author;

  @override
  Widget build(BuildContext context) {
    return Text(
      author,
      style: const TextStyle(
        fontSize: Sizes.size14,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class PostLefSide extends StatelessWidget {
  const PostLefSide({
    super.key,
    required this.profileUrl,
    required this.showThread,
  });

  final String profileUrl;
  final bool showThread;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ProfileCircle(profileUrl: profileUrl),
            const CircleAvatar(
              radius: Sizes.size10,
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.circlePlus,
                color: Colors.black,
                size: Sizes.size16,
              ),
            ),
          ],
        ),
        Gaps.v8,
        if (showThread)
          const Expanded(
            child: VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
          ),
        Gaps.v8,
      ],
    );
  }
}

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    super.key,
    required this.profileUrl,
  });

  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
      child: CircleAvatar(
        radius: Sizes.size20,
        backgroundImage: NetworkImage(profileUrl),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

// ignore: camel_case_types
class userThumbs extends StatelessWidget {
  const userThumbs({
    super.key,
    required this.thumbs,
  });

  final List<String> thumbs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: Sizes.size36,
        height: Sizes.size36,
        child: Stack(
          children: [
            SizedBox(
              width: Sizes.size36,
              height: Sizes.size36,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: Sizes.size10,
                    backgroundImage: NetworkImage(thumbs[0]),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Sizes.size36,
              height: Sizes.size36,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  CircleAvatar(
                    radius: Sizes.size8,
                    backgroundImage: NetworkImage(thumbs[1]),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Sizes.size36,
              height: Sizes.size36,
              child: Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      radius: Sizes.size6,
                      backgroundImage: NetworkImage(thumbs[2]),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
