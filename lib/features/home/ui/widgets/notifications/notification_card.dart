import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/widgets/delete_item_background.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.notificationText,
      required this.isNotificationViewed,
      required this.onDismissed});
  final String notificationText;
  final bool isNotificationViewed;
  final VoidCallback onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        onDismissed();
      },
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: const DeleteItemBackground(deleIconSize: 22),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 0.6),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  _buildNotificationIcon(),
                  horizontalSpace(10),
                  _buildNotificationText(),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: isNotificationViewed
                        ? Colors.transparent
                        : const Color(0xffE7B10A),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildNotificationIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x20898121),
      ),
      child: const HugeIcon(
        icon: HugeIcons.strokeRoundedNotification02,
        color: ColorsManager.mainGreen,
      ),
    );
  }

  Expanded _buildNotificationText() {
    return Expanded(
      child: Text(
        notificationText,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
