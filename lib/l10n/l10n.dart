import 'package:flutter/material.dart';

class L10n {
  static const _englishLocale = Locale('en');
  static const _hindiLocale = Locale('hi');

  static final all = {
    _englishLocale,
    _hindiLocale,
  };

  static Locale getLocaleAt({required Locale locale}) {
    switch (locale) {
      case _hindiLocale:
        return _hindiLocale;
      case _englishLocale:
        return _englishLocale;
      default:
        return _englishLocale;
    }
  }
}
