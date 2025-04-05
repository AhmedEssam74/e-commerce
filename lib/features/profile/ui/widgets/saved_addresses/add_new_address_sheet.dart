import 'package:flutter/material.dart';
import '../../../../../../core/widgets/full_sheet_app_bar.dart';
import 'add_new_address_content.dart';

class AddNewAddressSheet extends StatelessWidget {
  const AddNewAddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
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
                title: 'Add New Address',
                subTitle: 'Fill in your address details below',
              ),
              AddNewAddressContent(),
            ],
          ),
        ),
      ),
    );
  }
}
