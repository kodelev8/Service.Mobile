// To parse this JSON data, do
//
//     final calculationParameters = calculationParametersFromJson(jsonString);

import 'dart:convert';

CalculationParametersModel calculationParametersFromJson(String str) => CalculationParametersModel.fromJson(json.decode(str));

String calculationParametersToJson(CalculationParametersModel data) => json.encode(data.toJson());

class CalculationParametersModel {
  CalculationParametersModel({
   required this.inhoudingParameters,
   required this.premieBedragParameters,
   required this.whkWerkgeverParameters,
   required this.werkgever,
   required this.klantId,
   required this.employeeId,
   required this.premieBedragAlgemeenWerkloosheIdsFondsLaagHoog,
   required this.isPremieBedragUitvoeringsFondsvoordeOverheId,
   required this.premieBedragWetArbeIdsOngeschikheIdLaagHoog,
   required this.payee,
  });

  InhoudingParameters inhoudingParameters;
  PremieBedragParameters premieBedragParameters;
  WhkWerkgeverParameters whkWerkgeverParameters;
  String werkgever;
  int klantId;
  int employeeId;
  String premieBedragAlgemeenWerkloosheIdsFondsLaagHoog;
  bool isPremieBedragUitvoeringsFondsvoordeOverheId;
  String premieBedragWetArbeIdsOngeschikheIdLaagHoog;
  String payee;

  factory CalculationParametersModel.fromJson(Map<String, dynamic> json) => CalculationParametersModel(
    inhoudingParameters: InhoudingParameters.fromJson(json["inhoudingParameters"]),
    premieBedragParameters: PremieBedragParameters.fromJson(json["premieBedragParameters"]),
    whkWerkgeverParameters: WhkWerkgeverParameters.fromJson(json["whkWerkgeverParameters"]),
    werkgever: json["werkgever"],
    klantId: json["klantId"],
    employeeId: json["employeeId"],
    premieBedragAlgemeenWerkloosheIdsFondsLaagHoog: json["premieBedragAlgemeenWerkloosheIdsFondsLaagHoog"],
    isPremieBedragUitvoeringsFondsvoordeOverheId: json["isPremieBedragUitvoeringsFondsvoordeOverheId"],
    premieBedragWetArbeIdsOngeschikheIdLaagHoog: json["premieBedragWetArbeIdsOngeschikheIdLaagHoog"],
    payee: json["payee"],
  );

  Map<String, dynamic> toJson() => {
    "inhoudingParameters": inhoudingParameters.toJson(),
    "premieBedragParameters": premieBedragParameters.toJson(),
    "whkWerkgeverParameters": whkWerkgeverParameters.toJson(),
    "werkgever": werkgever,
    "klantId": klantId,
    "employeeId": employeeId,
    "premieBedragAlgemeenWerkloosheIdsFondsLaagHoog": premieBedragAlgemeenWerkloosheIdsFondsLaagHoog,
    "isPremieBedragUitvoeringsFondsvoordeOverheId": isPremieBedragUitvoeringsFondsvoordeOverheId,
    "premieBedragWetArbeIdsOngeschikheIdLaagHoog": premieBedragWetArbeIdsOngeschikheIdLaagHoog,
    "payee": payee,
  };
}

class InhoudingParameters {
  InhoudingParameters({
   required this.woondlandBeginselId,
   required this.algemeneHeffingsKortingIndicator,
   required this.procesDatum,
   required this.loontijdvak,
   required this.inkomenWit,
   required this.inkomenGroen,
   required this.basisDagen,
   required this.geboortedatum,
  });

  bool algemeneHeffingsKortingIndicator;
  int woondlandBeginselId;
  DateTime procesDatum;
  int loontijdvak;
  num inkomenWit;
  num inkomenGroen;
  int basisDagen;
  DateTime geboortedatum;

  factory InhoudingParameters.fromJson(Map<String, dynamic> json) => InhoudingParameters(
    woondlandBeginselId: json["woondlandBeginselId"],
      algemeneHeffingsKortingIndicator: json["algemeneHeffingsKortingIndicator"],
    procesDatum: DateTime.parse(json["procesDatum"]),
    loontijdvak: json["loontijdvak"],
    inkomenWit: json["inkomenWit"],
    inkomenGroen: json["inkomenGroen"],
    basisDagen: json["basisDagen"],
    geboortedatum: DateTime.parse(json["geboortedatum"]),
  );

  Map<String, dynamic> toJson() => {
    "algemeneHeffingsKortingIndicator": algemeneHeffingsKortingIndicator,
    "woondlandBeginselId": woondlandBeginselId,
    "procesDatum": "${procesDatum.year.toString().padLeft(4, '0')}-${procesDatum.month.toString().padLeft(2, '0')}-${procesDatum.day.toString().padLeft(2, '0')}",
    "loontijdvak": loontijdvak,
    "inkomenWit": inkomenWit,
    "inkomenGroen": inkomenGroen,
    "basisDagen": basisDagen,
    "geboortedatum": "${geboortedatum.year.toString().padLeft(4, '0')}-${geboortedatum.month.toString().padLeft(2, '0')}-${geboortedatum.day.toString().padLeft(2, '0')}",
  };
}

class PremieBedragParameters {
  PremieBedragParameters({
   required this.loonSocialVerzekeringen,
   required this.loonZiektekostenVerzekeringsWet,
   required this.socialeVerzekeringenDatum,
  });

  num loonSocialVerzekeringen;
  num loonZiektekostenVerzekeringsWet;
  DateTime socialeVerzekeringenDatum;

  factory PremieBedragParameters.fromJson(Map<String, dynamic> json) => PremieBedragParameters(
    loonSocialVerzekeringen: json["loonSocialVerzekeringen"],
    loonZiektekostenVerzekeringsWet: json["loonZiektekostenVerzekeringsWet"],
    socialeVerzekeringenDatum: DateTime.parse(json["socialeVerzekeringenDatum"]),
  );

  Map<String, dynamic> toJson() => {
    "loonSocialVerzekeringen": loonSocialVerzekeringen,
    "loonZiektekostenVerzekeringsWet": loonZiektekostenVerzekeringsWet,
    "socialeVerzekeringenDatum": socialeVerzekeringenDatum.toIso8601String(),
  };
}

class WhkWerkgeverParameters {
  WhkWerkgeverParameters({
   required this.taxno,
   required this.inclusiveDate,
  });

  String taxno;
  DateTime inclusiveDate;

  factory WhkWerkgeverParameters.fromJson(Map<String, dynamic> json) => WhkWerkgeverParameters(
    taxno: json["taxno"],
    inclusiveDate: DateTime.parse(json["inclusiveDate"]),
  );

  Map<String, dynamic> toJson() => {
    "taxno": taxno,
    "inclusiveDate": inclusiveDate.toIso8601String(),
  };
}
