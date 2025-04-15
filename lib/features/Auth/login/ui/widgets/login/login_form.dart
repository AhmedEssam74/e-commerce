import 'package:ecommerce/core/helpers/app_regex.dart';
import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/widgets/app_error_dialog.dart';
import 'package:ecommerce/core/widgets/app_loader.dart';
import 'package:ecommerce/core/widgets/app_text_button.dart';
import 'package:ecommerce/core/widgets/app_toast_message.dart';
import 'package:ecommerce/features/Auth/login/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerce/features/Auth/login/cubit/login_cubit/login_states.dart';
import 'package:ecommerce/features/Auth/login/data/repository/login_repo/repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_images.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import 'login_options_row.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordObscureText = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            AppLoader.show(context);
          } else if (state is LoginErrorState) {
            AppErrorDialog.showErrorDialog(
              context,
              message: "Email or password is not correct",
              onConfirm: () {
                context.pop();
                context.pop();
              },
            );
          } else {
            AppToast.showSuccess("successfully logged in");
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.mainNavigationBar,
                predicate: (context) => false);
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<LoginCubit>(context);
          return Form(
            key: formKey,
            child: Column(
              children: [
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
                      return 'Please enter your email';
                    }
                    if (AppRegex.isEmailValid(value ?? "") == false) {
                      return "please enter valid email";
                    }
                    return null;
                  },
                ),
                verticalSpace(15),
                AppTextFormField(
                  isObscureText: isPasswordObscureText,
                  controller: passwordController,
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
                      padding: EdgeInsets.all(12.0.r),
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
                      return 'Please enter Your password';
                    }
                    // if (AppRegex.isPasswordValid(value) != true) {
                    //   return "please enter valid Password";
                    // }
                    return null;
                  },
                ),
                verticalSpace(20),
                const LoginOptionsRow(),
                verticalSpace(25),
                AppTextButton(
                  buttonText: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      bloc.login(emailController.text, passwordController.text);
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
