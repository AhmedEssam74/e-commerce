import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/secondary_appbar.dart';
import 'package:ecommerce/features/profile/ui/widgets/privacy_policy/privacy_terms_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/privacy_policy/privacy_policy_content.dart';
import '../widgets/privacy_policy/terms_and_conditions_content.dart';

// ignore: must_be_immutable
class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Privacy Policy'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    PrivacyTermsTab(
                      onTabChanged: (int currentSelect) {
                        setState(() {
                          selectedTab = currentSelect;
                        });
                        HapticFeedback.selectionClick();
                      },
                    ),
                    verticalSpace(20),
                    selectedTab == 0
                        ? const PrivacyPolicyContent()
                        : const TermsAndConditionsContent(),
                  ],
                );
              }),
            ],
          ),
        ),
      )),
    );
  }
}
