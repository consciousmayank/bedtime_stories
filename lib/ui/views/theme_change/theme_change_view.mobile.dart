import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'theme_change_viewmodel.dart';

class ThemeChangeViewMobile extends ViewModelWidget<ThemeChangeViewModel> {
  const ThemeChangeViewMobile({super.key});

  @override
  Widget build(BuildContext context, ThemeChangeViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
