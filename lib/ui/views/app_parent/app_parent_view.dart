import 'package:flutter/material.dart';
import 'package:bedtime_stories/l10n/l10n.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bedtime_stories/app/app.router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'app_parent_viewmodel.dart';

class AppParentView extends StackedView<AppParentViewModel> {
  const AppParentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AppParentViewModel viewModel,
    Widget? child,
  ) {
    return ResponsiveApp(
      preferDesktop: true,
      builder: (child) => MaterialApp.router(
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: 'app_template',
        theme: viewModel.getTheme().copyWith(
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.black,
                    displayColor: Colors.black12,
                  ),
            ),
        supportedLocales: L10n.all,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        locale: viewModel.getLocale(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }

  @override
  AppParentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AppParentViewModel();
}
