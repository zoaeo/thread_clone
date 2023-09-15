import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/home/widgets/post_widget.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class SearchItem {
  String author = faker.person.firstName();
  String id = faker.person.name();
  String profileUrl =
      "https://placedog.net/${random.integer(500, min: 100)}/${random.integer(500, min: 100)}";
  bool showBadge = random.boolean();

  double followers = double.parse(random.decimal(min: 10).toStringAsFixed(1));
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController(
    text: "",
  );
  final List<SearchItem> _searchList =
      List.generate(20, (index) => SearchItem());

  void _onSearchChanged(String value) {
    print("Searching form $value");
  }

  void _onSearchSubmitted(String value) {
    print("Submitted $value");
  }

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
          centerTitle: false,
          title: const Text(
            "Search",
            style: TextStyle(
              fontSize: Sizes.size28,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                  ),
                  child: CupertinoSearchTextField(
                    controller: _textEditingController,
                    onChanged: _onSearchChanged,
                    onSubmitted: _onSearchSubmitted,
                  ),
                ),
                Gaps.v16,
                for (var searchItem in _searchList)
                  ListTile(
                    minVerticalPadding: Sizes.size16,
                    leading: SizedBox(
                      width: Sizes.size48,
                      child: Center(
                          child:
                              ProfileCircle(profileUrl: searchItem.profileUrl)),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              searchItem.author,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.h2,
                            if (searchItem.showBadge)
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
                          ],
                        ),
                        Gaps.v4,
                        Text(
                          searchItem.id,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.v8,
                        Text(
                          "${searchItem.followers}K followers",
                          style: const TextStyle(
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
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
      ),
    );
  }
}
