import 'City.dart';

class State {
    List<City>? cities;
    int? id;
    String? latitude;
    String? longitude;
    String? name;

    State({this.cities, this.id, this.latitude, this.longitude, this.name});

    factory State.fromJson(Map<String, dynamic> json) {
        return State(
            cities: json['cities'] != null ? (json['cities'] as List).map((i) => City.fromJson(i)).toList() : [],
            id: json['id']??0,
            latitude: json['latitude']??"0",
            longitude: json['longitude']??"0",
            name: json['name']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['latitude'] = this.latitude;
        data['longitude'] = this.longitude;
        data['name'] = this.name;
        if (this.cities != null) {
            data['cities'] = this.cities!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}