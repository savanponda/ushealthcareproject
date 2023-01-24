
import 'Data.dart';

class LocationModel {
    Data? data;

    LocationModel({this.data});

    factory LocationModel.fromJson(Map<String, dynamic> json) {
        return LocationModel(
            data: json['data'] != null ? Data.fromJson(json['data']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data!.toJson();
        }
        return data;
    }
}