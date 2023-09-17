import 'dart:async';

import 'package:bedtime_stories/app/app.bottomsheets.dart';
import 'package:bedtime_stories/app/app.logger.dart';
import 'package:bedtime_stories/app/app_baseview_model.dart';
import 'package:bedtime_stories/enums/signin_results.dart';
import 'package:stacked/stacked.dart';

class GoogleSignInModel extends BaseViewModel with AppBaseViewModel {
  final log = getLogger('GoogleSignInModel');

  Future<void> signInWithGoogle() async {
    log.i('');

    final result = await runBusyFuture(userService.signInWithGoogle());

    if (result == SignInResult.failure) {
      await bottomSheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: 'Sign in failed',
        description: 'Please, try again later or contact support',
      );

      return;
    }
  }
}
