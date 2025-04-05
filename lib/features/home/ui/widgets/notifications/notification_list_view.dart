import 'package:ecommerce/features/home/ui/widgets/notifications/no_notifications_widget.dart';
import 'package:flutter/material.dart';

import 'notification_card.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Visibility(
      visible: true,
      replacement: const NoNotificationsWidget(),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => NotificationCard(
          isNotificationViewed: false,
          notificationText:
              'Love modern décor? Check out these top picks we think you\'ll adore',
          onDismissed: () {},
        ),
      ),
    ));
  }
}
