import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/styles.dart';

class LoginOptionsRow extends StatefulWidget {
  const LoginOptionsRow({super.key});

  @override
  State<LoginOptionsRow> createState() => _LoginOptionsRowState();
}

class _LoginOptionsRowState extends State<LoginOptionsRow> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // _buildKeepLoggedInCheckbox(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.forgotPasswordScreen);
          },
          child: Text(
            'Forget your password?',
            style: TextStyles.font12MainGreenSemiBold,
          ),
        ),
      ],
    );
  }

}
