import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/helpers/auth_status_handler.dart';
import 'package:ecommerce/core/networking/cubit_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AuthStatusHandler.checkUserLoginStatus();
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      // startLocale: const Locale('en'),
      child: EcommerceApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
