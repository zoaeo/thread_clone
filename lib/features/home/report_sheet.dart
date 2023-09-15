import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ReportSheet extends StatefulWidget {
  const ReportSheet({super.key});

  @override
  State<ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<ReportSheet> {
  final ScrollController _scrollController = ScrollController();

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
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const FaIcon(
            FontAwesomeIcons.minus,
            size: Sizes.size36,
            color: Colors.grey,
          ),
        ),
        body: Stack(
          children: [
            Scrollbar(
              controller: _scrollController,
              child: ListView(
                children: [
                  const Expanded(
                    child: Text(
                      "Report",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v12,
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade200,
                  ),
                  const ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.v12,
                        Text(
                          "Why are you reporting this thread?",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gaps.v12,
                        Text(
                          "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey,
                          ),
                        ),
                        Gaps.v12,
                      ],
                    ),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  const ListTile(
                    title: Text("I just don't like it"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  const ListTile(
                    title: Text("It's unlawful content under NetzDG"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  const ListTile(
                    title: Text("It's spam"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  const ListTile(
                    title: Text("Hate speech or symbols"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  const ListTile(
                    title: Text("Nudity or sexual activity"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  const ListTile(
                    title: Text("Bullying or harassment"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  // const ListTile(
                  //   title: Text("False information"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   height: 1.0,
                  //   color: Colors.grey.shade300,
                  // ),
                  // const ListTile(
                  //   title: Text("Scam or fraud"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   height: 1.0,
                  //   color: Colors.grey.shade300,
                  // ),
                  // const ListTile(
                  //   title: Text("Violence or dangerous organisations"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   height: 1.0,
                  //   color: Colors.grey.shade300,
                  // ),
                  // const ListTile(
                  //   title: Text("Suicide or self-injury"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   height: 1.0,
                  //   color: Colors.grey.shade300,
                  // ),
                  // const ListTile(
                  //   title: Text("Intellectual property violation"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   height: 1.0,
                  //   color: Colors.grey.shade300,
                  // ),
                  // const ListTile(
                  //   title: Text("Sale of illegal or regulated goods"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   height: 1.0,
                  //   color: Colors.grey.shade300,
                  // ),
                  // const ListTile(
                  //   title: Text("Eating disorders"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   height: 1.0,
                  //   color: Colors.grey.shade300,
                  // ),
                  // const ListTile(
                  //   title: Text("Something else"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  Gaps.v24,
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: const BottomAppBar(
                color: Colors.white,
                child: Row(
                  children: [
                    Gaps.h10,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
