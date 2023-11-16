// To parse this JSON data, do
//
//     final personModel = personModelFromJson(jsonString);

import 'dart:convert';

PersonModel personModelFromJson(String str) => PersonModel.fromJson(json.decode(str));

String personModelToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  PersonModel({
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
    this.emailAddress,
    this.userName,
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
  List<Werkgever>? werkgever;
  AdresBinnenland? adresBinnenland;
  AdresBuitenland? adresBuitenland;
  String? personType;
  bool? active;
  DateTime? dateCreated;
  DateTime? dateLastModified;
  List<TaxPaymentDetail>? taxPaymentDetails;
  String? emailAddress;
  String? userName;
  String? taxFileName;

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        id: json["id"],
        sofiNr: json["sofiNr"],
        voorletter: json["voorletter"],
        voorvoegsel: json["voorvoegsel"],
        significantAchternaam: json["significantAchternaam"],
        geboortedatum: DateTime.parse(json["geboortedatum"]),
        nationaliteit: json["nationaliteit"],
        geslacht: json["geslacht"],
        werkgever: List<Werkgever>.from(json["werkgever"].map((x) => Werkgever.fromJson(x))),
        adresBinnenland: json["adresBinnenland"] != null ? AdresBinnenland.fromJson(json["adresBinnenland"]) : null,
        adresBuitenland: json["adresBuitenland"] != null ? AdresBuitenland.fromJson(json["adresBuitenland"]) : null,
        personType: json["personType"],
        active: json["active"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateLastModified: DateTime.parse(json["dateLastModified"]),
        taxPaymentDetails:
            List<TaxPaymentDetail>.from(json["taxPaymentDetails"].map((x) => TaxPaymentDetail.fromJson(x))),
        emailAddress: json["emailAddress"],
        userName: json["userName"],
        taxFileName: json["taxFileName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sofiNr": sofiNr,
        "voorletter": voorletter,
        "voorvoegsel": voorvoegsel,
        "significantAchternaam": significantAchternaam,
        "geboortedatum": geboortedatum?.toIso8601String(),
        "nationaliteit": nationaliteit,
        "geslacht": geslacht,
        "werkgever": werkgever != null ? List<dynamic>.from(werkgever!.map((x) => x.toJson())) : null,
        "adresBinnenland": adresBinnenland?.toJson(),
        "adresBuitenland": adresBuitenland?.toJson(),
        "personType": personType,
        "active": active,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
        "taxPaymentDetails": taxPaymentDetails != null ? List<dynamic>.from(taxPaymentDetails!.map((x) => x.toJson())) : null,
        "emailAddress": emailAddress,
        "userName": userName,
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
  String? huisNrToev;
  String? locOms;
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

class AdresBuitenland {
  AdresBuitenland({
    this.str,
    this.huisNr,
    this.locOms,
    this.pc,
    this.woonpl,
    this.reg,
    this.landCd,
  });

  String? str;
  String? huisNr;
  String? locOms;
  String? pc;
  String? woonpl;
  String? reg;
  String? landCd;

  factory AdresBuitenland.fromJson(Map<String, dynamic> json) => AdresBuitenland(
        str: json["str"],
        huisNr: json["huisNr"],
        locOms: json["locOms"],
        pc: json["pc"],
        woonpl: json["woonpl"],
        reg: json["reg"],
        landCd: json["landCd"],
      );

  Map<String, dynamic> toJson() => {
        "str": str,
        "huisNr": huisNr,
        "locOms": locOms,
        "pc": pc,
        "woonpl": woonpl,
        "reg": reg,
        "landCd": landCd,
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
  String? collectieveType;
  List<Inkomstenperiode>? inkomstenperiode;
  Werknemersgegevens? werknemersgegevens;

  factory TaxPaymentDetail.fromJson(Map<String, dynamic> json) => TaxPaymentDetail(
        taxNo: json["taxNo"],
        numIv: json["numIv"],
        personNr: json["personNr"],
        taxFileProcessDate: DateTime.parse(json["taxFileProcessDate"]),
        taxPeriode: json["taxPeriode"],
        collectieveType: json["collectieveType"],
        inkomstenperiode:
            List<Inkomstenperiode>.from(json["inkomstenperiode"].map((x) => Inkomstenperiode.fromJson(x))),
        werknemersgegevens: Werknemersgegevens.fromJson(json["werknemersgegevens"]),
      );

  Map<String, dynamic> toJson() => {
        "taxNo": taxNo,
        "numIv": numIv,
        "personNr": personNr,
        "taxFileProcessDate": taxFileProcessDate?.toIso8601String(),
        "taxPeriode": taxPeriode,
        "collectieveType": collectieveType,
        "inkomstenperiode": inkomstenperiode != null ? List<dynamic>.from(inkomstenperiode!.map((x) => x.toJson())) : null,
        "werknemersgegevens": werknemersgegevens?.toJson(),
      };
}

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
  String? cdInvlVpl;
  String? fsIndFz;
  String? cao;
  String? cdCaoInl;
  String? indArbovOnbepTd;
  String? indSchriftArbov;
  String? indOprov;
  String? indJrurennrm;
  String? indPubAanOnbepTd;
  String? indAvrLkvOudrWn;
  String? indAvrLkvAgWn;
  String? indAvrLkvDgBafSb;
  String? indAvrLkvHpAgWn;
  String? indLhKort;
  String? cdRdnGnBijt;
  String? lbTab;
  String? indWao;
  String? indWw;
  String? indZw;
  String? indWgldOudRegl;
  String? cdZvw;
  String? indVakBn;
  String? indSa71;
  String? indSa72;
  String? indSa03;
  String? cdIncInkVerm;

  factory Inkomstenperiode.fromJson(Map<String, dynamic> json) => Inkomstenperiode(
        datAanv: DateTime.parse(json["datAanv"]),
        srtIv: json["srtIv"],
        cdAard: json["cdAard"],
        cdInvlVpl: json["cdInvlVpl"],
        fsIndFz: json["fsIndFz"],
        cao: json["cao"],
        cdCaoInl: json["cdCaoInl"],
        indArbovOnbepTd: json["indArbovOnbepTd"],
        indSchriftArbov: json["indSchriftArbov"],
        indOprov: json["indOprov"],
        indJrurennrm: json["indJrurennrm"],
        indPubAanOnbepTd: json["indPubAanOnbepTd"],
        indAvrLkvOudrWn: json["indAvrLkvOudrWn"],
        indAvrLkvAgWn: json["indAvrLkvAgWn"],
        indAvrLkvDgBafSb: json["indAvrLkvDgBafSb"],
        indAvrLkvHpAgWn: json["indAvrLkvHpAgWn"],
        indLhKort: json["indLhKort"],
        cdRdnGnBijt: json["cdRdnGnBijt"],
        lbTab: json["lbTab"],
        indWao: json["indWao"],
        indWw: json["indWw"],
        indZw: json["indZw"],
        indWgldOudRegl: json["indWgldOudRegl"],
        cdZvw: json["cdZvw"],
        indVakBn: json["indVakBn"],
        indSa71: json["indSa71"],
        indSa72: json["indSa72"],
        indSa03: json["indSa03"],
        cdIncInkVerm: json["cdIncInkVerm"],
      );

  Map<String, dynamic> toJson() => {
        "datAanv": datAanv?.toIso8601String(),
        "srtIv": srtIv,
        "cdAard": cdAard,
        "cdInvlVpl": cdInvlVpl,
        "fsIndFz": fsIndFz,
        "cao": cao,
        "cdCaoInl": cdCaoInl,
        "indArbovOnbepTd": indArbovOnbepTd,
        "indSchriftArbov": indSchriftArbov,
        "indOprov": indOprov,
        "indJrurennrm": indJrurennrm,
        "indPubAanOnbepTd": indPubAanOnbepTd,
        "indAvrLkvOudrWn": indAvrLkvOudrWn,
        "indAvrLkvAgWn": indAvrLkvAgWn,
        "indAvrLkvDgBafSb": indAvrLkvDgBafSb,
        "indAvrLkvHpAgWn": indAvrLkvHpAgWn,
        "indLhKort": indLhKort,
        "cdRdnGnBijt": cdRdnGnBijt,
        "lbTab": lbTab,
        "indWao": indWao,
        "indWw": indWw,
        "indZw": indZw,
        "indWgldOudRegl": indWgldOudRegl,
        "cdZvw": cdZvw,
        "indVakBn": indVakBn,
        "indSa71": indSa71,
        "indSa72": indSa72,
        "indSa03": indSa03,
        "cdIncInkVerm": cdIncInkVerm,
      };
}

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
        verrArbKrt: json["verrArbKrt"],
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

class Werkgever {
  Werkgever({
    this.klant,
    this.loonheffingsNr,
  });

  String? klant;
  String? loonheffingsNr;

  factory Werkgever.fromJson(Map<String, dynamic> json) => Werkgever(
        klant: json["klant"],
        loonheffingsNr: json["loonheffingsNr"],
      );

  Map<String, dynamic> toJson() => {
        "klant": klant,
        "loonheffingsNr": loonheffingsNr,
      };
}



enum Geslacht {
  Onbekend, // Onbekend / Unknown
  Mannelijk, // Mannelijk / Male
  Vrouwelijk, // Vrouwelijk / Female
  NietGespecificeerd, // Niet gespecificeerd / Not Specified
}

enum GeslachtItems {
  Item0, // Onbekend / Unknown
  Item1, // Mannelijk / Male
  Item2, // Vrouwelijk / Female
  Item9, // Niet gespecificeerd / Not Specified
}