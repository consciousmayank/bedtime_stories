import 'package:bedtime_stories/app/app.bottomsheets.dart';
import 'package:bedtime_stories/app/app_baseview_model.dart';
import 'package:bedtime_stories/classes/story_request.dart';
import 'package:bedtime_stories/classes/story_response.dart';
import 'package:bedtime_stories/services/tts_service.dart';
import 'package:bedtime_stories/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel with AppBaseViewModel {
  int startPosition = 0;
  int endPosition = 0;
  bool _isScrolling = false;
  StoryResponse? storyResponse;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        ttsService,
      ];

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  get isScrolling => _isScrolling;

  set scrolling(bool isScrolling) {
    _isScrolling = isScrolling;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  Future getDefaultStory() async {
    ttsService.stop();
    storyResponse = await runBusyFuture(
      httpService.getStoryResponse(request: StoryRequest.defaultStory()),
      busyObject: getStoryResponseObject,
    );
    ttsService.setSpeakingText(text: getStoryText());
  }

  String getStoryText() {
    if (storyResponse == null || storyResponse!.choices.isEmpty) {
      return '--';
    }

    return storyResponse!.choices.first.message.content;
  }

  void performTtsOperation() async {
    if (userService.currentUser == null) {
      SheetResponse? response = await bottomSheetService.showBottomSheet(
          enableDrag: false,
          isScrollControlled: true,
          title: 'You are not logged in',
          description: 'Please login via Google to use Text-to-Speech feature.',
          confirmButtonTitle: 'Ok',
          cancelButtonTitle: 'Cancel'
          // variant: BottomSheetType.notice
          );

      if (response != null) {
        if (response.confirmed) {
          userService.signInWithGoogle();
        }
      }
    } else {
      switch (ttsService.currentState) {
        case TtsState.continued:
          startPosition = ttsService.currentWord.start + startPosition;
          endPosition = ttsService.currentWord.end + endPosition;
          ttsService.pause();
          notifyListeners();
          break;
        case TtsState.paused:
          ttsService.speak();
          break;
        case TtsState.playing:
          startPosition = ttsService.currentWord.start + startPosition;
          endPosition = ttsService.currentWord.end + endPosition;
          ttsService.pause();
          notifyListeners();
          break;
        case TtsState.stopped:
          startPosition = 0;
          endPosition = 0;
          ttsService.speak();
          notifyListeners();
          break;
      }
    }
  }

  void showThemeChangeBottomSheet() {
    bottomSheetService.showCustomSheet(variant: BottomSheetType.changeTheme);
  }
}
