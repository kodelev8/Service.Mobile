import 'dart:convert';

EndPointServersModel endPointModelFromJson(String str) => EndPointServersModel.fromJson(json.decode(str));

String endPointModelToJson(EndPointServersModel data) => json.encode(data.toJson());

class EndPointServersModel {
  EndPointServersModel({
    this.id,
    this.servers,
    this.active,
  });

  String? id;
  Servers? servers;
  bool? active;

  factory EndPointServersModel.fromJson(Map<String, dynamic> json) => EndPointServersModel(
    id: json["_id"].toString(),
    servers: Servers.fromJson(json["Servers"]),
    active: json["Active"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Servers": servers?.toJson(),
    "Active": active,
  };
}

class Servers {
  Servers({
    this.server,
    this.user,
    this.werkgever,
    this.person,
    this.loonheffing,
    this.berekingen,
    this.belasting,
  });

  String? server;
  String? user;
  String? werkgever;
  String? person;
  String? loonheffing;
  String? berekingen;
  String? belasting;

  factory Servers.fromJson(Map<String, dynamic> json) => Servers(
    server: json["Server"],
    user: json["User"],
    werkgever: json["Werkgever"],
    person: json["Person"],
    loonheffing: json["Loonheffing"],
    berekingen: json["Berekingen"],
    belasting: json["Belasting"],
  );

  Map<String, dynamic> toJson() => {
    "Server": server,
    "User": user,
    "Werkgever": werkgever,
    "Person": person,
    "Loonheffing": loonheffing,
    "Berekingen": berekingen,
    "Belasting": belasting,
  };
}