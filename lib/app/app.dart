import 'package:bedtime_stories/services/app_preferences_service.dart';
import 'package:bedtime_stories/services/app_theme_service.dart';
import 'package:bedtime_stories/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:bedtime_stories/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bedtime_stories/ui/views/app_parent/app_parent_view.dart';
import 'package:bedtime_stories/ui/views/home/home_view.dart';
import 'package:bedtime_stories/ui/views/language_change/language_change_view.dart';
import 'package:bedtime_stories/ui/views/startup/startup_view.dart';
import 'package:bedtime_stories/ui/views/theme_change/theme_change_view.dart';
import 'package:bedtime_stories/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:bedtime_stories/services/http_service.dart';
import 'package:bedtime_stories/services/tts_service.dart';
import 'package:bedtime_stories/ui/bottom_sheets/change_theme/change_theme_sheet.dart';
import 'package:bedtime_stories/services/user_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: HomeView),
    MaterialRoute(page: AppParentView),
    CustomRoute(page: ThemeChangeView),
    CustomRoute(page: LanguageChangeView),
// @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  logger: StackedLogger(),
  dependencies: [
    InitializableSingleton(classType: AppPreferencesService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: HttpService),
    LazySingleton(classType: TtsService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: AppThemeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ChangeThemeSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
