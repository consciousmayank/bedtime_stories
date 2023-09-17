import 'package:bedtime_stories/ui/views/theme_change/theme_change_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'change_theme_sheet_model.dart';

class ChangeThemeSheet extends StackedView<ChangeThemeSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ChangeThemeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangeThemeSheetModel viewModel,
    Widget? child,
  ) {
    return ThemeChangeView(onTap: ({required bool tileExpanded}) {});
  }

  @override
  ChangeThemeSheetModel viewModelBuilder(BuildContext context) =>
      ChangeThemeSheetModel();
}
