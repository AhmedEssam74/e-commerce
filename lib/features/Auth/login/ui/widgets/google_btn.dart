import 'package:ecommerce/core/constants/app_images.dart';
import 'package:ecommerce/features/Auth/login/cubit/google_cubit/google_cubit.dart';
import 'package:ecommerce/features/Auth/login/cubit/google_cubit/google_states.dart';
import 'package:ecommerce/features/Auth/login/data/repository/google_repo/repo_implementation.dart';
import 'package:ecommerce/features/Auth/login/ui/widgets/google_or_apple_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleCubit(GoogleRepoImpl()),
      child: BlocConsumer<GoogleCubit, GoogleLoginStates>(
        listener: (context, states) {},
        builder: (context, state) {
          var bloc = BlocProvider.of<GoogleCubit>(context);
          // var url = bloc.googleResponseModel?.googleLoginUrl;
          return GoogleOrAppleBtn(
            iconAsset: Assets.svgsGoogle,
            lableText: "Continue with Google",
            onTap: () async {
              bloc.loginWithGoogle();
              // await bloc.handleGoogleSignIn();
            },
          );
        },
      ),
    );
  }
}
