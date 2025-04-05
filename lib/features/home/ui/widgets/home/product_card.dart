import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/widgets/favorite_icon.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final bool isFavourite;
  final String category;
  final String name;
  final String price;
  final String rateCount;
  final bool isPadding;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.isFavourite,
    required this.category,
    required this.name,
    required this.price,
    required this.rateCount,
    this.isPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin:  EdgeInsetsDirectional.only(end:isPadding ? 10 : 0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageArea(),
         verticalSpace(10),
          Text(
            category,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyles.font12GreyRegular, 
          ),
       verticalSpace(2),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font12BlackSemiBold,
          ),
        verticalSpace(2),
          _buildPriceAndRating(),
        ],
      ),
    );
  }

  Widget _buildImageArea() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageUrl,
            width: 160,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        _buildFavouriteIcon(),
      ],
    );
  }

  Widget _buildFavouriteIcon() {
    return PositionedDirectional(
      top: 8,
      end: 8,
      child: FavoriteIcon(
        isFavourite: isFavourite,
      ),
    );
  }

  Widget _buildPriceAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$$price',
          style: TextStyles.font16BlackBold,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xffFFD33C),
              size: 22,
            ),
            const SizedBox(width: 2),
            Text(
              rateCount,
              style: TextStyles.font12BlackRegular,
            ),
          ],
        ),
      ],
    );
  }
}
