import 'package:flutter/material.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class RoomsSection extends StatelessWidget {
  const RoomsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rooms',
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(10),
        SizedBox(
          height: 200,
          child: FractionallySizedBox(
            widthFactor: 1.1,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildRoomCard(),
            ),
          ),
        ),
       
      ],
    );
  }

  Stack _buildRoomCard() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              Assets.imagesRoom,
              width: 160,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
        _buildRoomNameCard()
      ],
    );
  }

  PositionedDirectional _buildRoomNameCard() {
    return PositionedDirectional(
        bottom: 15,
        start: 15,
        end: 25,
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xffbcb1a1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffD9D9D9), width: 1),
          ),
          child: Center(
            child: Text(
              'Living rooms',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font15WhiteBold,
            ),
          ),
        ),
      );
  }
}
