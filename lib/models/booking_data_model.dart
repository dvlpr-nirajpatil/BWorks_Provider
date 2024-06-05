class BookingDataModel {
  String? customerId;
  String? status;
  Customer? customer;
  Service? service;
  String? providerId;
  String? id;
  String? docId;

  BookingDataModel(
      {this.customerId,
      this.status,
      this.customer,
      this.service,
      this.providerId});

  BookingDataModel.fromJson(Map<String, dynamic> json, id) {
    docId = id;
    customerId = json["customer_id"];
    id = json["id"];
    status = json["status"];
    customer =
        json["customer"] == null ? null : Customer.fromJson(json["customer"]);
    service =
        json["service"] == null ? null : Service.fromJson(json["service"]);
    providerId = json["provider_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["customer_id"] = customerId;
    _data["status"] = status;
    if (customer != null) {
      _data["customer"] = customer?.toJson();
    }

    if (service != null) {
      _data["service"] = service?.toJson();
    }
    _data["provider_id"] = providerId;
    return _data;
  }
}

class Service {
  String? dateTime;
  String? img;
  String? name;
  String? price;

  Service({this.dateTime, this.img, this.name, this.price});

  Service.fromJson(Map<String, dynamic> json) {
    dateTime = json["date_time"];
    img = json["img"];
    name = json["name"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date_time"] = dateTime;
    _data["img"] = img;
    _data["name"] = name;
    _data["price"] = price;
    return _data;
  }
}

class Customer {
  String? email;
  String? contactNo;
  String? id;
  String? name;
  String? address;

  Customer({this.email, this.contactNo, this.id, this.name, this.address});

  Customer.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    contactNo = json["contact_no"];
    id = json["id"];
    name = json["name"];
    address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["contact_no"] = contactNo;
    _data["id"] = id;
    _data["name"] = name;
    _data["address"] = address;
    return _data;
  }
}
