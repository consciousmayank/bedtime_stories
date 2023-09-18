import 'package:bedtime_stories/app/app.bottomsheets.dart';
import 'package:bedtime_stories/app/app_baseview_model.dart';
import 'package:bedtime_stories/classes/story_request.dart';
import 'package:bedtime_stories/classes/story_response.dart';
import 'package:bedtime_stories/services/tts_service.dart';
import 'package:bedtime_stories/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel with AppBaseViewModel {
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  HomeViewModel() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );

    pageController.addListener(
      () {
        page = pageController.page!;
        notifyListeners();
      },
    );
  }

  late PageController pageController;
  double page = 0.0;

  List<String> images = [
    // 'https://cdn.midjourney.com/0218db89-51be-4cbc-bec5-9a7ffb57a5e2/0_2.webp',
    // 'https://cdn.midjourney.com/8a0bd7c2-c825-499a-8732-38d0f6b68e5f/0_1.webp',
    // 'https://cdn.midjourney.com/a7908e69-68e8-4518-b5b3-56b97f13fdf4/0_1.webp',
    // 'https://cdn.midjourney.com/b396124b-51da-421d-8303-f6674f63893c/0_2.webp',
    // 'https://cdn.midjourney.com/b03c17bc-03bc-47ff-83ae-3e9cf0850948/0_0.webp',
    // 'https://cdn.midjourney.com/986a90af-d026-48fd-8827-3358ff3dab1a/0_1.webp',
    // 'https://cdn.midjourney.com/e95c5dd6-c946-4aa0-8460-5a831bf6f2f4/0_3.webp',
    // 'https://cdn.midjourney.com/8ed5f548-f6de-4a87-b4ff-7f4ad9f85b1d/0_3.webp',
    // 'https://cdn.midjourney.com/82a96c41-6529-42a2-b761-b7a17f586f54/0_2.webp',
    // 'https://cdn.midjourney.com/ee97c368-7a8d-439f-87fd-26202e868c59/0_0.webp',
    // 'https://cdn.midjourney.com/addcafb2-503b-4509-8c47-09e6a0d64571/0_3.webp',
    'https://flutter4fun.com/wp-content/uploads/2021/06/1-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/2-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/3-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/4-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/5-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/6-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/7-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/8-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/9-1.jpg',
    'https://flutter4fun.com/wp-content/uploads/2021/06/10-1.jpg',
  ];

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
