import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: ColorsManager.lightGreen,
      textColor: ColorsManager.mainGreen,
      fontSize: TextStyles.font12BlackBold.fontSize,
    );
  }
}
