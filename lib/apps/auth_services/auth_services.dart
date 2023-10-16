import 'dart:async';
import 'package:dio/dio.dart';
import 'package:UShealthcare/service/common_api_service.dart';
import 'package:UShealthcare/service/general_strings/appAPIs.dart';


class AuthService {
  ApiStructure service = ApiStructure();

//================= login Service ==========================//

  Future<dynamic> LoginServices({
    required String password,
    required String Email,
  }) async {
    return await service.commonApiService(
        endPoint: AppAPIs.signInUrl,
        serviceLabel: "Login Api",
        dataParameter: {
          "email": Email,
          "password": password,
        },
        isAuth: false,
        apiMethod: "post");
  }

//=================== Sign Up Services =========================//

  Future<dynamic> SignUpServices({
    required String firstName,
    required String middleName,
    required String lastName,
    required String birthDate,
     required String email,
    required String phoneNumber ,
    required String password,
    required String addressLine1,
    required String addressLine2,
     required double provinceOrStateId,
    required double cityId,
    required double genderId,
    required String postalOrZipCode,
    
  }) async {
    return await service.commonApiService(
      endPoint: AppAPIs.signUpUrl,
      serviceLabel: "Sign Up Service",
      dataParameter: {
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "birthDate": birthDate,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "provinceOrStateId": provinceOrStateId,
        "cityId": cityId,
        "genderId": genderId,
         "postalOrZipCode": postalOrZipCode,
      },
      isAuth: false,
      apiMethod: "post",
      isQueryParameter: false,
    );
  }

//=========================== Send Otp Service ========================//

//   Future<dynamic> SendOTPServices({
//     required String email,
//   }) async {
//     return await service.commonApiService(
//         endPoint: AppAPIs.sendOTP,
//         serviceLabel: "Send OTP",
//         dataParameter: {
//           "email": email,
//         },
//         isAuth: false,
//         isQueryParameter: false,
//         apiMethod: "post");
//   }

// //=========================== Verify Otp ===================================//

//   Future<dynamic> VerifyOTPServices({
//     required String email,
//     required String otp,
//   }) async {
//     return await service.commonApiService(
//         endPoint: AppAPIs.verifyOTP,
//         serviceLabel: "Verify OTP",
//         dataParameter: {
//           "email": email,
//           "otp": otp,
//         },
//         isAuth: false,
//         isQueryParameter: false,
//         apiMethod: "post");
//   }

//   //============================ Resend Password ===================================//

//   Future<dynamic> ResetPasswordServices({
//     required String userId,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     return await service.commonApiService(
//         endPoint: AppAPIs.resetPassword,
//         serviceLabel: "Reset Password",
//         dataParameter: FormData.fromMap({
//           "user_id": userId,
//           "password": password,
//           "c_password": confirmPassword,
//         }),
//         isAuth: false,
//         isQueryParameter: false,
//         apiMethod: "post");
//   }

//   //======================== Social Login ====================================//

//   Future<dynamic> socialLoginServices(
//       {required String email,
//      String? name,
//       String? googleId,
//       required String appleToken}) async {
//     return await service.commonApiService(
//         endPoint: AppAPIs.socialLogin,
//         serviceLabel: "Social Login",
//         dataParameter: FormData.fromMap({
//           "email": email,
//           "googleId": googleId,
//           "appleToken": appleToken,
//           "name":name
//         }),
//         isAuth: false,
//         isQueryParameter: false,
//         apiMethod: "post");
//   }
}
