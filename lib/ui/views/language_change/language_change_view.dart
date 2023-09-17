

import 'package:bedtime_stories/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/app_constants.dart';
import 'language_change_viewmodel.dart';

class LanguageChangeView extends StackedView<LanguageChangeViewModel> {
  final bool isLanguageChangeViewExpanded;
  final Function({required bool tileExpanded}) onTap;

  const LanguageChangeView({
    Key? key,
    this.isLanguageChangeViewExpanded = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LanguageChangeViewModel viewModel,
    Widget? child,
  ) {
    return Card(
      shape: getCardShape(),
      child: ExpansionTile(
        initiallyExpanded: isLanguageChangeViewExpanded,
        onExpansionChanged: (value) {
          onTap(tileExpanded: value)?.call();
        },
        shape: getCardShape(),
        // onTap: viewModel.takeToChangeThemeView,
        title: Text(
          AppLocalizations.of(context).languageScreenTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        childrenPadding:
            const EdgeInsets.only(left: 24, top: 4, bottom: 4, right: 8),
        children: List.generate(
          L10n.all.length,
          (index) => ListTile(
            shape: getCardShape(),
            onTap: () {
              viewModel.setSelectedAppLocale(index: index);
            },
            title: Text(
              getLanguageName(index, context),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black),
            ),
            selected: viewModel.isLanguageSelected(index: index),
            trailing: viewModel.isLanguageSelected(index: index)
                ? const Icon(Icons.done_outline_outlined)
                : null,
          ),
        ),
      ),
    );
  }

  @override
  LanguageChangeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LanguageChangeViewModel();

  String getLanguageName(int index, BuildContext context) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context).languageEnglish;

      case 1:
        return AppLocalizations.of(context).languageHindi;

      default:
        return AppLocalizations.of(context).languageEnglish;
    }
  }
}
