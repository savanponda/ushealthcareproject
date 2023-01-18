class ProfileData {
    int? select;
    String icon;
    String title;

    ProfileData({required this.select, required this.icon, required this.title});

    factory ProfileData.fromJson(Map<String, dynamic> json) {
        return ProfileData(
            select: json['select'],
            icon: json['icon'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['select'] = this.select;
        data['icon'] = this.icon;
        data['title'] = this.title;
        return data;
    }
}