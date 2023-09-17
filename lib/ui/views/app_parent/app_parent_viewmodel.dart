
import 'package:flutter/material.dart';
import 'package:bedtime_stories/app/app.locator.dart';
import 'package:bedtime_stories/app/app_baseview_model.dart';
import 'package:bedtime_stories/services/app_preferences_service.dart';
import 'package:bedtime_stories/services/app_theme_service.dart';
import 'package:stacked/stacked.dart';

class AppParentViewModel extends ReactiveViewModel with AppBaseViewModel {
  final AppThemeService _themeService = locator<AppThemeService>();

  final AppPreferencesService _appPreferencesService =
      locator<AppPreferencesService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeService,
      ];

  ThemeData getTheme() => _themeService.themeData;

  Locale getLocale() => _themeService.appLocale;

  getColorOptions() => _themeService.colorOptions;

  void handleBrightnessChange() {
    _themeService.handleBrightnessChange();
    notifyListeners();
  }

  void handleColorSelect(int value) {
    _themeService.handleColorSelect(value);
    notifyListeners();
  }
}
