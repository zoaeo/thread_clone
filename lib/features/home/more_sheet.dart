import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/home/report_sheet.dart';

class MoreSheet extends StatefulWidget {
  const MoreSheet({super.key});

  @override
  State<MoreSheet> createState() => _MoreSheetState();
}

class _MoreSheetState extends State<MoreSheet> {
  void _onReportTap() async {
    Navigator.of(context).pop();

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const ReportSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        body: Column(
          children: [
            Gaps.v12,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.size16))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(Sizes.size16),
                      child: Text(
                        "Unfollow",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      color: Colors.grey.shade300,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(Sizes.size16),
                      child: Text(
                        "Mute",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v24,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.size16))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(Sizes.size16),
                      child: Text(
                        "Hide",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      color: Colors.grey.shade300,
                    ),
                    GestureDetector(
                      onTap: _onReportTap,
                      child: const Padding(
                        padding: EdgeInsets.all(Sizes.size16),
                        child: Text(
                          "Report",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ),
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
