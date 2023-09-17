import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'language_change_viewmodel.dart';

class LanguageChangeViewTablet
    extends ViewModelWidget<LanguageChangeViewModel> {
  const LanguageChangeViewTablet({super.key});

  @override
  Widget build(BuildContext context, LanguageChangeViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
