import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/app_error_dialog.dart';
import 'package:ecommerce/core/widgets/app_loader.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:ecommerce/core/widgets/phone_number_widget.dart';
import 'package:ecommerce/features/profile/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:ecommerce/features/profile/cubit/user_data_cubit/user_data_states.dart';
import 'package:ecommerce/features/profile/data/repository/user_data_repository/repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

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
    return BlocProvider(
      create: (context) =>
          GetUserDataCubit(GetUserDataRepoImpl())..getUserData(),
      child: BlocConsumer<GetUserDataCubit, GetUserDataStates>(
        listener: (context, state) {
          if (state is GetUserDataLoadingState) {
            AppLoader.show(context);
          } else if (state is GetUserDataErrorState) {
            AppErrorDialog.showErrorDialog(
              context,
              message: "Something went wrong with your data please try again",
              onConfirm: () {
                context.pop();
                context.pop();
              },
            );
          } else if (state is GetUserDataSuccessState) {
            // context.pop();
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<GetUserDataCubit>(context);
          return Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                Text('User Name', style: TextStyles.font14GreyMedium),
                verticalSpace(10),
                AppTextFormField(
                  controller: userNameController,
                  hintText:
                      '${bloc.userDataResponse?.firstName} ${bloc.userDataResponse?.lastName}',
                  validator: (value) {},
                ),
                verticalSpace(15),
                Text('Email', style: TextStyles.font14GreyMedium),
                verticalSpace(10),
                AppTextFormField(
                  controller: emailController,
                  hintText: '${bloc.userDataResponse?.email}',
                  validator: (value) {},
                ),
                verticalSpace(15),
                Text('Password', style: TextStyles.font14GreyMedium),
                verticalSpace(10),
                AppTextFormField(
                  controller: passwordController,
                  hintText: '********',
                  isReadOnly: true,
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
                // PhoneNumberFormField(
                //   phoneController: phoneController,
                //   isScrollPadding: true,
                // ),
                PhoneNumberWidget(
                  phoneNumberController: phoneController,
                  hintText:
                      '${bloc.userDataResponse?.phoneNumber?.substring(3)}',
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
        },
      ),
    );
  }
}
