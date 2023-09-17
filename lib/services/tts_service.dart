import 'dart:io';

import 'package:bedtime_stories/app/app.logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:stacked/stacked.dart';

enum TtsState { playing, stopped, paused, continued }

class TtsService with ListenableServiceMixin {
  late FlutterTts flutterTts;

  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? _newVoiceText;

  // TtsState ttsState = TtsState.stopped;

  get isPlaying => _currentState.value == TtsState.playing;
  get isStopped => _currentState.value == TtsState.stopped;
  get isPaused => _currentState.value == TtsState.paused;
  get isContinued => _currentState.value == TtsState.continued;

  TtsState get currentState => _currentState.value;
  TtsPoint get currentWord => _currentWord.value;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  final ReactiveValue<TtsState> _currentState = ReactiveValue(TtsState.stopped);
  final ReactiveValue<TtsPoint> _currentWord = ReactiveValue(
    TtsPoint(
      start: 0,
      end: 0,
      word: '',
    ),
  );

  void setTtsState({required TtsState state}) {
    _currentState.value = state;
    notifyListeners();
  }

  TtsService() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setTtsState(state: TtsState.playing);
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        getLogger('ttsService').d("TTS Initialized");
      });
    }

    flutterTts.setCompletionHandler(() {
      getLogger('ttsService').d("TTS completed");
      setTtsState(
        state: TtsState.stopped,
      );
    });

    flutterTts.setCancelHandler(() {
      getLogger('ttsService').d("TTS stopped");
      setTtsState(
        state: TtsState.stopped,
      );
    });

    flutterTts.setPauseHandler(() {
      getLogger('ttsService').d("TTS paused");
      setTtsState(
        state: TtsState.paused,
      );
    });

    flutterTts.setContinueHandler(() {
      getLogger('ttsService').d("TTS Continued");
      setTtsState(
        state: TtsState.continued,
      );
    });

    flutterTts.setErrorHandler((msg) {
      getLogger('ttsService').d("TTS Stopped");
      setTtsState(
        state: TtsState.stopped,
      );
    });

    flutterTts.setProgressHandler((text, start, end, word) {
      _currentWord.value = TtsPoint(
        start: start,
        end: end,
        word: word,
      );
    });

    listenToReactiveValues(
      [
        _currentState,
        _currentWord,
      ],
    );
  }

  // Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  // Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future _speak() async {
    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      setTtsState(state: TtsState.stopped);
    }
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) {
      setTtsState(state: TtsState.paused);
    }
  }

  void speak() => _speak();
  void stop() => _stop();
  void pause() => _pause();

  void setSpeakingText({required String text}) async {
    _newVoiceText = text;
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
  }
}

class TtsPoint {
  final int start, end;
  final String word;

  TtsPoint({
    required this.start,
    required this.end,
    required this.word,
  });
}
