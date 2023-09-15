import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _privateProfile = false;

  void _onPrivateProfileChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _privateProfile = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: _privateProfile,
            onChanged: _onPrivateProfileChanged,
            title: const Text("Private profile"),
            secondary: const FaIcon(FontAwesomeIcons.lock, color: Colors.black),
          ),
          const ListTile(
            title: Row(
              children: [
                Text("Mentions"),
                Spacer(),
                Text(
                  "Everyone",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            leading: FaIcon(FontAwesomeIcons.at, color: Colors.black),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text("Muted"),
            leading: FaIcon(FontAwesomeIcons.bellSlash, color: Colors.black),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text("Hidden Words"),
            leading: FaIcon(FontAwesomeIcons.eyeSlash, color: Colors.black),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text("Profiles you follow"),
            leading: FaIcon(FontAwesomeIcons.users, color: Colors.black),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Other privacy settings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "Some settings, like restrict, apply to both Threads and Instargram and can be managed on Instargram."),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size20,
            ),
          ),
          const ListTile(
            title: Text("Blocked profiles"),
            leading: FaIcon(FontAwesomeIcons.circleXmark, color: Colors.black),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size20,
            ),
          ),
          const ListTile(
            title: Text("Hide likes"),
            leading: FaIcon(FontAwesomeIcons.heartCrack, color: Colors.black),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size20,
            ),
          ),
        ],
      ),
    );
  }
}
