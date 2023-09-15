import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/home/widgets/post_widget.dart';
import 'package:tiktok_clone/utils.dart';

enum ActivityType {
  follows(
    "Follows",
    "Follows you",
    FontAwesomeIcons.person,
    Colors.purple,
  ),
  replies(
    "Replies",
    "Starting out my gradening club with thread",
    FontAwesomeIcons.reply,
    Colors.blue,
  ),
  mentions(
    "Mentions",
    "",
    FontAwesomeIcons.at,
    Colors.green,
  ),
  quetes(
    "Quetes",
    "",
    FontAwesomeIcons.heart,
    Colors.pink,
  ),
  reports(
    "Reports",
    "",
    FontAwesomeIcons.question,
    Colors.black,
  ),
  verified(
    "Verified",
    "You're now following",
    FontAwesomeIcons.question,
    Colors.black,
  );

  const ActivityType(this.type, this.description, this.icon, this.color);

  final String type;
  final String description;
  final IconData icon;
  final Color color;
}

final List<String> tabs = [
      "All",
    ] +
    ActivityType.values.map((e) => e.type).toList();

class AcrivityItem {
  String author = faker.person.firstName();
  ActivityType actType =
      ActivityType.values[random.integer(ActivityType.values.length)];
  String article = faker.lorem.sentence();
  String createDate =
      "${random.integer(10) + 1}${random.boolean() ? "m" : "h"}";

  String profileUrl =
      "https://placedog.net/${random.integer(500, min: 100)}/${random.integer(500, min: 100)}";
  bool showBadge = random.boolean();

  double followers = double.parse(random.decimal(min: 10).toStringAsFixed(1));
}

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text");

  final List<AcrivityItem> _activityList =
      List.generate(20, (index) => AcrivityItem());

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
          centerTitle: false,
          title: const Text(
            "Activity",
            style: TextStyle(
              fontSize: Sizes.size28,
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: isDarkMode(context) ? Colors.white : Colors.black,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  Sizes.size8,
                ),
              ),
              border: Border.all(
                color: isDarkMode(context) ? Colors.white : Colors.black,
                width: Sizes.size1,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: isDarkMode(context) ? Colors.black : Colors.white,
            labelColor: isDarkMode(context) ? Colors.black : Colors.white,
            unselectedLabelColor:
                isDarkMode(context) ? Colors.white : Colors.black,
            tabs: [
              for (var tab in tabs)
                SizedBox(
                  height: Sizes.size40,
                  width: Sizes.size80,
                  child: Tab(
                    text: tab,
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                ListView(
                  children: [
                    Gaps.v16,
                    for (var activity in _activityList)
                      ListTile(
                        minVerticalPadding: Sizes.size16,
                        leading: SizedBox(
                          width: Sizes.size48,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                ProfileCircle(profileUrl: activity.profileUrl),
                                CircleAvatar(
                                  radius: Sizes.size10,
                                  backgroundColor: activity.actType.color,
                                  child: Icon(
                                    activity.actType.icon,
                                    color: Colors.white,
                                    size: Sizes.size12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  activity.author,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.h2,
                                if (activity.showBadge)
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
                                Gaps.h4,
                                Text(
                                  activity.createDate,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            if (activity.actType.description.isNotEmpty)
                              Gaps.v4,
                            if (activity.actType.description.isNotEmpty)
                              Text(
                                activity.actType.description,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                            Gaps.v8,
                            Text(
                              activity.article,
                              style: const TextStyle(
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            if (activity.actType == ActivityType.follows)
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      Sizes.size8,
                                    ),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Sizes.size6,
                                    horizontal: Sizes.size16,
                                  ),
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
