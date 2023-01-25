import 'Location.dart';

class Data {
    List<Location>? locationList;

    Data({this.locationList});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            locationList: json['locationList'] != null ? (json['locationList'] as List).map((i) => Location.fromJson(i)).toList() : [],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.locationList != null) {
            data['locationList'] = this.locationList!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}