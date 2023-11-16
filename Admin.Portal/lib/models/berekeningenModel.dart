// To parse this JSON data, do
//
//     final berekeningenModel = berekeningenModelFromJson(jsonString);

import 'dart:convert';

BerekeningenModel berekeningenModelFromJson(String str) => BerekeningenModel.fromJson(json.decode(str));

String berekeningenModelToJson(BerekeningenModel data) => json.encode(data.toJson());

class BerekeningenModel {
  BerekeningenModel({
    this.id,
    this.processDatum,
    this.woonlandbeginselId,
    this.tijdvakId,
    this.inkomenWit,
    this.inkomenGroen,
    this.werkgever,
    this.inhouding,
    this.premieBedrag,
    this.employeeId,
    this.loonOverVanaf,
    this.loonOverTot,
    this.loonInVanaf,
    this.loonInTot,
    this.algemeneHeffingskortingToegepast,
    this.basisDagen,
    this.inhoudingOpLoonWit,
    this.inhoudingOpLoonGroen,
    this.algemeneHeffingskortingBedrag,
    this.verrekendeArbeIdskorting,
    this.sociaalVerzekeringsloon,
    this.premieBedragAlgemeenWerkloosheIdsFondsLaagHoog,
    this.premieBedragAlgemeenWerkloosheIdsFondsLaag,
    this.premieBedragAlgemeenWerkloosheIdsFondsHoog,
    this.isPremieBedragUitvoeringsFondsvoordeOverheId,
    this.premieBedragUitvoeringsFondsvoordeOverheId,
    this.premieBedragWetArbeIdsOngeschikheIdLaagHoog,
    this.premieBedragWetArbeIdsOngeschikheIdLaag,
    this.premieBedragWetArbeIdsOngeschikheIdHoog,
    this.premieBedragWetKinderopvang,
    this.premieBedragZiektekostenVerzekeringsWetLoon,
    this.payee,
    this.premieBedragZiektekostenVerzekeringsWetWerkgeversbijdrage,
    this.premieBedragZiektekostenVerzekeringsWetWerknemersbijdrage,
    this.werkgeverWhkPremieBedragWgaVastWerkgever,
    this.werkgeverWhkPremieBedragWgaVastWerknemer,
    this.werkgeverWhkPremieBedragFlexWerkgever,
    this.werkgeverWhkPremieBedragFlexWerknemer,
    this.werkgeverWhkPremieBedragZwFlex,
    this.werkgeverWhkPremieBedragTotaal,
    this.nettoTeBetalenSubTotaal,
    this.nettoTeBetalenEindTotaal,
    this.deleted,
    this.actief,
  });

  int? id;
  DateTime? processDatum;
  int? woonlandbeginselId;
  int? tijdvakId;
  double? inkomenWit;
  double? inkomenGroen;
  Werkgever? werkgever;
  Inhouding? inhouding;
  Map<String, double>? premieBedrag;
  String? employeeId;
  DateTime? loonOverVanaf;
  DateTime? loonOverTot;
  DateTime? loonInVanaf;
  DateTime? loonInTot;
  int? algemeneHeffingskortingToegepast;
  double? basisDagen;
  double? inhoudingOpLoonWit;
  double? inhoudingOpLoonGroen;
  double? algemeneHeffingskortingBedrag;
  double? verrekendeArbeIdskorting;
  double? sociaalVerzekeringsloon;
  String? premieBedragAlgemeenWerkloosheIdsFondsLaagHoog;
  double? premieBedragAlgemeenWerkloosheIdsFondsLaag;
  double? premieBedragAlgemeenWerkloosheIdsFondsHoog;
  double? premieBedragDataAlgemeenWerkloosheIdsFondsLaag;
  double? premieBedragDataAlgemeenWerkloosheIdsFondsHoog;
  bool? isPremieBedragUitvoeringsFondsvoordeOverheId;
  double? premieBedragUitvoeringsFondsvoordeOverheId;
  String? premieBedragWetArbeIdsOngeschikheIdLaagHoog;
  double? premieBedragWetArbeIdsOngeschikheIdLaag;
  double? premieBedragWetArbeIdsOngeschikheIdHoog;
  double? premieBedragWetKinderopvang;
  double? premieBedragZiektekostenVerzekeringsWetLoon;
  String? payee;
  double? premieBedragZiektekostenVerzekeringsWetWerkgeversbijdrage;
  double? premieBedragZiektekostenVerzekeringsWetWerknemersbijdrage;
  double? werkgeverWhkPremieBedragWgaVastWerkgever;
  double? werkgeverWhkPremieBedragWgaVastWerknemer;
  double? werkgeverWhkPremieBedragFlexWerkgever;
  double? werkgeverWhkPremieBedragFlexWerknemer;
  double? werkgeverWhkPremieBedragZwFlex;
  double? werkgeverWhkPremieBedragTotaal;
  double? nettoTeBetalenSubTotaal;
  double? nettoTeBetalenEindTotaal;
  bool? deleted;
  bool? actief;

  factory BerekeningenModel.fromJson(Map<String, dynamic> json) => BerekeningenModel(
        id: json["id"],
        processDatum: DateTime.parse(json["processDatum"]),
        woonlandbeginselId: json["woonlandbeginselId"],
        tijdvakId: json["tijdvakId"],
        inkomenWit: json["inkomenWit"],
        inkomenGroen: json["inkomenGroen"],
        werkgever: Werkgever.fromJson(json["werkgever"]),
        inhouding: Inhouding.fromJson(json["inhouding"]),
        premieBedrag: Map.from(json["premieBedrag"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        employeeId: json["employeeId"],
        loonOverVanaf: DateTime.parse(json["loonOverVanaf"]),
        loonOverTot: DateTime.parse(json["loonOverTot"]),
        loonInVanaf: DateTime.parse(json["loonInVanaf"]),
        loonInTot: DateTime.parse(json["loonInTot"]),
        algemeneHeffingskortingToegepast: json["algemeneHeffingskortingToegepast"],
        basisDagen: json["basisDagen"],
        inhoudingOpLoonWit: json["inhoudingOpLoonWit"].toDouble(),
        inhoudingOpLoonGroen: json["inhoudingOpLoonGroen"],
        algemeneHeffingskortingBedrag: json["algemeneHeffingskortingBedrag"],
        verrekendeArbeIdskorting: json["verrekendeArbeIdskorting"],
        sociaalVerzekeringsloon: json["sociaalVerzekeringsloon"],
        premieBedragAlgemeenWerkloosheIdsFondsLaagHoog: json["premieBedragAlgemeenWerkloosheIdsFondsLaagHoog"],
        premieBedragAlgemeenWerkloosheIdsFondsLaag: json["premieBedragAlgemeenWerkloosheIdsFondsLaag"].toDouble(),
        premieBedragAlgemeenWerkloosheIdsFondsHoog: json["premieBedragAlgemeenWerkloosheIdsFondsHoog"].toDouble(),
        isPremieBedragUitvoeringsFondsvoordeOverheId: json["isPremieBedragUitvoeringsFondsvoordeOverheId"],
        premieBedragUitvoeringsFondsvoordeOverheId: json["premieBedragUitvoeringsFondsvoordeOverheId"],
        premieBedragWetArbeIdsOngeschikheIdLaagHoog: json["premieBedragWetArbeIdsOngeschikheIdLaagHoog"],
        premieBedragWetArbeIdsOngeschikheIdLaag: json["premieBedragWetArbeIdsOngeschikheIdLaag"],
        premieBedragWetArbeIdsOngeschikheIdHoog: json["premieBedragWetArbeIdsOngeschikheIdHoog"].toDouble(),
        premieBedragWetKinderopvang: json["premieBedragWetKinderopvang"].toDouble(),
        premieBedragZiektekostenVerzekeringsWetLoon: json["premieBedragZiektekostenVerzekeringsWetLoon"],
        payee: json["payee"],
        premieBedragZiektekostenVerzekeringsWetWerkgeversbijdrage:
            json["premieBedragZiektekostenVerzekeringsWetWerkgeversbijdrage"].toDouble(),
        premieBedragZiektekostenVerzekeringsWetWerknemersbijdrage:
            json["premieBedragZiektekostenVerzekeringsWetWerknemersbijdrage"],
        werkgeverWhkPremieBedragWgaVastWerkgever: json["werkgeverWHKPremieBedragWGAVastWerkgever"].toDouble(),
        werkgeverWhkPremieBedragWgaVastWerknemer: json["werkgeverWHKPremieBedragWGAVastWerknemer"].toDouble(),
        werkgeverWhkPremieBedragFlexWerkgever: json["werkgeverWHKPremieBedragFlexWerkgever"].toDouble(),
        werkgeverWhkPremieBedragFlexWerknemer: json["werkgeverWHKPremieBedragFlexWerknemer"].toDouble(),
        werkgeverWhkPremieBedragZwFlex: json["werkgeverWHKPremieBedragZWFlex"].toDouble(),
        werkgeverWhkPremieBedragTotaal: json["werkgeverWHKPremieBedragTotaal"].toDouble(),
        nettoTeBetalenSubTotaal: json["nettoTeBetalenSubTotaal"].toDouble(),
        nettoTeBetalenEindTotaal: json["nettoTeBetalenEindTotaal"].toDouble(),
        deleted: json["deleted"],
        actief: json["actief"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "processDatum": processDatum?.toIso8601String(),
        "woonlandbeginselId": woonlandbeginselId,
        "tijdvakId": tijdvakId,
        "inkomenWit": inkomenWit,
        "inkomenGroen": inkomenGroen,
        "werkgever": werkgever?.toJson(),
        "inhouding": inhouding?.toJson(),
        "premieBedrag": Map.from(premieBedrag!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "employeeId": employeeId,
        "loonOverVanaf": loonOverVanaf?.toIso8601String(),
        "loonOverTot": loonOverTot?.toIso8601String(),
        "loonInVanaf": loonInVanaf?.toIso8601String(),
        "loonInTot": loonInTot?.toIso8601String(),
        "algemeneHeffingskortingToegepast": algemeneHeffingskortingToegepast,
        "basisDagen": basisDagen,
        "inhoudingOpLoonWit": inhoudingOpLoonWit,
        "inhoudingOpLoonGroen": inhoudingOpLoonGroen,
        "algemeneHeffingskortingBedrag": algemeneHeffingskortingBedrag,
        "verrekendeArbeIdskorting": verrekendeArbeIdskorting,
        "sociaalVerzekeringsloon": sociaalVerzekeringsloon,
        "premieBedragAlgemeenWerkloosheIdsFondsLaagHoog": premieBedragAlgemeenWerkloosheIdsFondsLaagHoog,
        "premieBedragAlgemeenWerkloosheIdsFondsLaag": premieBedragAlgemeenWerkloosheIdsFondsLaag,
        "premieBedragAlgemeenWerkloosheIdsFondsHoog": premieBedragAlgemeenWerkloosheIdsFondsHoog,
        "isPremieBedragUitvoeringsFondsvoordeOverheId": isPremieBedragUitvoeringsFondsvoordeOverheId,
        "premieBedragUitvoeringsFondsvoordeOverheId": premieBedragUitvoeringsFondsvoordeOverheId,
        "premieBedragWetArbeIdsOngeschikheIdLaagHoog": premieBedragWetArbeIdsOngeschikheIdLaagHoog,
        "premieBedragWetArbeIdsOngeschikheIdLaag": premieBedragWetArbeIdsOngeschikheIdLaag,
        "premieBedragWetArbeIdsOngeschikheIdHoog": premieBedragWetArbeIdsOngeschikheIdHoog,
        "premieBedragWetKinderopvang": premieBedragWetKinderopvang,
        "premieBedragZiektekostenVerzekeringsWetLoon": premieBedragZiektekostenVerzekeringsWetLoon,
        "payee": payee,
        "premieBedragZiektekostenVerzekeringsWetWerkgeversbijdrage":
            premieBedragZiektekostenVerzekeringsWetWerkgeversbijdrage,
        "premieBedragZiektekostenVerzekeringsWetWerknemersbijdrage":
            premieBedragZiektekostenVerzekeringsWetWerknemersbijdrage,
        "werkgeverWHKPremieBedragWGAVastWerkgever": werkgeverWhkPremieBedragWgaVastWerkgever,
        "werkgeverWHKPremieBedragWGAVastWerknemer": werkgeverWhkPremieBedragWgaVastWerknemer,
        "werkgeverWHKPremieBedragFlexWerkgever": werkgeverWhkPremieBedragFlexWerkgever,
        "werkgeverWHKPremieBedragFlexWerknemer": werkgeverWhkPremieBedragFlexWerknemer,
        "werkgeverWHKPremieBedragZWFlex": werkgeverWhkPremieBedragZwFlex,
        "werkgeverWHKPremieBedragTotaal": werkgeverWhkPremieBedragTotaal,
        "nettoTeBetalenSubTotaal": nettoTeBetalenSubTotaal,
        "nettoTeBetalenEindTotaal": nettoTeBetalenEindTotaal,
        "deleted": deleted,
        "actief": actief,
      };
}

class Inhouding {
  Inhouding({
    this.inhoudingWit,
    this.inhoudingGroen,
    this.basisDagen,
    this.algemeneHeffingsKorting,
    this.algemeneHeffingsKortingIndicator,
    this.arbeidsKorting,
    this.loontijdvak,
    this.woonlandbeginselId,
    this.inhoudingType,
    this.woonlandbeginselNaam,
    this.nettoBetaling,
  });

  double? inhoudingWit;
  double? inhoudingGroen;
  double? basisDagen;
  double? algemeneHeffingsKorting;
  bool? algemeneHeffingsKortingIndicator;
  double? arbeidsKorting;
  int? loontijdvak;
  int? woonlandbeginselId;
  String? inhoudingType;
  String? woonlandbeginselNaam;
  double? nettoBetaling;

  factory Inhouding.fromJson(Map<String, dynamic> json) => Inhouding(
        inhoudingWit: json["inhoudingWit"].toDouble(),
        inhoudingGroen: json["inhoudingGroen"],
        basisDagen: json["basisDagen"],
        algemeneHeffingsKorting: json["algemeneHeffingsKorting"],
        algemeneHeffingsKortingIndicator: json["algemeneHeffingsKortingIndicator"],
        arbeidsKorting: json["arbeidsKorting"],
        loontijdvak: json["loontijdvak"],
        woonlandbeginselId: json["woonlandbeginselId"],
        inhoudingType: json["inhoudingType"],
        woonlandbeginselNaam: json["woonlandbeginselNaam"],
        nettoBetaling: json["nettoBetaling"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "inhoudingWit": inhoudingWit,
        "inhoudingGroen": inhoudingGroen,
        "basisDagen": basisDagen,
        "algemeneHeffingsKorting": algemeneHeffingsKorting,
        "algemeneHeffingsKortingIndicator": algemeneHeffingsKortingIndicator,
        "arbeidsKorting": arbeidsKorting,
        "loontijdvak": loontijdvak,
        "woonlandbeginselId": woonlandbeginselId,
        "inhoudingType": inhoudingType,
        "woonlandbeginselNaam": woonlandbeginselNaam,
        "nettoBetaling": nettoBetaling,
      };
}

class Werkgever {
  Werkgever({
    this.klant,
    this.id,
    this.naam,
    this.sector,
    this.fiscaalNummer,
    this.loonheffingenExtentie,
    this.omzetbelastingExtentie,
    this.whkPremies,
    this.datumActiefVanaf,
    this.datumActiefTot,
    this.actief,
    this.dateCreated,
    this.dateLastModified,
    this.collectieve,
  });

  Klant? klant;
  String? id;
  String? naam;
  int? sector;
  String? fiscaalNummer;
  String? loonheffingenExtentie;
  String? omzetbelastingExtentie;
  List<WhkPremy>? whkPremies;
  DateTime? datumActiefVanaf;
  DateTime? datumActiefTot;
  bool? actief;
  DateTime? dateCreated;
  DateTime? dateLastModified;
  List<Collectieve>? collectieve;

  factory Werkgever.fromJson(Map<String, dynamic> json) => Werkgever(
        klant: Klant.fromJson(json["klant"]),
        id: json["id"],
        naam: json["naam"],
        sector: json["sector"],
        fiscaalNummer: json["fiscaalNummer"],
        loonheffingenExtentie: json["loonheffingenExtentie"],
        omzetbelastingExtentie: json["omzetbelastingExtentie"],
        whkPremies: List<WhkPremy>.from(json["whkPremies"].map((x) => WhkPremy.fromJson(x))),
        datumActiefVanaf: DateTime.parse(json["datumActiefVanaf"]),
        datumActiefTot: DateTime.parse(json["datumActiefTot"]),
        actief: json["actief"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateLastModified: DateTime.parse(json["dateLastModified"]),
        collectieve: List<Collectieve>.from(json["collectieve"].map((x) => Collectieve.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "klant": klant?.toJson(),
        "id": id,
        "naam": naam,
        "sector": sector,
        "fiscaalNummer": fiscaalNummer,
        "loonheffingenExtentie": loonheffingenExtentie,
        "omzetbelastingExtentie": omzetbelastingExtentie,
        "whkPremies": List<dynamic>.from(whkPremies!.map((x) => x.toJson())),
        "datumActiefVanaf": datumActiefVanaf?.toIso8601String(),
        "datumActiefTot": datumActiefTot?.toIso8601String(),
        "actief": actief,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
        "collectieve": List<dynamic>.from(collectieve!.map((x) => x.toJson())),
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

  String? taxNo;
  String? periode;
  DateTime? processedDate;
  String? collectieveType;
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
        taxNo: json["taxNo"],
        periode: json["periode"],
        processedDate: DateTime.parse(json["processedDate"]),
        collectieveType: json["collectieveType"],
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
        saldoCorrectiesVoorgaandTijdvak: List<SaldoCorrectiesVoorgaandTijdvak>.from(
            json["saldoCorrectiesVoorgaandTijdvak"].map((x) => SaldoCorrectiesVoorgaandTijdvak.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "taxNo": taxNo,
        "periode": periode,
        "processedDate": processedDate?.toIso8601String(),
        "collectieveType": collectieveType,
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
        "saldoCorrectiesVoorgaandTijdvak": List<dynamic>.from(saldoCorrectiesVoorgaandTijdvak!.map((x) => x.toJson())),
      };
}

class SaldoCorrectiesVoorgaandTijdvak {
  SaldoCorrectiesVoorgaandTijdvak({
    this.datAanvTv,
    this.datEindTv,
    this.saldo,
  });

  DateTime? datAanvTv;
  DateTime? datEindTv;
  double? saldo;

  factory SaldoCorrectiesVoorgaandTijdvak.fromJson(Map<String, dynamic> json) => SaldoCorrectiesVoorgaandTijdvak(
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
