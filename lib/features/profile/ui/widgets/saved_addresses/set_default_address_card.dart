import 'package:flutter/material.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class SetDefaultAddressCard extends StatefulWidget {
  const SetDefaultAddressCard({super.key});

  @override
  State<SetDefaultAddressCard> createState() => _SetDefaultAddressCardState();
}

class _SetDefaultAddressCardState extends State<SetDefaultAddressCard> {
  bool isDefault = true;
  void toggleDefault() {
    setState(() {
      isDefault = !isDefault;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 15, top: 10, bottom: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey, width: 0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Save as default address', style: TextStyles.font14BlackMedium),
          Transform.scale(
            scale: 0.8,
            child: Switch.adaptive(
                activeColor: ColorsManager.mainGreen,
                inactiveTrackColor: ColorsManager.lightGreen,
                value: isDefault,
                onChanged: (value) {
                  toggleDefault();
                }),
          ),
        ],
      ),
    );
  }
}
