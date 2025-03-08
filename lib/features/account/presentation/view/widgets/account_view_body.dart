import 'package:bookly_app/features/account/presentation/view/widgets/build_info_tile.dart';
import 'package:bookly_app/features/account/presentation/view/widgets/edit_address_dialog.dart';
import 'package:bookly_app/features/account/presentation/view/widgets/edit_log_out_buttons.dart';
import 'package:bookly_app/features/account/presentation/view/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  String address = 'No.23, James Street, New Town, North Province';
  final TextEditingController addressController = TextEditingController();

  void editAddress() {
    addressController.text = address;

    showDialog(
      context: context,
      builder: (context) {
        return EditAddressDialog(
          controller: addressController,
          onPressed: () {
            setState(() {
              address = addressController.text;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileAvatar(),
          const SizedBox(height: 20),
          buildInfoTile('Name', 'John Doe'),
          buildInfoTile('E-mail', 'johndoe123@mail.com'),
          buildInfoTile('Password', '********'),
          buildInfoTile('Address', address),
          const SizedBox(height: 20),
          EditLogoutButtons(editOnPressed: editAddress, logOutOnPressed: () {}),
        ],
      ),
    );
  }
}
