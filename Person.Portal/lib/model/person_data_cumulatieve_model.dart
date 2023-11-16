// To parse this JSON data, do
//
//     final personDataCumulatieveModel = personDataCumulatieveModelFromJson(jsonString);

import 'dart:convert';

PersonDataCumulatieveModel personDataCumulatieveModelFromJson(String str) => PersonDataCumulatieveModel.fromJson(json.decode(str));

String personDataCumulatieveModelToJson(PersonDataCumulatieveModel data) => json.encode(data.toJson());

class PersonDataCumulatieveModel {
  PersonDataCumulatieveModel({
    this.sofiNr,
    this.personNr,
    this.numIv,
    this.taxNo,
    this.taxFileProcessDate,
    this.taxPeriode,
    this.lnLbPh,
    this.lnSv,
    this.prlnAofAnwLg,
    this.prlnAofAnwHg,
    this.prlnAofAnwUit,
    this.prlnAwfAnwLg,
    this.prlnAwfAnwHg,
    this.prlnAwfAnwHz,
    this.prLnUfo,
    this.lnTabBb,
    this.vakBsl,
    this.opgRchtVakBsl,
    this.opnAvwb,
    this.opbAvwb,
    this.lnInGld,
    this.wrdLn,
    this.lnOwrk,
    this.verstrAanv,
    this.ingLbPh,
    this.prAofLg,
    this.prAofHg,
    this.prAofUit,
    this.opslWko,
    this.prGediffWhk,
    this.prAwfLg,
    this.prAwfHg,
    this.prAwfHz,
    this.prUfo,
    this.bijdrZvw,
    this.wghZvw,
    this.wrdPrGebrAut,
    this.wrknBijdrAut,
    this.reisk,
    this.verrArbKrt,
    this.aantVerlU,
    this.ctrctln,
    this.aantCtrcturenPWk,
    this.bedrRntKstvPersl,
    this.bedrAlInWwb,
    this.bedrRchtAl,
  });

  String? sofiNr;
  String? personNr;
  String? numIv;
  String? taxNo;
  DateTime? taxFileProcessDate;
  String? taxPeriode;
  double? lnLbPh;
  double? lnSv;
  double? prlnAofAnwLg;
  double? prlnAofAnwHg;
  double? prlnAofAnwUit;
  double? prlnAwfAnwLg;
  double? prlnAwfAnwHg;
  double? prlnAwfAnwHz;
  double? prLnUfo;
  double? lnTabBb;
  double? vakBsl;
  double? opgRchtVakBsl;
  double? opnAvwb;
  double? opbAvwb;
  double? lnInGld;
  double? wrdLn;
  double? lnOwrk;
  double? verstrAanv;
  double? ingLbPh;
  double? prAofLg;
  double? prAofHg;
  double? prAofUit;
  double? opslWko;
  double? prGediffWhk;
  double? prAwfLg;
  double? prAwfHg;
  double? prAwfHz;
  double? prUfo;
  double? bijdrZvw;
  double? wghZvw;
  double? wrdPrGebrAut;
  double? wrknBijdrAut;
  double? reisk;
  double? verrArbKrt;
  double? aantVerlU;
  double? ctrctln;
  double? aantCtrcturenPWk;
  double? bedrRntKstvPersl;
  double? bedrAlInWwb;
  double? bedrRchtAl;

  factory PersonDataCumulatieveModel.fromJson(Map<String, dynamic> json) => PersonDataCumulatieveModel(
    sofiNr: json["sofiNr"],
    personNr: json["personNr"],
    numIv: json["numIv"],
    taxNo: json["taxNo"],
    taxFileProcessDate: DateTime.parse(json["taxFileProcessDate"]),
    taxPeriode: json["taxPeriode"],
    lnLbPh: json["lnLbPh"].toDouble(),
    lnSv: json["lnSv"].toDouble(),
    prlnAofAnwLg: json["prlnAofAnwLg"].toDouble(),
    prlnAofAnwHg: json["prlnAofAnwHg"].toDouble(),
    prlnAofAnwUit: json["prlnAofAnwUit"].toDouble(),
    prlnAwfAnwLg: json["prlnAwfAnwLg"].toDouble(),
    prlnAwfAnwHg: json["prlnAwfAnwHg"].toDouble(),
    prlnAwfAnwHz: json["prlnAwfAnwHz"].toDouble(),
    prLnUfo: json["prLnUfo"].toDouble(),
    lnTabBb: json["lnTabBb"].toDouble(),
    vakBsl: json["vakBsl"].toDouble(),
    opgRchtVakBsl: json["opgRchtVakBsl"],
    opnAvwb: json["opnAvwb"].toDouble(),
    opbAvwb: json["opbAvwb"].toDouble(),
    lnInGld: json["lnInGld"].toDouble(),
    wrdLn: json["wrdLn"].toDouble(),
    lnOwrk: json["lnOwrk"].toDouble(),
    verstrAanv: json["verstrAanv"],
    ingLbPh: json["ingLbPh"].toDouble(),
    prAofLg: json["prAofLg"].toDouble(),
    prAofHg: json["prAofHg"].toDouble(),
    prAofUit: json["prAofUit"].toDouble(),
    opslWko: json["opslWko"].toDouble(),
    prGediffWhk: json["prGediffWhk"].toDouble(),
    prAwfLg: json["prAwfLg"].toDouble(),
    prAwfHg: json["prAwfHg"].toDouble(),
    prAwfHz: json["prAwfHz"].toDouble(),
    prUfo: json["prUfo"].toDouble(),
    bijdrZvw: json["bijdrZvw"].toDouble(),
    wghZvw: json["wghZvw"].toDouble(),
    wrdPrGebrAut: json["wrdPrGebrAut"].toDouble(),
    wrknBijdrAut: json["wrknBijdrAut"].toDouble(),
    reisk: json["reisk"].toDouble(),
    verrArbKrt: json["verrArbKrt"].toDouble(),
    aantVerlU: json["aantVerlU"].toDouble(),
    ctrctln: json["ctrctln"].toDouble(),
    aantCtrcturenPWk: json["aantCtrcturenPWk"].toDouble(),
    bedrRntKstvPersl: json["bedrRntKstvPersl"].toDouble(),
    bedrAlInWwb: json["bedrAlInWwb"].toDouble(),
    bedrRchtAl: json["bedrRchtAl"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "sofiNr": sofiNr,
    "personNr": personNr,
    "numIv": numIv,
    "taxNo": taxNo,
    "taxFileProcessDate": taxFileProcessDate?.toIso8601String(),
    "taxPeriode": taxPeriode,
    "lnLbPh": lnLbPh,
    "lnSv": lnSv,
    "prlnAofAnwLg": prlnAofAnwLg,
    "prlnAofAnwHg": prlnAofAnwHg,
    "prlnAofAnwUit": prlnAofAnwUit,
    "prlnAwfAnwLg": prlnAwfAnwLg,
    "prlnAwfAnwHg": prlnAwfAnwHg,
    "prlnAwfAnwHz": prlnAwfAnwHz,
    "prLnUfo": prLnUfo,
    "lnTabBb": lnTabBb,
    "vakBsl": vakBsl,
    "opgRchtVakBsl": opgRchtVakBsl,
    "opnAvwb": opnAvwb,
    "opbAvwb": opbAvwb,
    "lnInGld": lnInGld,
    "wrdLn": wrdLn,
    "lnOwrk": lnOwrk,
    "verstrAanv": verstrAanv,
    "ingLbPh": ingLbPh,
    "prAofLg": prAofLg,
    "prAofHg": prAofHg,
    "prAofUit": prAofUit,
    "opslWko": opslWko,
    "prGediffWhk": prGediffWhk,
    "prAwfLg": prAwfLg,
    "prAwfHg": prAwfHg,
    "prAwfHz": prAwfHz,
    "prUfo": prUfo,
    "bijdrZvw": bijdrZvw,
    "wghZvw": wghZvw,
    "wrdPrGebrAut": wrdPrGebrAut,
    "wrknBijdrAut": wrknBijdrAut,
    "reisk": reisk,
    "verrArbKrt": verrArbKrt,
    "aantVerlU": aantVerlU,
    "ctrctln": ctrctln,
    "aantCtrcturenPWk": aantCtrcturenPWk,
    "bedrRntKstvPersl": bedrRntKstvPersl,
    "bedrAlInWwb": bedrAlInWwb,
    "bedrRchtAl": bedrRchtAl,
  };
}
