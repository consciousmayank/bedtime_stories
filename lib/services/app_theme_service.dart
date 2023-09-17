import 'package:flutter/material.dart';
import 'package:bedtime_stories/services/app_preferences_service.dart';
import 'package:bedtime_stories/ui/common/app_constants.dart';
import 'package:stacked/stacked.dart';

import 'package:bedtime_stories/app/app.locator.dart';

class AppThemeService with ListenableServiceMixin {
  AppThemeService() {
    _themeData = ReactiveValue(
      updateThemes(
        _colorSelected.value,
        true,
        _useLightMode.value,
      ),
    );
    _appLocale = ReactiveValue(getLocaleFromPref());
    listenToReactiveValues(
      [
        _themeData,
        _colorSelected,
        _useLightMode,
        _colorOptions,
        _appLocale,
      ],
    );
  }

  late ReactiveValue<Locale> _appLocale;
  final List<ThemeColorOptions> _colorOptions = [
    ThemeColorOptions(color: colorBlue, colorName: 'Blue'),
    ThemeColorOptions(color: colorGreen, colorName: 'Green'),
    ThemeColorOptions(color: colorRed, colorName: 'Red'),
    ThemeColorOptions(color: colorYellow, colorName: 'Yellow'),
    ThemeColorOptions(color: colorPink, colorName: 'Pink'),
    ThemeColorOptions(color: colorGrey, colorName: 'Grey'),
    ThemeColorOptions(color: colorBrown, colorName: 'Brown'),
  ];

  final ReactiveValue<int> _colorSelected = ReactiveValue<int>(1);

  late ReactiveValue<ThemeData> _themeData;

  final ReactiveValue<bool> _useLightMode = ReactiveValue<bool>(true);
  final ReactiveValue<bool> _useMaterial3 = ReactiveValue<bool>(true);

  get useLightMode => _useLightMode.value;

  get useMaterial3 => _useMaterial3.value;

  int get colorSelected => _colorSelected.value;

  ThemeData updateThemes(int colorIndex, bool useMaterial3, bool useLightMode) {
    return ThemeData(
      fontFamily: 'sans3',
      colorSchemeSeed: colorOptions[_colorSelected.value].color,
      useMaterial3: useMaterial3,
      brightness: useLightMode ? Brightness.light : Brightness.dark,
    ).copyWith(
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor:
            useLightMode ? unselectedTabLabelColor : Colors.black,
        indicator: BoxDecoration(
          borderRadius: defaultBorderRadius,
          color: colorOptions[_colorSelected.value].color,
        ),
      ),
    );
  }

  void handleBrightnessChange() {
    _useLightMode.value = !(_useLightMode.value);
    _themeData.value = updateThemes(
        _colorSelected.value, _useMaterial3.value, _useLightMode.value);
    notifyListeners();
  }

  void handleColorSelect(int value) {
    _colorSelected.value = value;
    _themeData.value = updateThemes(
        _colorSelected.value, _useMaterial3.value, _useLightMode.value);
    notifyListeners();
  }

  void handleDarkModeSelect(bool value) {
    _useLightMode.value = value;
    _themeData.value = updateThemes(
        _colorSelected.value, _useMaterial3.value, _useLightMode.value);
    notifyListeners();
  }

  void handleMaterial3Select(bool value) {
    _useMaterial3.value = value;
    _themeData.value = updateThemes(
        _colorSelected.value, _useMaterial3.value, _useLightMode.value);
    notifyListeners();
  }

  ThemeData get themeData => _themeData.value;

  Locale get appLocale => _appLocale.value;

  List<ThemeColorOptions> get colorOptions => _colorOptions;

  Locale getLocaleFromPref() {
    var defaultLocale = locator<AppPreferencesService>().getAppLanguageLocale();
    locator<AppPreferencesService>().setAppLanguageLocale(locale: defaultLocale);

    return defaultLocale;
  }

  void _setLocaleInPref({
    required Locale appLocale,
  }) {
    locator<AppPreferencesService>().setAppLanguageLocale(
      locale: appLocale,
    );
  }

  void changeAppLocale({
    required Locale appLocale,
  }) {
    _setLocaleInPref(appLocale: appLocale);
    _appLocale.value = appLocale;
    notifyListeners();
  }
}

class ThemeColorOptions {
  final Color color;
  final String colorName;

  ThemeColorOptions({
    required this.color,
    required this.colorName,
  });
}
