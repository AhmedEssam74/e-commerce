import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';

class OrderStatusStep extends StatelessWidget {
  const OrderStatusStep({
    super.key,
    required this.orderStatus,
    required this.date,
    required this.isActive,
    required this.isShowDots,
  });
  final String orderStatus, date;
  final bool isActive, isShowDots;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            if (isShowDots) _buildOrderDotList(),
            _buildOrderCheckIcon(),
          ],
        ),
        horizontalSpace(10),
        _buildOrderDetails(),
      ],
    );
  }

  Padding _buildOrderDotList() {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        children: List.generate(
            10,
            (index) => Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  width: 2,
                  height: 5,
                  color: ColorsManager.mainGreen,
                )),
      ),
    );
  }

  CircleAvatar _buildOrderCheckIcon() {
    return CircleAvatar(
      radius: 22,
      backgroundColor: ColorsManager.lightGreen,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: CircleAvatar(
          radius: 20,
          backgroundColor:
              isActive ? ColorsManager.mainGreen : const Color(0x40898121),
          child: Icon(
            Icons.check,
            color: isActive ? Colors.white : Colors.transparent,
          ),
        ),
      ),
    );
  }

  Column _buildOrderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order $orderStatus',
          style: TextStyles.font14BlackSemiBold,
        ),
        verticalSpace(6),
        Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedCalendar03,
              color: ColorsManager.grey,
              size: 20,
            ),
            horizontalSpace(8),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                date,
                style: TextStyles.font12GreySemiBold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
