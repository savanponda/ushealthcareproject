import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:UShealthcare/service/api_manager/share_pref_key.dart';
import 'package:UShealthcare/service/general_functions/toast_msg.dart';
import 'package:UShealthcare/service/general_strings/appAPIs.dart';
import 'package:UShealthcare/service/share_preference.dart';

class ApiStructure {
  //common Structure For Api Calling

  Future<dynamic> commonApiService({
    dynamic dataParameter,
    required String endPoint,
    required String serviceLabel,
    required String apiMethod,
    bool isAuth = false,
    bool isQueryParameter = false,
  }) async {
    try {
      var data;

      if (dataParameter != null) {
        data = dataParameter;
      }

      var refreshToken = "";

      var bearerToken =
          await Shared_Preferences.prefGetString(SharedP.keyBearToken, "");
      // print("======BEAR TOKEN===========${bearerToken}");

      var options = isAuth
          ? Options(
              headers: <String, String>{
                "X-Requested-With": "XMLHttpRequest",
                "Accept": "application/json",
                "Authorization": "Bearer " + bearerToken
              },
            )
          : serviceLabel == "Refresh"
              ? Options(
                  headers: <String, String>{
                    "X-Requested-With": "XMLHttpRequest",
                    "Accept": "application/json",
                    "Cookie": refreshToken
                  },
                )
              : Options(
                  headers: <String, String>{
                    "X-Requested-With": "XMLHttpRequest",
                    "Accept": "application/json",
                  },
                  contentType: "Application/json",
                  receiveDataWhenStatusError: false,
                  validateStatus: (_) => true,
                );

      print("\n\n============== Url  :  ${AppAPIs.BASEURL + endPoint}");

      Response response;

      if (!isQueryParameter) {
        if (apiMethod == "post") {
          response = await Dio().postUri(
            Uri.parse(AppAPIs.BASEURL + endPoint),
            data: data,
            options: options,
          );
        } else if (apiMethod == "put") {
          response = await Dio().putUri(
            Uri.parse(AppAPIs.BASEURL + endPoint),
            data: data,
            options: options,
          );
        } else {
          response = await Dio().getUri(
            Uri.parse(AppAPIs.BASEURL + endPoint),
            options: options,
          );
        }
      } else {
        response = await Dio().get(AppAPIs.BASEURL + endPoint,
            options: options,
            queryParameters:
                data != null ? (data as Map<String, dynamic>) : null);
      }

      print(
          "\n\n==============Can Response New   $serviceLabel :  ${response.data}");

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        return response.data;
      }
    } on DioError catch (e) {
      print("\n\n============== Dio Error During $serviceLabel :${e.response}");
      if (e.response != null && e.response != "") {
        if (e.response!.data["error"] != null) {
          showToast(
              message: e.response!.data["error"]
                  [(e.response!.data["error"].keys.toList()[0])][0],
              isPositive: false);
        } else {
          showToast(
              message: e.response!.data["data"]["error"]
                  [(e.response!.data["data"]["error"].keys.toList()[0])][0],
              isPositive: false);
        }
      }
    } catch (e) {
      print("\n\n===== Error During $serviceLabel :${e.toString()}  ");
      ConnectivityResult result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none) {
        showToast(message: "No Internet Connection", isPositive: false);
      } else {
        showToast(message:"No Internet Connection", isPositive: false);
      }
    }
  }
}
