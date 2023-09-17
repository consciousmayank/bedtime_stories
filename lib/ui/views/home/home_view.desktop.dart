import 'package:bedtime_stories/ui/common/app_constants.dart';
import 'package:bedtime_stories/ui/common/app_strings.dart';
import 'package:bedtime_stories/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bedtime Stories'),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              viewModel.getDefaultStory();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
          horizontalSpaceLarge,
          IconButton.filledTonal(
            onPressed: () {
              viewModel.ttsService.speak();
            },
            icon: const Icon(
              Icons.play_arrow,
            ),
          ),
          horizontalSpaceSmall,
        ],
      ),
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: viewModel.busy(getStoryResponseObject)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Text(
                    viewModel.getStoryText(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
        ),
      ),
    );
  }
}
