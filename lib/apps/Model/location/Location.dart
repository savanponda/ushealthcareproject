import 'State.dart';

class Location {
    int? id;
    String? latitude;
    String? longitude;
    String? name;
    List<State>? states;

    Location({this.id, this.latitude, this.longitude, this.name, this.states});

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            id: json['id']??0,
            latitude: json['latitude']??"0",
            longitude: json['longitude']??"0",
            name: json['name']??"",
            states: json['states'] != null ? (json['states'] as List).map((i) => State.fromJson(i)).toList() : [],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['latitude'] = this.latitude;
        data['longitude'] = this.longitude;
        data['name'] = this.name;
        if (this.states != null) {
            data['states'] = this.states!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}