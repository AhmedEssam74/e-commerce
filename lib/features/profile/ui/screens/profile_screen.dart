import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/helpers/token_storage.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/features/profile/ui/screens/language_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../widgets/profile/notification_settings_section.dart';
import '../widgets/profile/profile_support_section.dart';
import '../widgets/profile/profile_info_section.dart';
import '../widgets/profile/profile_options_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Profile'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(10),
                const ProfileInfoSection(),
                const ProfileOptionsSection(),
                const LanguageScreen(),
                const NotificationSettingsSection(),
                const ProfileSupportSection(),
                AppTextButton(
                  backgroundColor: ColorsManager.lightRed,
                  textStyle: TextStyles.font16MainGreenMedium
                      .copyWith(color: ColorsManager.red),
                  buttonText: 'Logout',
                  onPressed: () async {
                    final accessToken = await TokenStorage.getAccessToken();
                    final refreshToken = await TokenStorage.getAccessToken();
                    if (accessToken != null && accessToken.isNotEmpty ||
                        refreshToken != null && refreshToken.isNotEmpty) {
                      TokenStorage.deleteTokens();
                      context.pushNamedAndRemoveUntil(Routes.loginScreen,
                          predicate: (context) => false);
                    }
                  },
                ),
                verticalSpace(25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
