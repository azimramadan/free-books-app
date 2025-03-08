import 'package:bookly_app/features/account/presentation/view/widgets/address_text_field.dart';
import 'package:bookly_app/features/account/presentation/view/widgets/dialog_buttons.dart';
import 'package:flutter/material.dart';

class EditAddressDialog extends StatelessWidget {
  const EditAddressDialog({super.key, this.controller, this.onPressed});
  final TextEditingController? controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      title: const Center(
        child: Text(
          'Edit Address',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      content: AddressTextField(controller: controller),
      actions: [DialogButtons(onPressed: onPressed)],
    );
  }
}
