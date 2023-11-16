// To parse this JSON data, do
//
//     final werkgever = werkgeverFromJson(jsonString);

import 'dart:convert';

List<Werkgever> werkgeverFromJson(String str) =>
    List<Werkgever>.from(json.decode(str).map((x) => Werkgever.fromJson(x)));

String werkgeverToJson(List<Werkgever> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Werkgever {
  Werkgever({
    this.collectieve,
    this.id,
    this.klant,
    required this.naam,
    this.sector,
    required this.fiscaalNummer,
    this.loonheffingenExtentie,
    this.omzetbelastingExtentie,
    this.whkPremies,
    this.datumActiefVanaf,
    this.datumActiefTot,
    this.dateCreated,
    this.dateLastModified,
    this.actief,
  });

  List<Collectieve>? collectieve;
  String? id;
  Klant? klant;
  String naam;
  int? sector;
  String fiscaalNummer;
  String? loonheffingenExtentie;
  String? omzetbelastingExtentie;
  List<WhkPremy>? whkPremies;
  DateTime? datumActiefVanaf;
  DateTime? datumActiefTot;
  DateTime? dateCreated;
  DateTime? dateLastModified;
  bool? actief;

  factory Werkgever.fromJson(Map<String, dynamic> json) => Werkgever(
        collectieve: List<Collectieve>.from(
            json["collectieve"].map((x) => Collectieve.fromJson(x))),
        id: json["id"],
        klant: Klant.fromJson(json["klant"]),
        naam: json["naam"],
        sector: json["sector"],
        fiscaalNummer: json["fiscaalNummer"],
        loonheffingenExtentie: json["loonheffingenExtentie"],
        omzetbelastingExtentie: json["omzetbelastingExtentie"],
        whkPremies: List<WhkPremy>.from(
            json["whkPremies"].map((x) => WhkPremy.fromJson(x))),
        datumActiefVanaf: DateTime.parse(json["datumActiefVanaf"]),
        datumActiefTot: DateTime.parse(json["datumActiefTot"]),
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateLastModified: DateTime.parse(json["dateLastModified"]),
        actief: json["actief"],
      );

  Map<String, dynamic> toJson() => {
        "collectieve": List<dynamic>.from(collectieve!.map((x) => x.toJson())),
        "id": id,
        "klant": klant?.toJson(),
        "naam": fiscaalNummerValues.reverse[naam],
        "sector": sector,
        "fiscaalNummer": fiscaalNummerValues.reverse[fiscaalNummer],
        "loonheffingenExtentie": loonheffingenExtentie,
        "omzetbelastingExtentie": omzetbelastingExtentie,
        "whkPremies": List<dynamic>.from(whkPremies!.map((x) => x.toJson())),
        "datumActiefVanaf": datumActiefVanaf?.toIso8601String(),
        "datumActiefTot": datumActiefTot?.toIso8601String(),
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
        "actief": actief,
      };
}

class Collectieve {
  Collectieve({
    this.taxNo,
    this.periode,
    this.processedDate,
    this.collectieveType,
    this.totLnLbPh,
    this.totLnSv,
    this.totPrlnAofAnwLg,
    this.totPrlnAofAnwHg,
    this.totPrlnAofAnwUit,
    this.totPrlnAwfAnwLg,
    this.totPrlnAwfAnwHg,
    this.totPrlnAwfAnwHz,
    this.prLnUfo,
    this.ingLbPh,
    this.ehPubUitk,
    this.ehGebrAuto,
    this.ehVut,
    this.ehOvsFrfWrkkstrg,
    this.avZeev,
    this.vrlAvso,
    this.totPrAofLg,
    this.totPrAofHg,
    this.totPrAofUit,
    this.totOpslWko,
    this.totPrGediffWhk,
    this.totPrAwfLg,
    this.totPrAwfHg,
    this.totPrAwfHz,
    this.prUfo,
    this.ingBijdrZvw,
    this.totWghZvw,
    this.totTeBet,
    this.totGen,
    this.saldoCorrectiesVoorgaandTijdvak,
  });

  FiscaalNummer? taxNo;
  String? periode;
  DateTime? processedDate;
  CollectieveType? collectieveType;
  double? totLnLbPh;
  double? totLnSv;
  double? totPrlnAofAnwLg;
  double? totPrlnAofAnwHg;
  double? totPrlnAofAnwUit;
  double? totPrlnAwfAnwLg;
  double? totPrlnAwfAnwHg;
  double? totPrlnAwfAnwHz;
  double? prLnUfo;
  double? ingLbPh;
  double? ehPubUitk;
  double? ehGebrAuto;
  double? ehVut;
  double? ehOvsFrfWrkkstrg;
  double? avZeev;
  double? vrlAvso;
  double? totPrAofLg;
  double? totPrAofHg;
  double? totPrAofUit;
  double? totOpslWko;
  double? totPrGediffWhk;
  double? totPrAwfLg;
  double? totPrAwfHg;
  double? totPrAwfHz;
  double? prUfo;
  double? ingBijdrZvw;
  double? totWghZvw;
  double? totTeBet;
  double? totGen;
  List<SaldoCorrectiesVoorgaandTijdvak>? saldoCorrectiesVoorgaandTijdvak;

  factory Collectieve.fromJson(Map<String, dynamic> json) => Collectieve(
        taxNo: fiscaalNummerValues.map[json["taxNo"]],
        periode: json["periode"],
        processedDate: DateTime.parse(json["processedDate"]),
        collectieveType: collectieveTypeValues.map[json["collectieveType"]],
        totLnLbPh: json["totLnLbPh"],
        totLnSv: json["totLnSv"],
        totPrlnAofAnwLg: json["totPrlnAofAnwLg"],
        totPrlnAofAnwHg: json["totPrlnAofAnwHg"],
        totPrlnAofAnwUit: json["totPrlnAofAnwUit"],
        totPrlnAwfAnwLg: json["totPrlnAwfAnwLg"],
        totPrlnAwfAnwHg: json["totPrlnAwfAnwHg"],
        totPrlnAwfAnwHz: json["totPrlnAwfAnwHz"],
        prLnUfo: json["prLnUfo"],
        ingLbPh: json["ingLbPh"],
        ehPubUitk: json["ehPubUitk"],
        ehGebrAuto: json["ehGebrAuto"],
        ehVut: json["ehVut"],
        ehOvsFrfWrkkstrg: json["ehOvsFrfWrkkstrg"],
        avZeev: json["avZeev"],
        vrlAvso: json["vrlAvso"],
        totPrAofLg: json["totPrAofLg"],
        totPrAofHg: json["totPrAofHg"],
        totPrAofUit: json["totPrAofUit"],
        totOpslWko: json["totOpslWko"],
        totPrGediffWhk: json["totPrGediffWhk"],
        totPrAwfLg: json["totPrAwfLg"],
        totPrAwfHg: json["totPrAwfHg"],
        totPrAwfHz: json["totPrAwfHz"],
        prUfo: json["prUfo"],
        ingBijdrZvw: json["ingBijdrZvw"],
        totWghZvw: json["totWghZvw"],
        totTeBet: json["totTeBet"],
        totGen: json["totGen"],
        saldoCorrectiesVoorgaandTijdvak:
            List<SaldoCorrectiesVoorgaandTijdvak>.from(
                json["saldoCorrectiesVoorgaandTijdvak"]
                    .map((x) => SaldoCorrectiesVoorgaandTijdvak.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "taxNo": fiscaalNummerValues.reverse[taxNo],
        "periode": periode,
        "processedDate": processedDate?.toIso8601String(),
        "collectieveType": collectieveTypeValues.reverse[collectieveType],
        "totLnLbPh": totLnLbPh,
        "totLnSv": totLnSv,
        "totPrlnAofAnwLg": totPrlnAofAnwLg,
        "totPrlnAofAnwHg": totPrlnAofAnwHg,
        "totPrlnAofAnwUit": totPrlnAofAnwUit,
        "totPrlnAwfAnwLg": totPrlnAwfAnwLg,
        "totPrlnAwfAnwHg": totPrlnAwfAnwHg,
        "totPrlnAwfAnwHz": totPrlnAwfAnwHz,
        "prLnUfo": prLnUfo,
        "ingLbPh": ingLbPh,
        "ehPubUitk": ehPubUitk,
        "ehGebrAuto": ehGebrAuto,
        "ehVut": ehVut,
        "ehOvsFrfWrkkstrg": ehOvsFrfWrkkstrg,
        "avZeev": avZeev,
        "vrlAvso": vrlAvso,
        "totPrAofLg": totPrAofLg,
        "totPrAofHg": totPrAofHg,
        "totPrAofUit": totPrAofUit,
        "totOpslWko": totOpslWko,
        "totPrGediffWhk": totPrGediffWhk,
        "totPrAwfLg": totPrAwfLg,
        "totPrAwfHg": totPrAwfHg,
        "totPrAwfHz": totPrAwfHz,
        "prUfo": prUfo,
        "ingBijdrZvw": ingBijdrZvw,
        "totWghZvw": totWghZvw,
        "totTeBet": totTeBet,
        "totGen": totGen,
        "saldoCorrectiesVoorgaandTijdvak": List<dynamic>.from(
            saldoCorrectiesVoorgaandTijdvak!.map((x) => x.toJson())),
      };
}

enum CollectieveType { NORMAAL, CORRECTIE }

final collectieveTypeValues = EnumValues({
  "Correctie": CollectieveType.CORRECTIE,
  "Normaal": CollectieveType.NORMAAL
});

class SaldoCorrectiesVoorgaandTijdvak {
  SaldoCorrectiesVoorgaandTijdvak({
    this.datAanvTv,
    this.datEindTv,
    this.saldo,
  });

  DateTime? datAanvTv;
  DateTime? datEindTv;
  double? saldo;

  factory SaldoCorrectiesVoorgaandTijdvak.fromJson(Map<String, dynamic> json) =>
      SaldoCorrectiesVoorgaandTijdvak(
        datAanvTv: DateTime.parse(json["datAanvTv"]),
        datEindTv: DateTime.parse(json["datEindTv"]),
        saldo: json["saldo"],
      );

  Map<String, dynamic> toJson() => {
        "datAanvTv": datAanvTv?.toIso8601String(),
        "datEindTv": datEindTv?.toIso8601String(),
        "saldo": saldo,
      };
}

enum FiscaalNummer { THE_817009085_L03, THE_001161374_L07, THE_813234797_L02 }

final fiscaalNummerValues = EnumValues({
  "001161374L07": FiscaalNummer.THE_001161374_L07,
  "813234797L02": FiscaalNummer.THE_813234797_L02,
  "817009085L03": FiscaalNummer.THE_817009085_L03
});

class Klant {
  Klant({
    this.klantId,
    this.klantName,
  });

  String? klantId;
  String? klantName;

  factory Klant.fromJson(Map<String, dynamic> json) => Klant(
        klantId: json["klantId"],
        klantName: json["klantName"],
      );

  Map<String, dynamic> toJson() => {
        "klantId": klantId,
        "klantName": klantName,
      };
}

class WhkPremy {
  WhkPremy({
    this.id,
    this.wgaVastWerkgever,
    this.wgaVastWerknemer,
    this.flexWerkgever,
    this.flexWerknemer,
    this.zwFlex,
    this.totaal,
    this.actiefVanaf,
    this.actiefTot,
    this.dateCreated,
    this.dateLastModified,
    this.sqlId,
    this.actief,
  });

  String? id;
  double? wgaVastWerkgever;
  double? wgaVastWerknemer;
  double? flexWerkgever;
  double? flexWerknemer;
  double? zwFlex;
  double? totaal;
  DateTime? actiefVanaf;
  DateTime? actiefTot;
  DateTime? dateCreated;
  DateTime? dateLastModified;
  int? sqlId;
  bool? actief;

  factory WhkPremy.fromJson(Map<String, dynamic> json) => WhkPremy(
        id: json["id"],
        wgaVastWerkgever: json["wgaVastWerkgever"],
        wgaVastWerknemer: json["wgaVastWerknemer"],
        flexWerkgever: json["flexWerkgever"],
        flexWerknemer: json["flexWerknemer"],
        zwFlex: json["zwFlex"],
        totaal: json["totaal"],
        actiefVanaf: DateTime.parse(json["actiefVanaf"]),
        actiefTot: DateTime.parse(json["actiefTot"]),
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateLastModified: DateTime.parse(json["dateLastModified"]),
        sqlId: json["sqlId"],
        actief: json["actief"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wgaVastWerkgever": wgaVastWerkgever,
        "wgaVastWerknemer": wgaVastWerknemer,
        "flexWerkgever": flexWerkgever,
        "flexWerknemer": flexWerknemer,
        "zwFlex": zwFlex,
        "totaal": totaal,
        "actiefVanaf": actiefVanaf?.toIso8601String(),
        "actiefTot": actiefTot?.toIso8601String(),
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
        "sqlId": sqlId,
        "actief": actief,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
