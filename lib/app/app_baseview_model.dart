import 'package:bedtime_stories/services/app_preferences_service.dart';
import 'package:bedtime_stories/services/http_service.dart';
import 'package:bedtime_stories/services/tts_service.dart';
import 'package:bedtime_stories/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

mixin AppBaseViewModel {
  DialogService dialogService = locator<DialogService>();
  NavigationService navigationService = locator<NavigationService>();
  SnackbarService snackBarService = locator<SnackbarService>();
  InterFaceAppPreferences preferencesService = locator<AppPreferencesService>();
  BottomSheetService bottomSheetService = locator<BottomSheetService>();
  HttpService httpService = locator<HttpService>();
  TtsService ttsService = locator<TtsService>();
  UserService userService = locator<UserService>();
}
