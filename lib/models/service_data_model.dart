class ServiceDataModel {
  String? status;
  String? img;
  String? category;
  Time? time;
  String? price;
  String? providerId;
  String? type;
  String? name;
  String? docId;

  ServiceDataModel(
      {this.status,
      this.img,
      this.category,
      this.time,
      this.price,
      this.providerId,
      this.type,
      this.name});

  ServiceDataModel.fromJson(Map<String, dynamic> json, id) {
    docId = id;
    status = json["status"];
    img = json["img"];
    category = json["category"];
    time = json["time"] == null ? null : Time.fromJson(json["time"]);
    price = json["price"];
    providerId = json["provider_id"];
    type = json["type"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["img"] = img;
    _data["category"] = category;
    if (time != null) {
      _data["time"] = time?.toJson();
    }
    _data["price"] = price;
    _data["provider_id"] = providerId;
    _data["type"] = type;
    _data["name"] = name;
    return _data;
  }
}

class Time {
  String? min;
  String? hour;

  Time({this.min, this.hour});

  Time.fromJson(Map<String, dynamic> json) {
    min = json["min"];
    hour = json["hour"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["min"] = min;
    _data["hour"] = hour;
    return _data;
  }
}
