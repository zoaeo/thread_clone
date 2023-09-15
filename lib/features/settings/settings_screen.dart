import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/settings/setting_config_vm.dart';
import 'package:tiktok_clone/utils.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _onPrivacyPressed() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const PrivacyScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: isDarkMode(context) ? Colors.black : Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {},
            title: const Text("Follow and invite friends"),
            leading: FaIcon(FontAwesomeIcons.userPlus,
                color: isDarkMode(context) ? Colors.white : Colors.black),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Notifications"),
            leading: FaIcon(FontAwesomeIcons.bell,
                color: isDarkMode(context) ? Colors.white : Colors.black),
          ),
          ListTile(
            onTap: _onPrivacyPressed,
            title: const Text("Privacy"),
            leading: FaIcon(FontAwesomeIcons.lock,
                color: isDarkMode(context) ? Colors.white : Colors.black),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Account"),
            leading: FaIcon(FontAwesomeIcons.circleUser,
                color: isDarkMode(context) ? Colors.white : Colors.black),
          ),
          ListTile(
            onTap: () {},
            title: const Text("Help"),
            leading: FaIcon(FontAwesomeIcons.lifeRing,
                color: isDarkMode(context) ? Colors.white : Colors.black),
          ),
          ListTile(
            onTap: () {},
            title: const Text("About"),
            leading: FaIcon(FontAwesomeIcons.circleInfo,
                color: isDarkMode(context) ? Colors.white : Colors.black),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(settingConfigProvider).darkmode,
            onChanged: (value) =>
                ref.read(settingConfigProvider.notifier).setDarkMode(value),
            title: const Text("Dark Mode"),
          ),
          const Divider(),
          ListTile(
            title: const Text("Log out"),
            textColor: Colors.blue,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            trailing: const FaIcon(FontAwesomeIcons.spinner),
          ),
        ],
      ),
    );
  }
}
