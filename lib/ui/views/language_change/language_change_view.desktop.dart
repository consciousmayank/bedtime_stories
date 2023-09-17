import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'language_change_viewmodel.dart';

class LanguageChangeViewDesktop
    extends ViewModelWidget<LanguageChangeViewModel> {
  const LanguageChangeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, LanguageChangeViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
