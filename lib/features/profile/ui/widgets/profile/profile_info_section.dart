import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/styles.dart';
import '../edit_profile_info/edit_profile_info_sheet.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.6),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => const EditProfileInfoSheet());
        },
        child: Row(
          children: [
            _buildUserAvatar(),
            horizontalSpace(10),
            _buildUserNameAndEmail(),
            horizontalSpace(10),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedPencilEdit02,
              color: ColorsManager.mainGreen,
              size: 28,
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar _buildUserAvatar() {
    return const CircleAvatar(
      radius: 30,
      backgroundColor: ColorsManager.mainGreen,
      child: HugeIcon(
        icon: HugeIcons.strokeRoundedUser,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Expanded _buildUserNameAndEmail() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jannis Schmitt',
            style: TextStyles.font14BlackMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(4),
          Text(
            'Jannis.schmitt123@email.com',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font14GreyRegular,
          ),
        ],
      ),
    );
  }

  // File? selectedImage;
  // Future<void> _pickImage(ImageSource source) async {
  //   try {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? xFile = await picker.pickImage(
  //       source: source,
  //       imageQuality: 80,
  //       maxWidth: 1024,
  //       maxHeight: 1024,
  //     );
  //     if (xFile != null) {
  //       selectedImage = File(xFile.path);
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     debugPrint('Error picking image: $e');
  //   }
  // }
}
