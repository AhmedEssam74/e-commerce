import 'package:ecommerce/core/helpers/app_regex.dart';
import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/widgets/app_error_dialog.dart';
import 'package:ecommerce/core/widgets/app_loader.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/core/widgets/app_text_form_field.dart';
import 'package:ecommerce/core/widgets/app_toast_message.dart';
import 'package:ecommerce/core/widgets/phone_number_widget.dart';
import 'package:ecommerce/features/Auth/signup/cubit/signup_cubit.dart';
import 'package:ecommerce/features/Auth/signup/cubit/signup_states.dart';
import 'package:ecommerce/features/Auth/signup/data/repository/repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? fullPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(SignupRepoImpl()),
      child: BlocConsumer<SignupCubit, SignupStates>(
        listener: (context, state) {
          if (state is SignupLoadingState) {
            AppLoader.show(context);
          } else if (state is SignupErrorState) {
            AppErrorDialog.showErrorDialog(
              context,
              message: state.error,
              onConfirm: () {
                context.pop();
                context.pop();
              },
            );
          } else {
            AppToast.showSuccess("Account Created Successfully");
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.mainNavigationBar,
              predicate: (context) => false,
            );
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<SignupCubit>(context);
          return Form(
            key: formKey,
            child: Column(
              children: [
                AppTextFormField(
                  hintText: 'First Name',
                  controller: firstNameController,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(
                      Assets.svgsUser,
                      fit: BoxFit.contain,
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your first name';
                    }
                  },
                ),
                verticalSpace(15),
                AppTextFormField(
                  hintText: 'Last Name',
                  controller: lastNameController,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(
                      Assets.svgsUser,
                      fit: BoxFit.contain,
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your last name';
                    }
                  },
                ),
                verticalSpace(15),
                // PhoneNumberFormField(
                //   phoneController: phoneController,
                //   phoneValidator: (value) {
                //     if (value != null && value.isEmpty) {
                //       return "Please Inter Your Number";
                //     }
                //     if (AppRegex.isPhoneNumberValid(value) == false) {
                //       return "Please Enter A Valid Phone Number ";
                //     }
                //     return null;
                //   },
                // ),
                PhoneNumberWidget(
                  phoneNumberController: phoneController,
                  hintText: 'Phone Number',
                ),
                verticalSpace(15),
                AppTextFormField(
                  hintText: 'Email',
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      Assets.svgsEmail,
                      fit: BoxFit.contain,
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'please enter your email';
                    }
                    if (AppRegex.isEmailValid(value!) == false) {
                      return 'please enter a valid email';
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
                      return 'Please enter a password';
                    }
                    if (AppRegex.hasUpperCase(value) != true) {
                      return 'password should have upper case letter';
                    }
                    if (AppRegex.hasLowerCase(value) != true) {
                      return 'password should have lower case letter';
                    }
                    if (AppRegex.hasSpecialCharacter(value) != true) {
                      return 'password should have a special character ';
                    }
                    if (AppRegex.hasMinLength(value) != true) {
                      return 'password should ba at least 8 character length';
                    }
                    return null;
                  },
                ),
                verticalSpace(15),
                AppTextFormField(
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
                      return 'Please enter a password';
                    }
                    if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                verticalSpace(50),
                AppTextButton(
                  buttonText: 'Sign up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.signup(
                        firstNameController.text,
                        lastNameController.text,
                        phoneController.text,
                        // "+201100169696",
                        emailController.text,
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
