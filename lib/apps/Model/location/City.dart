class City {
    int? id;
    String? latitude;
    String? longitude;
    String? name;

    City({this.id, this.latitude, this.longitude, this.name});

    factory City.fromJson(Map<String, dynamic> json) {
        return City(
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
        return data;
    }
}