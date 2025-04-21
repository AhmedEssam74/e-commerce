import 'package:ecommerce/core/helpers/navigation_extension.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "choose your language",
              style: TextStyles.font16BlackBold,
            ),
            content: SizedBox(
              height: MediaQuery.sizeOf(context).height - 568,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(14.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreen,
                      border: Border.all(color: Colors.grey, width: 0.6),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Text("English"),
                  ),
                  verticalSpace(12),
                  Container(
                    padding: EdgeInsets.all(14.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreen,
                      border: Border.all(color: Colors.grey, width: 0.6),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Text("German"),
                  ),
                  verticalSpace(12),
                  Container(
                    padding: EdgeInsets.all(14.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreen,
                      border: Border.all(color: Colors.grey, width: 0.6),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Text("Arabic"),
                  ),
                  verticalSpace(12),
                  Container(
                    padding: EdgeInsets.all(14.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreen,
                      border: Border.all(color: Colors.grey, width: 0.6),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Text("Ukrainian"),
                  ),
                  verticalSpace(12),
                  Container(
                    padding: EdgeInsets.all(14.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGreen,
                      border: Border.all(color: Colors.grey, width: 0.6),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Text("Kurdish"),
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      // style: const ButtonStyle(
                      //   backgroundColor:
                      //       WidgetStatePropertyAll(ColorsManager.lightRed),
                      // ),
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Set',
                        style: TextStyles.font14BlackRegular,
                      ),
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorsManager.lightRed),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'close',
                        style: TextStyles.font14BlackRegular,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 0.6),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: ColorsManager.lightGreen,
                  child: HugeIcon(
                      icon: HugeIcons.strokeRoundedLanguageCircle,
                      color: ColorsManager.mainGreen),
                ),
                // horizontalSpace(2),
                // SizedBox(
                //   child: DropdownMenu(
                //     inputDecorationTheme: InputDecorationTheme(
                //       labelStyle: TextStyles.font14BlackSemiBold,
                //       suffixIconColor: Colors.transparent,
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.r),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 2,
                //         ),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.r),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 2,
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.r),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 2,
                //         ),
                //       ),
                //     ),
                //     menuStyle: const MenuStyle(
                //       elevation: WidgetStatePropertyAll(0),
                //       backgroundColor:
                //           WidgetStatePropertyAll(ColorsManager.mainGreen),
                //     ),
                //     textStyle: TextStyles.font14BlackSemiBold,
                //     controller: TextEditingController(
                //       text: () {
                //         switch (context.locale.languageCode) {
                //           case 'en':
                //             return 'english'.tr();
                //           case 'ar':
                //             return 'arabic'.tr();
                //           case 'de':
                //             return 'german'.tr();
                //           default:
                //             return context.locale.languageCode;
                //         }
                //       }(),
                //     ),
                //     width: 180.w,
                //     enableSearch: false,
                //     onSelected: (value) {
                //       if (value == "ar") {
                //         context.setLocale(
                //           const Locale('ar'),
                //         );
                //       } else if (value == 'en') {
                //         context.setLocale(
                //           const Locale('en'),
                //         );
                //       } else if (value == 'de') {
                //         context.setLocale(
                //           const Locale('de'),
                //         );
                //       }
                //     },
                //     dropdownMenuEntries: [
                //       DropdownMenuEntry(
                //         label: "english".tr(),
                //         value: "en",
                //       ),
                //       DropdownMenuEntry(
                //         label: "arabic".tr(),
                //         value: "ar",
                //       ),
                //       DropdownMenuEntry(
                //         label: "german".tr(),
                //         value: "de",
                //       ),
                //     ],
                //   ),
                // ),
                horizontalSpace(14),
                Text(
                  "Language",
                  style: TextStyles.font14BlackSemiBold,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
