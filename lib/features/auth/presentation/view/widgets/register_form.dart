import 'package:bookly_app/core/utils/helpers/validators.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_elevated_button%20.dart';
import 'package:bookly_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:bookly_app/features/auth/presentation/view_model/auth_register_cubit/auth_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isAutoValidate = false;

  void register() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthRegisterCubit>(context).registerUser(
        username: userNameController.text,
        email: emailController.text,
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
            hintText: 'Username',
            controller: userNameController,
            validator: Validators.validateUserName,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Email',
            controller: emailController,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Password',
            controller: passwordController,
            obscureText: true,
            validator: Validators.validatePassword,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            obscureText: true,
            validator:
                (value) => Validators.validateConfirmPassword(
                  value,
                  passwordController.text,
                ),
          ),
          const SizedBox(height: 32),
          CustomElevatedButton(onPressed: register, text: 'Register'),
        ],
      ),
    );
  }
}
