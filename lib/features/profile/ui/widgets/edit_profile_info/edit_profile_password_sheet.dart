import 'package:flutter/material.dart';
import '../../../../../../core/widgets/full_sheet_app_bar.dart';
import 'edit_profile_password_content.dart';

class EditUserPasswordSheet extends StatelessWidget {
  const EditUserPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height - 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FullSheetAppBar(
                title: 'Change Password',
                subTitle: 'Update your account’s password for security',
              ),
              EditProfilePasswordContent(),
            ],
          ),
        ),
      ),
    );
  }
}
