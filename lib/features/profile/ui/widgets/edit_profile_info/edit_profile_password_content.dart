import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
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

class _EditProfilePasswordContentState extends State<EditProfilePasswordContent> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
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

  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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
            },
          ),
          verticalSpace(20),
          AppTextButton(buttonText: 'Save Changes', onPressed: () {}),
        ],
      ),
    );
  }
}
