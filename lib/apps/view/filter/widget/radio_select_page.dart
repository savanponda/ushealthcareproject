class CityName {
  String? name;
  int? id;
  String? iconName;
  bool? isSelected;
  bool? show;

  CityName({this.name, this.id, this.iconName, this.isSelected, this.show=false});

  factory CityName.fromJson(Map<String, dynamic> json) {
    return CityName(
      name: json['name']??"",
      id: json['id']??0,
      iconName: json['iconName']??"",

      isSelected: json['isSelected']??true,
      show: json['show']??false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['iconName'] = this.iconName;

    data['isSelected'] = this.isSelected;
    data['show'] = this.show;
    return data;
  }
}