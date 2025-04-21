import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/widgets/app_error_dialog.dart';
import 'package:ecommerce/core/widgets/app_loader.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:ecommerce/core/widgets/app_toast_message.dart';
import 'package:ecommerce/features/profile/cubit/change_password_cubit/change_password_cubit.dart';
import 'package:ecommerce/features/profile/cubit/change_password_cubit/change_password_states.dart';
import 'package:ecommerce/features/profile/data/repository/change_password_repository/repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/constants/app_images.dart';
import '../../../../../../core/helpers/app_regex.dart';
import '../../../../Auth/login/ui/widgets/forgot_password/password_validations.dart';

class EditProfilePasswordContent extends StatefulWidget {
  const EditProfilePasswordContent({super.key});

  @override
  State<EditProfilePasswordContent> createState() =>
      _EditProfilePasswordContentState();
}

class _EditProfilePasswordContentState
    extends State<EditProfilePasswordContent> {
  bool isCurrentPasswordObscureText = true;
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    // passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(ChangePasswordRepoImpl()),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordStates>(
        listener: (context, state) {
          if (state is ChangePasswordLoadingState) {
            AppLoader.show(context);
          } else if (state is ChangePasswordErrorState) {
            AppErrorDialog.showErrorDialog(
              context,
              message: state.error,
              onConfirm: () {
                context.pop();
                context.pop();
              },
            );
          } else if (state is ChangePasswordSuccessState) {
            AppToast.showSuccess("Password updated Successfully");
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              predicate: (context) => false,
            );
            TokenStorage.deleteTokens();
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<ChangePasswordCubit>(context);
          return Form(
            key: formKey,
            child: Column(
              children: [
                verticalSpace(15),
                AppTextFormField(
                  controller: oldPasswordController,
                  isObscureText: isCurrentPasswordObscureText,
                  hintText: 'Current Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      Assets.svgsLock,
                      fit: BoxFit.contain,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCurrentPasswordObscureText =
                            !isCurrentPasswordObscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        isCurrentPasswordObscureText
                            ? Assets.svgsEyeClosed
                            : Assets.svgsEyeOpen,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (AppRegex.isPasswordValid(value) != true) {
                      return "Please enter a valid password";
                    }
                  },
                ),
                verticalSpace(15),
                AppTextFormField(
                  controller: passwordController,
                  isObscureText: isPasswordObscureText,
                  hintText: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      Assets.svgsLock,
                      fit: BoxFit.contain,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordObscureText = !isPasswordObscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        isPasswordObscureText
                            ? Assets.svgsEyeClosed
                            : Assets.svgsEyeOpen,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                    if (AppRegex.isPasswordValid(value) != true) {
                      return "Please enter a valid password";
                    }
                    if (passwordController.text == oldPasswordController.text) {
                      return "new and current password are the same";
                    }
                  },
                ),
                verticalSpace(15),
                PasswordValidations(
                  hasLowerCase: hasLowerCase,
                  hasUpperCase: hasUpperCase,
                  hasSpecialCharacter: hasSpecialCharacter,
                  hasNumber: hasNumber,
                  hasMinLength: hasMinLength,
                ),
                verticalSpace(15),
                AppTextFormField(
                  isScrollPadding: true,
                  isObscureText: isPasswordConfirmationObscureText,
                  hintText: 'Confirm Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      Assets.svgsLock,
                      fit: BoxFit.contain,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordConfirmationObscureText =
                            !isPasswordConfirmationObscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        isPasswordConfirmationObscureText
                            ? Assets.svgsEyeClosed
                            : Assets.svgsEyeOpen,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid confirmation password';
                    }
                    if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                AppTextButton(
                  buttonText: 'Save Changes',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.changePassword(
                        oldPasswordController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
