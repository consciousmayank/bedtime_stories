

import 'package:stacked/stacked.dart';

import 'package:bedtime_stories/app/app.locator.dart';
import 'package:bedtime_stories/services/app_theme_service.dart';

class ThemeChangeViewModel extends ReactiveViewModel {
  final AppThemeService _themeService = locator<AppThemeService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeService,
      ];

  List<ThemeColorOptions> getColorOptions() => _themeService.colorOptions;

  void handleBrightnessChange() {
    _themeService.handleBrightnessChange();
    notifyListeners();
  }

  void handleColorSelect(int value) {
    _themeService.handleColorSelect(value);
    notifyListeners();
  }

  bool get darkModeValue => _themeService.useLightMode;

  bool get useMaterial3 => _themeService.useMaterial3;

  setDarkModeValue({bool? value}) {
    if (value != null) {
      _themeService.handleDarkModeSelect(value);
    }
  }

  setUseMaterial3({bool? value}) {
    if (value != null) {
      _themeService.handleMaterial3Select(value);
    }
  }

  getSelectedThemeColor() {
    return _themeService.colorOptions
        .elementAt(_themeService.colorSelected)
        .color;
  }

  getSelectedThemeColorName() {
    return _themeService.colorOptions
        .elementAt(_themeService.colorSelected)
        .colorName;
  }

  int get selectedThemeIndex => _themeService.colorSelected;
}
