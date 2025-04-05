import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'product_stock_status_card.dart';
import 'product_color_selector.dart';
import 'product_details_buttons.dart';
import 'product_weight_and_dimensions.dart';
import 'product_review_list_view.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  const ProductDetailsInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductOverview(),
          verticalSpace(10),
          const ProductColorSelector(),
          verticalSpace(10),
          _buildDescriptionText(),
          verticalSpace(15),
          const ProductStockStatusCard(isAvailable: true),
          verticalSpace(20),
          const ProductWeightAndDimensions(),
          verticalSpace(20),
          const ProductReviewListView(),
          verticalSpace(20),
          const ProductDetailsButtons(),
        ],
      ),
    );
  }

  Widget _buildProductOverview() {
    return Column(
      children: [
        Center(
          child: Image.asset(
            Assets.imagesArrivalChair,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        verticalSpace(15),
        Row(
          children: [
            Expanded(
              child: Text(
                'Blush luxe chair',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font18BlackSemiBold,
              ),
            ),
            horizontalSpace(15),
            Text(
              '\$200.00',
              style: TextStyles.font20BlackBold,
            ),
          ],
        ),
      ],
    );
  }

  Text _buildDescriptionText() {
    return Text(
      'Lorem ipsum dolor sit amet consectetur. Nunc eget tortor sagittis sodales. Faucibus cursus sed at in. Lacus massa purus sit magna auctor. Turpis neque enim et morbi nunc aliquam. Amet justo id arcu in nec. Viverra varius congue malesuada penatibus lectus. Cursus cras adipiscing dui tellus sodales maecenas. In morbi ut et faucibus sem. Dis quisque eu adipiscing morbi enim donec. Eget.',
      style: TextStyles.font12GreyRegular,
    );
  }
}
