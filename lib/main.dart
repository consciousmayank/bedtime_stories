
import 'package:flutter/material.dart';
import 'package:bedtime_stories/app/app.bottomsheets.dart';
import 'package:bedtime_stories/app/app.dialogs.dart';
import 'package:bedtime_stories/app/app.locator.dart';
import 'package:bedtime_stories/app/app.router.dart';
import 'package:url_strategy/url_strategy.dart';

import 'ui/views/app_parent/app_parent_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const AppParentView());
}
