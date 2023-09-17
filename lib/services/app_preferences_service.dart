import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked_annotations.dart';

import '../l10n/l10n.dart';

const String _preferencesEncryptionKey = 'preferencesEncryptionKey';
const String _storedAppLocale = 'storedAppLocale';

abstract class InterFaceAppPreferences {
  ///Returns the Locale saved in app which user has selected as the app locale.
  ///Or the first options from the list of languages supported by the app from [L10n]
  Locale getAppLanguageLocale();

  ///Saves the language code from the locale[locale] selected by the user as App language.
  void setAppLanguageLocale({
    required Locale locale,
  });

}

class AppPreferencesService
    implements InterFaceAppPreferences, InitializableDependency {
  late List<int> key;

  late Box appHelperBox;

  final FlutterSecureStorage _sharedPrefs = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ));

  Future _initPreferences() async {
    String? keyString = await _sharedPrefs.read(key: _preferencesEncryptionKey);

    if (keyString == null) {
      key = Hive.generateSecureKey();
      await _sharedPrefs.write(
        key: _preferencesEncryptionKey,
        value: base64UrlEncode(
          key,
        ),
      );
    } else {
      key = base64Url.decode(keyString);
    }

    //declare hive adapters here
    
    //declare hive adapters above

    await Hive.initFlutter();
    await _openAppHelperBox();
  }

  Future _openAppHelperBox() async {
    appHelperBox = await Hive.openBox(
      'appHelperBox',
      encryptionCipher: HiveAesCipher(
        key,
      ),
    );
  }

  @override
  Locale getAppLanguageLocale() {
    String? languageCode = appHelperBox.get(_storedAppLocale);

    return languageCode == null
        ? L10n.all.first
        : Locale(
            languageCode,
          );
  }

  @override
  void setAppLanguageLocale({required Locale locale}) {
    appHelperBox.put(_storedAppLocale, locale.languageCode);
  }

  @override
  Future<void> init() async {
    // _instance ??= AppPreferenceService();
    await _initPreferences();
    // return Future.value(_instance);
  }
  
}
