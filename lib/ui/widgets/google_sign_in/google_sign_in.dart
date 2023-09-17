import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'google_sign_in_model.dart';

class GoogleSignIn extends StackedView<GoogleSignInModel> {
  final bool isBusy;
  final bool enabled;

  const GoogleSignIn({
    Key? key,
    this.isBusy = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GoogleSignInModel viewModel,
    Widget? child,
  ) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: const Text(
        'Sign up with Google',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  GoogleSignInModel viewModelBuilder(BuildContext context) =>
      GoogleSignInModel();
}
