import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/utils/snack_bar_util.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/sign_in_view_body.dart';
import 'package:bookly_app/features/auth/presentation/view_model/auth_sign_in_cubit/auth_sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInCubit, AuthSignInState>(
      listener: (context, state) {
        if (state is AuthSignInSuccess) {
          SnackBarUtil.showCustomSnackBar(
            context,
            "Registration successful!",
            isError: false,
          );
        } else if (state is AuthSignInFailure) {
          SnackBarUtil.showCustomSnackBar(context, state.error, isError: true);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthSignInLoading ? true : false,
          color: kPrimaryColor,
          progressIndicator: CircularProgressIndicator(color: kPrimaryColor),
          child: Scaffold(
            appBar: const CustomAppBar(title: 'Get Started'),
            body: SignInViewBody(),
          ),
        );
      },
    );
  }
}
