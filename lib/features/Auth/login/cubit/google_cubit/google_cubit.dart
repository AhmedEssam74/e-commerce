import 'package:ecommerce/features/Auth/login/cubit/google_cubit/google_states.dart';
import 'package:ecommerce/features/Auth/login/data/models/google_response_model.dart';
import 'package:ecommerce/features/Auth/login/data/repository/google_repo/repo_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:url_launcher/url_launcher.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class GoogleCubit extends Cubit<GoogleLoginStates> {
  GoogleResponseModel? googleResponseModel;
  GoogleRepo repo;

  GoogleCubit(this.repo) : super(GoogleLoginInitState());

  void loginWithGoogle() async {
    try {
      emit(GoogleLoginLoadingState());
      googleResponseModel = await repo.googleLogin();
      await repo.openLink(googleResponseModel?.googleLoginUrl ?? "");
      emit(GoogleLoginSuccessState());
    } catch (e) {
      emit(GoogleLoginErrorState("Error with google"));
      debugPrint('$e');
    }
  }
  // static Future<void> openLink(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

// with packege  GoogleSignIn
// final GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'profile',
//   ],
// );
//
// Future<void> handleGoogleSignIn() async {
//   try {
//     final GoogleSignInAccount? account = await _googleSignIn.signIn();
//     if (account != null) {
//       final GoogleSignInAuthentication auth = await account.authentication;
//       final accessToken = auth.accessToken;
//       final idToken = auth.idToken;
//
//       print("✅ Access Token: $accessToken");
//       print("✅ ID Token: $idToken");
//
//       // Now send the token to your backend for verification/authentication
//     } else {
//       print("❌ User cancelled sign in");
//     }
//   } catch (error) {
//     print("❌ Google Sign-In failed: $error");
//   }
// }

  // _launchURL() async {
  //   const url = 'https://www.thiswebsite.com';
  //   final uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }


}
