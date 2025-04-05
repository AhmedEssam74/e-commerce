import 'package:flutter/material.dart';
import '../../../../../core/widgets/full_sheet_app_bar.dart';
import 'all_reviews_sheet_list_view.dart';

class AllReviewsSheet extends StatelessWidget {
  const AllReviewsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
       height: MediaQuery.sizeOf(context).height*0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FullSheetAppBar(
            title: 'Reviews',
            subTitle: 'Read more about product reviews',
          ),
          AllReviewsSheetListView(),
        ],
      ),
    );
  }
}
