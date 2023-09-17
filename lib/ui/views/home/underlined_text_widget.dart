import 'package:bedtime_stories/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UnderlinedTextWidget extends ViewModelWidget<HomeViewModel> {
  const UnderlinedTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return RichText(
      key: const ValueKey('text'),
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: viewModel.getStoryText().substring(
                  0,
                  viewModel.ttsService.currentWord.start +
                      viewModel.startPosition,
                ),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: viewModel.getStoryText().substring(
                  viewModel.ttsService.currentWord.start +
                      viewModel.startPosition,
                  viewModel.ttsService.currentWord.end + viewModel.endPosition,
                ),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).primaryColor),
          ),
          TextSpan(
            text: viewModel.getStoryText().substring(
                  viewModel.ttsService.currentWord.end + viewModel.endPosition,
                ),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
