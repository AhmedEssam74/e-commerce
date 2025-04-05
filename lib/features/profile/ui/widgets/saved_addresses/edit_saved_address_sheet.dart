import 'package:ecommerce/features/profile/ui/widgets/saved_addresses/edit_saved_address_content.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/full_sheet_app_bar.dart';

class EditSavedAddressSheet extends StatelessWidget {
  const EditSavedAddressSheet({super.key});

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
                title: 'Edit Saved Address',
                subTitle: 'Update your address details below',
              ),
              EditSavedAddressContent(),
            ],
          ),
        ),
      ),
    );
  }
}
