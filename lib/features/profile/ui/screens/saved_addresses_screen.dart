import 'package:ecommerce/features/profile/ui/widgets/saved_addresses/add_new_address_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/secondary_appbar.dart';
import '../widgets/saved_addresses/saved_address_list_view.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Saved Addresses'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(10),
            const SavedAddressListView(),
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: AppTextButton(
          buttonText: 'Add New Address',
          onPressed: () {
             showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => const AddNewAddressSheet());
          },
        ),
      ),
    );
  }
}
