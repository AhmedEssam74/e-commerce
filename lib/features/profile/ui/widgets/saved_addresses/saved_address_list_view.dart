import 'package:ecommerce/features/profile/ui/widgets/saved_addresses/edit_saved_address_sheet.dart';
import 'package:flutter/material.dart';
import 'no_saved_address_widget.dart';
import 'saved_address_card.dart';

class SavedAddressListView extends StatelessWidget {
  const SavedAddressListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: true,
        replacement: const NoSavedAddressesWidget(),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => SavedAddressCard(
            address: 'Building Name Street name',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (_) => const EditSavedAddressSheet(),
              );
            },
          ),
        ),
      ),
    );
  }
}
