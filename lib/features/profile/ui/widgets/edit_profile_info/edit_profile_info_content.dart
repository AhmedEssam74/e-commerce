import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:ecommerce/core/widgets/phone_number_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import 'edit_profile_password_sheet.dart';

class EditProfileInfoContent extends StatefulWidget {
  const EditProfileInfoContent({super.key});

  @override
  State<EditProfileInfoContent> createState() => _EditProfileInfoContentState();
}

class _EditProfileInfoContentState extends State<EditProfileInfoContent> {
  final TextEditingController userNameController =
      TextEditingController(text: 'Jannis Schmitt');

  final TextEditingController emailController =
      TextEditingController(text: 'jannis.shmitt123@email.com');

  final TextEditingController passwordController =
      TextEditingController(text: '123456789');

  final TextEditingController phoneController =
      TextEditingController(text: '1023960182');
@override
  void dispose() {
   userNameController.dispose();
   emailController.dispose();
   passwordController.dispose();
   phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(10),
          Text('User Name', style: TextStyles.font14GreyMedium),
          verticalSpace(10),
          AppTextFormField(
            controller: userNameController,
            hintText: 'Jannis Schmitt',
            validator: (value) {},
          ),
          verticalSpace(15),
          Text('Email', style: TextStyles.font14GreyMedium),
          verticalSpace(10),
          AppTextFormField(
            controller: emailController,
            hintText: 'jannis.shmitt123@email.com',
            validator: (value) {},
          ),
          verticalSpace(15),
          Text('Password', style: TextStyles.font14GreyMedium),
          verticalSpace(10),
          AppTextFormField(
            controller: passwordController,
            hintText: '123456789',
            validator: (value) {},
            isObscureText: true,
            suffixIcon: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => const EditUserPasswordSheet());
              },
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedPencilEdit02,
                color: ColorsManager.mainGreen,
                size: 22,
              ),
            ),
          ),
          verticalSpace(15),
          Text('Phone Number', style: TextStyles.font14GreyMedium),
          verticalSpace(10),
          PhoneNumberFormField(
            phoneController: phoneController,
            isScrollPadding: true,
          ),
          verticalSpace(25),
          AppTextButton(buttonText: 'Save Changes', onPressed: () {}),
          verticalSpace(15),
          AppTextButton(
            backgroundColor: ColorsManager.lightRed,
            textStyle: TextStyles.font16MainGreenMedium
                .copyWith(color: ColorsManager.red),
            buttonText: 'Delete Account',
            onPressed: () {},
          ),
          verticalSpace(25),
        ],
      ),
    );
  }
}
