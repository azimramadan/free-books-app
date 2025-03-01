import 'package:bookly_app/features/auth/presentation/view/widgets/custom_elevated_button%20.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/passwword_text_form_field_with_icon.dart';
import 'package:bookly_app/features/auth/presentation/view_model/auth_sign_in_cubit/auth_sign_in_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isAutoValidate = false;

  void signIN() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthSignInCubit>(context).signInUser(
        input: identifierController.text,
        password: passwordController.text,
      );
    } else {
      setState(() {
        isAutoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode:
          isAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Username/email",
            controller: identifierController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email or user name';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          PasswordTextFormFieldWithIcon(
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          CustomElevatedButton(onPressed: signIN, text: 'Get Started'),
        ],
      ),
    );
  }
}
