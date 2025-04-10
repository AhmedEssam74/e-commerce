import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/features/profile/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:ecommerce/features/profile/cubit/user_data_cubit/user_data_states.dart';
import 'package:ecommerce/features/profile/data/repository/user_data_repository/repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocProvider(
        create: (context) =>
            GetUserDataCubit(GetUserDataRepoImpl())..getUserData(),
        child: BlocConsumer<GetUserDataCubit, GetUserDataStates>(
          listener: (context, state) {
            if (state is GetUserDataLoadingState) {
            } else if (state is GetUserDataErrorState) {
            } else if (state is GetUserDataSuccessState) {}
          },
          builder: (context, state) {
            var bloc = BlocProvider.of<GetUserDataCubit>(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bloc.userDataResponse?.firstName == null ||
                          bloc.userDataResponse?.lastName == null
                      ? "user name"
                      : '${bloc.userDataResponse?.firstName} ${bloc.userDataResponse?.lastName}',
                  style: TextStyles.font14BlackMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Text(
                  bloc.userDataResponse?.email == null
                      ? "email@gmail.com"
                      : '${bloc.userDataResponse?.email}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14GreyRegular,
                ),
              ],
            );
          },
        ),
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
