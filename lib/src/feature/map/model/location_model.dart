class LocationModel {
  double latitude;
  double longitude;
  String name;

  LocationModel({this.latitude = 0.0, this.longitude = 0.0, this.name = ''});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    return data;
  }
}
