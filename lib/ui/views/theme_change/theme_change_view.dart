

import 'package:flutter/material.dart';
import 'package:bedtime_stories/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/app_constants.dart';
import 'theme_change_viewmodel.dart';

class ThemeChangeView extends StackedView<ThemeChangeViewModel> {
  final bool isThemeChangeViewExpanded;
  final Function({required bool tileExpanded}) onTap;

  const ThemeChangeView({
    Key? key,
    this.isThemeChangeViewExpanded = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ThemeChangeViewModel viewModel,
    Widget? child,
  ) {
    return Card(
      shape: getCardShape(),
      child: ExpansionTile(
        childrenPadding:
            const EdgeInsets.only(left: 24, top: 4, bottom: 8, right: 8),
        initiallyExpanded: isThemeChangeViewExpanded,
        shape: getCardShape(),
        onExpansionChanged: (value) {
          onTap(tileExpanded: value)?.call();
        },
        title: Text(
          AppLocalizations.of(context).changeThemeText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        children: [
          // SwitchListTile.adaptive(
          //   value: viewModel.darkModeValue,
          //   onChanged: (value) => viewModel.setDarkModeValue(value: value),
          //   title: Text(
          //     'DarkMode',
          //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //           color: textColor(context),
          //         ),
          //   ),
          // ),
          // SwitchListTile.adaptive(
          //   value: viewModel.useMaterial3,
          //   onChanged: (value) => viewModel.setUseMaterial3(value: value),
          //   title: Text(
          //     'Use Material 3 Designs',
          //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //           color: textColor(context),
          //         ),
          //   ),
          // ),
          ListTile(
            title: Text(
              'Theme Color',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  viewModel.getSelectedThemeColorName(),
                )
              ],
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
            height: kToolbarHeight,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  viewModel.handleColorSelect(index);
                },
                child: Container(
                  margin: const EdgeInsets.all(1),
                  height: kToolbarHeight,
                  width: kToolbarHeight,
                  decoration: BoxDecoration(
                      color: viewModel.getColorOptions().elementAt(index).color,
                      borderRadius: defaultBorderRadius,
                      border: index == viewModel.selectedThemeIndex
                          ? Border.all(
                              color: Colors.blueGrey,
                              width: 3,
                            )
                          : null),
                ),
              ),
              itemCount: viewModel.getColorOptions().length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 3,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  ThemeChangeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ThemeChangeViewModel();

  Container surroundByContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: colorGrey),
          borderRadius: defaultBorderRadius),
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(2),
      child: child,
    );
  }
}
