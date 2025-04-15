import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:ecommerce/core/widgets/favorite_icon.dart';
import 'package:ecommerce/features/search/data/models/search_response_model.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SearchProductItem extends StatelessWidget {
  final Product products;
  final ProductImage? images;

  const SearchProductItem({super.key, required this.products, this.images});

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNewArrivalCard(
          imageUrl: products.images?[0].img ?? "",
          // imageUrl: Assets.imagesArrivalChair,
          title: products.name ?? "",
          description: products.description ?? "",
          price: products.price ?? "",
        ),
        // Text(
        //   'New arrivals',
        //   style: TextStyles.font16BlackBold,
        // ),
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
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: ColorsManager.mainGreen,
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(HugeIcons.strokeRoundedImage02),
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            // child: Image.asset(
            //   imageUrl,
            //   height: 300,
            //   width: double.infinity,
            //   fit: BoxFit.fill,
            // ),
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
