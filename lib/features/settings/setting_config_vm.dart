import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/settings/setting_config_model.dart';
import 'package:tiktok_clone/features/settings/setting_config_repo.dart';

class SettingConfigViewModel extends Notifier<SettingConfigModel> {
  final SettingConfigRepository _repository;

  SettingConfigViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = SettingConfigModel(
      darkmode: value,
    );
  }

  @override
  SettingConfigModel build() {
    return SettingConfigModel(
      darkmode: _repository.isDarkMode(),
    );
  }
}

final settingConfigProvider =
    NotifierProvider<SettingConfigViewModel, SettingConfigModel>(
  () => throw UnimplementedError(),
);
