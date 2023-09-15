import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/features/settings/setting_config_vm.dart';

bool isDarkMode(BuildContext context) =>
    // MediaQuery.of(context).platformBrightness == Brightness.dark;
    context.watch<SettingConfigViewModel>().darkmode;
