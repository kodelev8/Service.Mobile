// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

List<Person> personFromJson(String str) => List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  Person({
    this.id,
    this.sofiNr,
    this.voorletter,
    this.voorvoegsel,
    this.significantAchternaam,
    this.geboortedatum,
    this.nationaliteit,
    this.geslacht,
    this.werkgever,
    this.adresBinnenland,
    this.adresBuitenland,
    this.personType,
    this.active,
    this.dateCreated,
    this.dateLastModified,
    this.taxPaymentDetails,
    this.taxFileName,
  });

  String? id;
  String? sofiNr;
  String? voorletter;
  String? voorvoegsel;
  String? significantAchternaam;
  DateTime? geboortedatum;
  String? nationaliteit;
  String? geslacht;
  List<PersonWerkgever>? werkgever;
  AdresBinnenland? adresBinnenland;
  dynamic adresBuitenland;
  String? personType;
  bool? active;
  DateTime? dateCreated;
  DateTime? dateLastModified;
  List<TaxPaymentDetail>? taxPaymentDetails;
  dynamic taxFileName;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    sofiNr: json["sofiNr"],
    voorletter: json["voorletter"],
    voorvoegsel: json["voorvoegsel"] == null ? null : json["voorvoegsel"],
    significantAchternaam: json["significantAchternaam"],
    geboortedatum: DateTime.parse(json["geboortedatum"]),
    nationaliteit: json["nationaliteit"],
    geslacht: json["geslacht"],
    werkgever: List<PersonWerkgever>.from(json["werkgever"].map((x) => PersonWerkgever.fromJson(x))),
    adresBinnenland: AdresBinnenland.fromJson(json["adresBinnenland"]),
    adresBuitenland: json["adresBuitenland"],
    personType: json["personType"],
    active: json["active"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    dateLastModified: DateTime.parse(json["dateLastModified"]),
    taxPaymentDetails: List<TaxPaymentDetail>.from(json["taxPaymentDetails"].map((x) => TaxPaymentDetail.fromJson(x))),
    taxFileName: json["taxFileName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sofiNr": sofiNr,
    "voorletter": voorletter,
    "voorvoegsel": voorvoegsel == null ? null : voorvoegsel,
    "significantAchternaam": significantAchternaam,
    "geboortedatum": geboortedatum?.toIso8601String(),
    "nationaliteit": nationaliteit,
    "geslacht": geslacht,
    "werkgever": List<dynamic>.from(werkgever!.map((x) => x.toJson())),
    "adresBinnenland": adresBinnenland?.toJson(),
    "adresBuitenland": adresBuitenland,
    "personType": personType,
    "active": active,
    "dateCreated": dateCreated?.toIso8601String(),
    "dateLastModified": dateLastModified?.toIso8601String(),
    "taxPaymentDetails": List<dynamic>.from(taxPaymentDetails!.map((x) => x.toJson())),
    "taxFileName": taxFileName,
  };
}

class AdresBinnenland {
  AdresBinnenland({
    this.str,
    this.huisNr,
    this.huisNrToev,
    this.locOms,
    this.pc,
    this.woonpl,
  });

  String? str;
  String? huisNr;
  dynamic huisNrToev;
  dynamic locOms;
  String? pc;
  String? woonpl;

  factory AdresBinnenland.fromJson(Map<String, dynamic> json) => AdresBinnenland(
    str: json["str"],
    huisNr: json["huisNr"],
    huisNrToev: json["huisNrToev"],
    locOms: json["locOms"],
    pc: json["pc"],
    woonpl: json["woonpl"],
  );

  Map<String, dynamic> toJson() => {
    "str": str,
    "huisNr": huisNr,
    "huisNrToev": huisNrToev,
    "locOms": locOms,
    "pc": pc,
    "woonpl": woonpl,
  };
}

class TaxPaymentDetail {
  TaxPaymentDetail({
    this.taxNo,
    this.numIv,
    this.personNr,
    this.taxFileProcessDate,
    this.taxPeriode,
    this.collectieveType,
    this.inkomstenperiode,
    this.werknemersgegevens,
  });

  String? taxNo;
  String? numIv;
  String? personNr;
  DateTime? taxFileProcessDate;
  String? taxPeriode;
  CollectieveType? collectieveType;
  List<Inkomstenperiode>? inkomstenperiode;
  Werknemersgegevens? werknemersgegevens;

  factory TaxPaymentDetail.fromJson(Map<String, dynamic> json) => TaxPaymentDetail(
    taxNo: json["taxNo"], // taxNoValues.map[json["taxNo"]],
    numIv: json["numIv"],
    personNr: json["personNr"],
    taxFileProcessDate: DateTime.parse(json["taxFileProcessDate"]),
    taxPeriode: json["taxPeriode"],
    collectieveType: collectieveTypeValues.map[json["collectieveType"]],
    inkomstenperiode: List<Inkomstenperiode>.from(json["inkomstenperiode"].map((x) => Inkomstenperiode.fromJson(x))),
    werknemersgegevens: Werknemersgegevens.fromJson(json["werknemersgegevens"]),
  );

  Map<String, dynamic> toJson() => {
    "taxNo": taxNo, // taxNoValues.reverse[taxNo],
    "numIv": numIv,
    "personNr": personNr,
    "taxFileProcessDate": taxFileProcessDate?.toIso8601String(),
    "taxPeriode": taxPeriode,
    "collectieveType": collectieveTypeValues.reverse[collectieveType],
    "inkomstenperiode": List<dynamic>.from(inkomstenperiode!.map((x) => x.toJson())),
    "werknemersgegevens": werknemersgegevens?.toJson(),
  };
}

enum CollectieveType { NORMAAL, CORRECTIE }

final collectieveTypeValues = EnumValues({
  "Correctie": CollectieveType.CORRECTIE,
  "Normaal": CollectieveType.NORMAAL
});

class Inkomstenperiode {
  Inkomstenperiode({
    this.datAanv,
    this.srtIv,
    this.cdAard,
    this.cdInvlVpl,
    this.fsIndFz,
    this.cao,
    this.cdCaoInl,
    this.indArbovOnbepTd,
    this.indSchriftArbov,
    this.indOprov,
    this.indJrurennrm,
    this.indPubAanOnbepTd,
    this.indAvrLkvOudrWn,
    this.indAvrLkvAgWn,
    this.indAvrLkvDgBafSb,
    this.indAvrLkvHpAgWn,
    this.indLhKort,
    this.cdRdnGnBijt,
    this.lbTab,
    this.indWao,
    this.indWw,
    this.indZw,
    this.indWgldOudRegl,
    this.cdZvw,
    this.indVakBn,
    this.indSa71,
    this.indSa72,
    this.indSa03,
    this.cdIncInkVerm,
  });

  DateTime? datAanv;
  String? srtIv;
  String? cdAard;
  dynamic cdInvlVpl;
  String? fsIndFz;
  dynamic cao;
  dynamic cdCaoInl;
  IndArbovOnbepTdEnum? indArbovOnbepTd;
  IndArbovOnbepTdEnum? indSchriftArbov;
  IndArbovOnbepTdEnum? indOprov;
  IndArbovOnbepTdEnum? indJrurennrm;
  IndArbovOnbepTdEnum? indPubAanOnbepTd;
  IndArbovOnbepTdEnum? indAvrLkvOudrWn;
  IndArbovOnbepTdEnum? indAvrLkvAgWn;
  IndArbovOnbepTdEnum? indAvrLkvDgBafSb;
  IndArbovOnbepTdEnum? indAvrLkvHpAgWn;
  IndArbovOnbepTdEnum? indLhKort;
  String? cdRdnGnBijt;
  String? lbTab;
  IndArbovOnbepTdEnum? indWao;
  IndArbovOnbepTdEnum? indWw;
  IndArbovOnbepTdEnum? indZw;
  IndArbovOnbepTdEnum? indWgldOudRegl;
  Cd? cdZvw;
  IndSa03Enum? indVakBn;
  IndSa03Enum? indSa71;
  IndSa03Enum? indSa72;
  IndSa03Enum? indSa03;
  Cd? cdIncInkVerm;

  factory Inkomstenperiode.fromJson(Map<String, dynamic> json) => Inkomstenperiode(
    datAanv: DateTime.parse(json["datAanv"]),
    srtIv: json["srtIv"],
    cdAard: json["cdAard"],
    cdInvlVpl: json["cdInvlVpl"],
    fsIndFz: json["fsIndFz"],
    cao: json["cao"],
    cdCaoInl: json["cdCaoInl"],
    indArbovOnbepTd: indArbovOnbepTdEnumValues.map[json["indArbovOnbepTd"]],
    indSchriftArbov: indArbovOnbepTdEnumValues.map[json["indSchriftArbov"]],
    indOprov: indArbovOnbepTdEnumValues.map[json["indOprov"]],
    indJrurennrm: indArbovOnbepTdEnumValues.map[json["indJrurennrm"]],
    indPubAanOnbepTd: indArbovOnbepTdEnumValues.map[json["indPubAanOnbepTd"]],
    indAvrLkvOudrWn: indArbovOnbepTdEnumValues.map[json["indAvrLkvOudrWn"]],
    indAvrLkvAgWn: indArbovOnbepTdEnumValues.map[json["indAvrLkvAgWn"]],
    indAvrLkvDgBafSb: indArbovOnbepTdEnumValues.map[json["indAvrLkvDgBafSb"]],
    indAvrLkvHpAgWn: indArbovOnbepTdEnumValues.map[json["indAvrLkvHpAgWn"]],
    indLhKort: indArbovOnbepTdEnumValues.map[json["indLhKort"]],
    cdRdnGnBijt: json["cdRdnGnBijt"],
    lbTab: json["lbTab"],
    indWao: indArbovOnbepTdEnumValues.map[json["indWao"]],
    indWw: indArbovOnbepTdEnumValues.map[json["indWw"]],
    indZw: indArbovOnbepTdEnumValues.map[json["indZw"]],
    indWgldOudRegl: indArbovOnbepTdEnumValues.map[json["indWgldOudRegl"]],
    cdZvw: cdValues.map[json["cdZvw"]],
    indVakBn: indSa03EnumValues.map[json["indVakBn"]],
    indSa71: indSa03EnumValues.map[json["indSa71"]],
    indSa72: indSa03EnumValues.map[json["indSa72"]],
    indSa03: indSa03EnumValues.map[json["indSa03"]],
    cdIncInkVerm: cdValues.map[json["cdIncInkVerm"]],
  );

  Map<String, dynamic> toJson() => {
    "datAanv": datAanv?.toIso8601String(),
    "srtIv": srtIv,
    "cdAard": cdAard,
    "cdInvlVpl": cdInvlVpl,
    "fsIndFz": fsIndFz,
    "cao": cao,
    "cdCaoInl": cdCaoInl,
    "indArbovOnbepTd": indArbovOnbepTdEnumValues.reverse[indArbovOnbepTd],
    "indSchriftArbov": indArbovOnbepTdEnumValues.reverse[indSchriftArbov],
    "indOprov": indArbovOnbepTdEnumValues.reverse[indOprov],
    "indJrurennrm": indArbovOnbepTdEnumValues.reverse[indJrurennrm],
    "indPubAanOnbepTd": indArbovOnbepTdEnumValues.reverse[indPubAanOnbepTd],
    "indAvrLkvOudrWn": indArbovOnbepTdEnumValues.reverse[indAvrLkvOudrWn],
    "indAvrLkvAgWn": indArbovOnbepTdEnumValues.reverse[indAvrLkvAgWn],
    "indAvrLkvDgBafSb": indArbovOnbepTdEnumValues.reverse[indAvrLkvDgBafSb],
    "indAvrLkvHpAgWn": indArbovOnbepTdEnumValues.reverse[indAvrLkvHpAgWn],
    "indLhKort": indArbovOnbepTdEnumValues.reverse[indLhKort],
    "cdRdnGnBijt": cdRdnGnBijt,
    "lbTab": lbTab,
    "indWao": indArbovOnbepTdEnumValues.reverse[indWao],
    "indWw": indArbovOnbepTdEnumValues.reverse[indWw],
    "indZw": indArbovOnbepTdEnumValues.reverse[indZw],
    "indWgldOudRegl": indArbovOnbepTdEnumValues.reverse[indWgldOudRegl],
    "cdZvw": cdValues.reverse[cdZvw],
    "indVakBn": indSa03EnumValues.reverse[indVakBn],
    "indSa71": indSa03EnumValues.reverse[indSa71],
    "indSa72": indSa03EnumValues.reverse[indSa72],
    "indSa03": indSa03EnumValues.reverse[indSa03],
    "cdIncInkVerm": cdValues.reverse[cdIncInkVerm],
  };
}

enum Cd { K }

final cdValues = EnumValues({
  "K": Cd.K
});

enum IndArbovOnbepTdEnum { J }

final indArbovOnbepTdEnumValues = EnumValues({
  "J": IndArbovOnbepTdEnum.J
});

enum IndSa03Enum { N }

final indSa03EnumValues = EnumValues({
  "N": IndSa03Enum.N
});

enum TaxNo { THE_817009085_L03 }

final taxNoValues = EnumValues({
  "817009085L03": TaxNo.THE_817009085_L03
});

class Werknemersgegevens {
  Werknemersgegevens({
    this.bedrRchtAlSpecified,
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
    this.ctrctlnSpecified,
    this.aantCtrcturenPWkSpecified,
    this.bedrRntKstvPersl,
    this.bedrAlInWwbSpecified,
  });

  bool? bedrRchtAlSpecified;
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
  bool? ctrctlnSpecified;
  bool? aantCtrcturenPWkSpecified;
  double? bedrRntKstvPersl;
  bool? bedrAlInWwbSpecified;

  factory Werknemersgegevens.fromJson(Map<String, dynamic> json) => Werknemersgegevens(
    bedrRchtAlSpecified: json["bedrRchtAlSpecified"],
    lnLbPh: json["lnLbPh"].toDouble(),
    lnSv: json["lnSv"].toDouble(),
    prlnAofAnwLg: json["prlnAofAnwLg"],
    prlnAofAnwHg: json["prlnAofAnwHg"],
    prlnAofAnwUit: json["prlnAofAnwUit"].toDouble(),
    prlnAwfAnwLg: json["prlnAwfAnwLg"].toDouble(),
    prlnAwfAnwHg: json["prlnAwfAnwHg"],
    prlnAwfAnwHz: json["prlnAwfAnwHz"],
    prLnUfo: json["prLnUfo"],
    lnTabBb: json["lnTabBb"],
    vakBsl: json["vakBsl"],
    opgRchtVakBsl: json["opgRchtVakBsl"],
    opnAvwb: json["opnAvwb"],
    opbAvwb: json["opbAvwb"],
    lnInGld: json["lnInGld"],
    wrdLn: json["wrdLn"],
    lnOwrk: json["lnOwrk"],
    verstrAanv: json["verstrAanv"],
    ingLbPh: json["ingLbPh"].toDouble(),
    prAofLg: json["prAofLg"],
    prAofHg: json["prAofHg"],
    prAofUit: json["prAofUit"].toDouble(),
    opslWko: json["opslWko"].toDouble(),
    prGediffWhk: json["prGediffWhk"].toDouble(),
    prAwfLg: json["prAwfLg"].toDouble(),
    prAwfHg: json["prAwfHg"],
    prAwfHz: json["prAwfHz"],
    prUfo: json["prUfo"],
    bijdrZvw: json["bijdrZvw"],
    wghZvw: json["wghZvw"].toDouble(),
    wrdPrGebrAut: json["wrdPrGebrAut"],
    wrknBijdrAut: json["wrknBijdrAut"],
    reisk: json["reisk"],
    verrArbKrt: json["verrArbKrt"].toDouble(),
    aantVerlU: json["aantVerlU"],
    ctrctlnSpecified: json["ctrctlnSpecified"],
    aantCtrcturenPWkSpecified: json["aantCtrcturenPWkSpecified"],
    bedrRntKstvPersl: json["bedrRntKstvPersl"],
    bedrAlInWwbSpecified: json["bedrAlInWwbSpecified"],
  );

  Map<String, dynamic> toJson() => {
    "bedrRchtAlSpecified": bedrRchtAlSpecified,
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
    "ctrctlnSpecified": ctrctlnSpecified,
    "aantCtrcturenPWkSpecified": aantCtrcturenPWkSpecified,
    "bedrRntKstvPersl": bedrRntKstvPersl,
    "bedrAlInWwbSpecified": bedrAlInWwbSpecified,
  };
}

class PersonWerkgever {
  PersonWerkgever({
    this.klant,
    this.loonheffingsNr,
  });

  String? klant;
  String? loonheffingsNr;

  factory PersonWerkgever.fromJson(Map<String, dynamic> json) => PersonWerkgever(
    klant: json["klant"],
    loonheffingsNr: json["loonheffingsNr"],
  );

  Map<String, dynamic> toJson() => {
    "klant": klant,
    "loonheffingsNr": loonheffingsNr, // taxNoValues.reverse[loonheffingsNr],
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
