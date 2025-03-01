import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/utils/snack_bar_util.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/register_view_body.dart';
import 'package:bookly_app/features/auth/presentation/view_model/auth_register_cubit/auth_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthRegisterCubit, AuthRegisterState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          SnackBarUtil.showCustomSnackBar(
            context,
            "Registration successful!",
            isError: false,
          );
        } else if (state is AuthRegisterFailure) {
          SnackBarUtil.showCustomSnackBar(context, state.error, isError: true);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthRegisterLoading ? true : false,
          color: kPrimaryColor,
          progressIndicator: CircularProgressIndicator(color: kPrimaryColor),
          child: Scaffold(
            appBar: const CustomAppBar(title: 'Register'),
            body: const RegisterViewBody(),
          ),
        );
      },
    );
  }
}
