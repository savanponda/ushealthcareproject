import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:onlinebia/apps/auth_services/auth_services.dart';
import 'package:onlinebia/service/api_manager/share_pref_key.dart';
import 'package:onlinebia/service/general_functions/toast_msg.dart';
import 'package:onlinebia/service/share_preference.dart';

class AuthProvider with ChangeNotifier {
  AuthService authService = AuthService();
  //======================== login Provider Function ============================//

  // UserModel? currentUser;
  Future<bool> LoginServiceFunction({
    required String password,
    required String Email,
  }) async {
    try {
      var temp =
          await authService.LoginServices(Email: Email, password: password);

      print("\n Login  Response In Provider============ $temp\n\n");

      if (temp["success"] == true) {
        showToast(message: temp["message"], isPositive: true);
        Shared_Preferences.prefSetString(
            SharedP.keyBearToken, temp["data"]["token"].toString());
        Shared_Preferences.prefSetString(
            SharedP.currentUserData, jsonEncode(temp["data"]["user"]));

        // currentUser = UserModel.fromMap(temp["data"]["user"]);

        return true;
      } else {
        showToast(message: temp["message"], isPositive: false);

        return false;
      }
    } catch (e) {
      bool hasInternet = await checkInternetConnectivity();
      if (hasInternet) {
        showToast(message: "Something went wrong", isPositive: false);
      } else {
        showToast(message: "no internet connection", isPositive: false);
      }
      return false;
    }
  }

  //================================ SignUp Provider Function ==============================//

  Future<bool> SignUpServiceFunction({
    required String firstName,
    required String middleName,
    required String lastName,
    required String birthDate,
    required String email,
    required String phoneNumber,
    required String password,
    required String addressLine1,
    required String addressLine2,
    required double provinceOrStateId,
    required double cityId,
    required double genderId,
    required String postalOrZipCode,
  }) async {
    try {
      var temp = await authService.SignUpServices(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        birthDate: birthDate,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        addressLine1: addressLine1,
        addressLine2: addressLine2,
        provinceOrStateId: provinceOrStateId,
        cityId: cityId,
        genderId: genderId,
        postalOrZipCode: postalOrZipCode,
      );
      print("\n Sign Up  Response In Provider============ $temp\n\n");

      if (temp["success"] == true) {
        // Shared_Preferences.prefSetString(
        //     SharedP.keyBearToken, temp["data"]["token"].toString());
        // Shared_Preferences.prefSetString(
        //     SharedP.currentUserData, jsonEncode(temp["data"]["user"]));
        showToast(message: temp["message"], isPositive: true);
        // currentUser = UserModel.fromMap(temp["data"]["user"]);
        notifyListeners();

        return true;
      } else {
        showToast(message:"something wrong in api", isPositive: false);

        return false;
      }
    } catch (e) {
      bool hasInternet = await checkInternetConnectivity();
      if (hasInternet) {
        showToast(message: "something went wrong", isPositive: false);
      } else {
        showToast(message: "no internet connection", isPositive: false);
      }
      return false;
    }
  }

  // //================================== Send Otp Provider Function ===================================//

  // Future<bool> SendOTPServicesFunction({required String email}) async {
  //   try {
  //     var response = await authService.SendOTPServices(email: email);

  //     print("====\n\n Send OTP In Provider  : $response");

  //     if (response["success"] == true) {
  //       showToast(message: Titles.otpSentMsg, isPositive: true);
  //       return true;
  //     } else {
  //       showToast(message: Titles.notFoundEmailMsg, isPositive: false);
  //       return false;
  //     }
  //   } catch (e) {
  //     print(
  //         "======\n\nError Resend Verification Link  In Provider    Provider :$e");
  //     bool hasInternet = await checkInternetConnectivity();
  //     if (hasInternet) {
  //       showToast(message: Titles.somethingWentWrong, isPositive: false);
  //     } else {
  //       showToast(message: Titles.noInternetConnection, isPositive: false);
  //     }
  //     return false;
  //   }
  // }

  // //================================ Verify Otp Provider Function ==============================//

  // String? userId;
  // Future<bool> verifyOTPServicesFunction({
  //   required String email,
  //   required String otp,
  // }) async {
  //   try {
  //     var response =
  //         await authService.VerifyOTPServices(email: email, otp: otp);

  //     print("====\n\n Verify OTP Response In Provider : $response");

  //     if (response["success"] == true) {
  //       if (response["message"] == "Otp Verification Successfully...") {
  //         userId = response["data"]["user"]["id"].toString();
  //         showToast(message: response["message"], isPositive: true);
  //         return true;
  //       } else {
  //         showToast(message: response["message"], isPositive: false);
  //         return false;
  //       }
  //     } else {
  //       showToast(
  //           message: response["data"]["error"].toString(), isPositive: false);
  //       return false;
  //     }
  //   } catch (e) {
  //     print("======\n\nError During Verify Otp Provider :$e");
  //     bool hasInternet = await checkInternetConnectivity();
  //     if (hasInternet) {
  //       showToast(
  //         message: Titles.somethingWentWrong,
  //         isPositive: false,
  //       );
  //     } else {
  //       showToast(message: Titles.noInternetConnection, isPositive: false);
  //     }
  //     return false;
  //   }
  // }

  // //=================================== Reset Password Provider Function ========================================//

  // Future<bool> ResetPasswordFunction(
  //     {required String userId,
  //     required String password,
  //     required String confirmPassword}) async {
  //   try {
  //     var response = await authService.ResetPasswordServices(
  //         confirmPassword: confirmPassword, password: password, userId: userId);

  //     print("====\n\n Reset Password Response In Provider : $response");

  //     if (response["success"] == true) {
  //       if (response["message"] == "Password Reset Successfully...") {
  //         Shared_Preferences.prefSetString(
  //             SharedP.keyBearToken, response["data"].toString());
  //         Shared_Preferences.prefSetString(
  //             SharedP.currentUserData, jsonEncode(response["data"]));
  //         return true;
  //       } else {
  //         showToast(message: response["failed."], isPositive: false);
  //         return false;
  //       }
  //     } else {
  //       showToast(message: Titles.somethingWentWrong, isPositive: false);
  //       return false;
  //     }
  //   } catch (e) {
  //     print("======\n\nError During Reset Password Provider :$e");
  //     bool hasInternet = await checkInternetConnectivity();
  //     if (hasInternet) {
  //       showToast(message: Titles.somethingWentWrong, isPositive: false);
  //     } else {
  //       showToast(message: Titles.noInternetConnection, isPositive: false);
  //     }
  //     return false;
  //   }
  // }

  // //================================== Social Login Function =============================//

  // String? appleToken;
  // Future<bool> socialLoginServiceFunction({
  //   String? googleId,
  //   required String email,
  //   required String appleToken,
  //   String? name,
  // }) async {
  //   try {
  //     var temp = await authService.socialLoginServices(
  //       email: email,
  //       googleId: googleId,
  //       appleToken: appleToken,
  //       name: name,
  //     );
  //     print("\n Social Login  Response In Provider============$temp\n\n");

  //     if (temp["success"] == true) {
  //       Shared_Preferences.prefSetString(
  //           SharedP.keyBearToken, temp["data"]["token"].toString());

  //       Shared_Preferences.prefSetString(
  //           SharedP.currentUserData, jsonEncode(temp["data"]["user"]));

  //       currentUser = UserModel.fromMap(temp["data"]["user"]);
  //       appleToken = temp["data"]["token"];
  //       showToast(message: temp["message"], isPositive: true);
  //       return true;
  //     } else {
  //       showToast(message: temp["message"], isPositive: false);
  //       return false;
  //     }
  //   } catch (e) {
  //     bool hasInternet = await checkInternetConnectivity();
  //     if (hasInternet) {
  //     } else {
  //       showToast(message: Titles.noInternetConnection, isPositive: false);
  //     }
  //     return false;
  //   }
  // }

  // //================================== Sign In With Apple ==================================//

  // Future<AuthorizationCredentialAppleID> signInWithApple(
  //     {List<Scope> scopes = const []}) async {
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

  //     return credential;
  //   } on PlatformException catch (e) {
  //     throw FirebaseAuthException(
  //       code: e.code,
  //       message: e.message!,
  //     );
  //   }
  // }

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
