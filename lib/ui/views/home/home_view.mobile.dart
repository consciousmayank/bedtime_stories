import 'package:bedtime_stories/services/tts_service.dart';
import 'package:bedtime_stories/ui/common/app_constants.dart';
import 'package:bedtime_stories/ui/common/app_strings.dart';
import 'package:bedtime_stories/ui/common/ui_helpers.dart';
import 'package:bedtime_stories/ui/widgets/pop_up_menu_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: IconButton.filled(
      //   icon: AnimatedSwitcher(
      //     transitionBuilder: (child, animation) => ScaleTransition(
      //       scale: animation,
      //       child: child,
      //     ),
      //     duration: const Duration(milliseconds: 250),
      //     child: getProperWidget(
      //       ttsState: viewModel.ttsService.currentState,
      //     ),
      //   ),
      //   onPressed: () {
      //     viewModel.performTtsOperation();
      //   },
      // ),
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
        child: viewModel.busy(getStoryResponseObject)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PageView.builder(
                controller: viewModel.pageController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: ParallaxImage(
                          url: viewModel.images[index],
                          horizontalSlide:
                              (index - viewModel.page).clamp(-1, 1).toDouble(),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Card(
                          shape: getCardShape(radius: getDefaultRadius * 2),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 24,
                              ),
                              child: Text(
                                viewModel
                                    .getStoryText()
                                    .split('\n\n')
                                    .elementAt(
                                      index,
                                    ),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceLarge,
                    ],
                  );
                },
                itemCount: viewModel.images.length,
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

class ParallaxImage extends StatelessWidget {
  final String url;
  final double horizontalSlide;

  const ParallaxImage({
    Key? key,
    required this.url,
    required this.horizontalSlide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scale = 1 - horizontalSlide.abs();
    final size = MediaQuery.of(context).size;
    return Center(
      child: Card(
        elevation: 16,
        shape: getCardShape(radius: getDefaultRadius * 2),
        child: SizedBox(
          width: size.width * ((scale * 0.8) + 0.8),
          height: size.height * ((scale * 0.2) + 0.2),
          child: ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(getDefaultRadius * 2)),
            child: CachedNetworkImage(
              alignment: Alignment(horizontalSlide, 1),
              fit: BoxFit.cover,
              imageUrl: url,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                    child: Text(
                  '${downloadProgress.progress} % downloaded',
                  style: Theme.of(context).textTheme.titleLarge,
                ));
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            // Image.network(
            //   url,
            //   alignment: Alignment(horizontalSlide, 1),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),
    );
  }
}
