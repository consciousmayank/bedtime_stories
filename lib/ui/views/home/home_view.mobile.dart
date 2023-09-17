import 'package:bedtime_stories/services/tts_service.dart';
import 'package:bedtime_stories/ui/common/app_strings.dart';
import 'package:bedtime_stories/ui/common/ui_helpers.dart';
import 'package:bedtime_stories/ui/widgets/pop_up_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: IconButton.filled(
        icon: AnimatedSwitcher(
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          duration: const Duration(milliseconds: 250),
          child: getProperWidget(
            ttsState: viewModel.ttsService.currentState,
          ),
        ),
        onPressed: () {
          viewModel.performTtsOperation();
        },
      ),
      appBar: AppBar(
        title: Text(
          'Dreamy Tales',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        actions: [
          ThemePopUpMenuWidget(
            options: [
              PopUpMenuOptions(
                menuValue: 0,
                onMenuItemSelected: () {
                  viewModel.showThemeChangeBottomSheet();
                },
                menuTitle: 'Change Theme',
              ),
              PopUpMenuOptions(
                menuValue: 0,
                onMenuItemSelected: () {},
                menuTitle: 'Change Language',
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: viewModel.busy(getStoryResponseObject)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator.adaptive(
                  displacement: screenWidth(context) / 5,
                  backgroundColor: Theme.of(context).primaryColor,
                  color: Theme.of(context).primaryColorLight,
                  strokeWidth: 3,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: () async {
                    await viewModel.getDefaultStory();
                  },
                  child: SingleChildScrollView(
                    child: Text(
                      viewModel.getStoryText(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget getProperWidget({
    required TtsState ttsState,
  }) {
    return switch (ttsState) {
      TtsState.continued => const Icon(
          Icons.pause,
          key: ValueKey(1),
        ),
      TtsState.paused => const Icon(
          Icons.play_arrow,
          key: ValueKey(2),
        ),
      TtsState.playing => const Icon(
          Icons.pause,
          key: ValueKey(3),
        ),
      TtsState.stopped => const Icon(
          Icons.play_arrow,
          key: ValueKey(4),
        ),
    };
  }
}
