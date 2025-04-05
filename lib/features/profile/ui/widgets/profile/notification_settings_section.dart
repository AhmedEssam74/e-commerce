import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/theming/colors.dart';
import 'profile_option_card.dart';

class NotificationSettingsSection extends StatefulWidget {
  const NotificationSettingsSection({super.key});

  @override
  State<NotificationSettingsSection> createState() =>
      _NotificationSettingsSectionState();
}

class _NotificationSettingsSectionState
    extends State<NotificationSettingsSection> {
  bool isAllowed = true;
  void toggleNotification() {
    setState(() {
      isAllowed = !isAllowed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.6),
      ),
      child: Column(
        children: [
          ProfileOptionCard(
            icon: HugeIcons.strokeRoundedNotification02,
            title: 'Push Notifications',
            onTap: () {},
            isShowDivider: false,
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch.adaptive(
                  activeColor: ColorsManager.mainGreen,
                  inactiveTrackColor: ColorsManager.lightGreen,
                  value: isAllowed,
                  onChanged: (value) {
                    toggleNotification();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
