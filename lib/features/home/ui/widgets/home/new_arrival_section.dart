import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/favorite_icon.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New arrivals',
          style: TextStyles.font16BlackBold,
        ),
        FractionallySizedBox(
          widthFactor: 1.1,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 2,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.pushNamed(Routes.productDetailsScreen);
              },
              child: _buildNewArrivalCard(
                imageUrl: Assets.imagesArrivalChair,
                title: 'Rustic Haven set',
                description:
                    'Elevate your living space with the timeless elegance and comfort to your space',
                price: '230.00',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Stack _buildNewArrivalCard(
      {required String imageUrl,
      required String title,
      required String price,
      required String description}) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
        ),
        _buildFavouriteIcon(isFavourite: false),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyles.font16BlackBold,
                    ),
                  ),
                  horizontalSpace(15),
                  Text(
                    '\$$price',
                    style: TextStyles.font16BlackBold,
                  ),
                ],
              ),
              verticalSpace(5),
              Text(
                description,
                style: TextStyles.font12BlackRegular,
              )
            ],
          ),
        )
      ],
    );
  }

  PositionedDirectional _buildFavouriteIcon({required bool isFavourite}) {
    return PositionedDirectional(
      top: 25,
      end: 15,
      child: FavoriteIcon(isFavourite: isFavourite),
    );
  }
}
