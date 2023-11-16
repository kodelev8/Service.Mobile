import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';
import 'package:prechart_mobile/endpoints/endpoints.dart';
import 'package:prechart_mobile/helpers/helpers.dart';
import 'package:prechart_mobile/models/berekeningenModel.dart' as berekeningen;
import 'package:prechart_mobile/models/calculationParametersModel.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart';
import 'package:prechart_mobile/providers/calculation_current_page_provider.dart';
import 'package:prechart_mobile/providers/endpoint_servers_provider.dart';
import 'package:prechart_mobile/providers/taxJaar_provider.dart';
import 'package:prechart_mobile/providers/user_token_provider.dart';
import 'package:prechart_mobile/providers/werkgever_provider.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CalculationParameters extends StatefulWidget {
  const CalculationParameters({Key? key}) : super(key: key);

  @override
  State<CalculationParameters> createState() => _CalculationParametersState();
}

class _CalculationParametersState extends State<CalculationParameters> {
  berekeningen.BerekeningenModel? _berekeningen;

  PageController pageCalculationController = PageController();
  static const _locale = 'nl_NL';
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  int? _selectedWoonlandIndex = null;
  int? _selectedLoonTijdvakIndex = null;
  int _selectedWerkgeverIndex = 1;
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;

  double? _algemeneWerkloosheidsFonds = 0.0;
  int? _algemeneWerkloosheidsFondsIndex = 0;

  double? _wetArbeidsOngeschikheid = 0.0;
  int? _wetArbeidsOngeschikheidIndex = 0;

  List<DropdownMenuItem> _taxNumbersItems = [];
  List<String> _taxNumbers = [];
  int _minTaxYears = DateTime.now().year;
  int _maxTaxYears = DateTime.now().year;

  DateTime currentDate = DateTime.now();

  TextEditingController selectedProcessDate = TextEditingController();
  TextEditingController selectedBirthDate = TextEditingController();
  TextEditingController selectedWerkgever = TextEditingController();

  TextEditingController inputGreen = TextEditingController();
  TextEditingController inputWhite = TextEditingController();
  TextEditingController inputBasicDagen = TextEditingController();

  bool _algemeneVoorwaarden = false;

  @override
  void initState() {
    super.initState();
    selectedProcessDate.text = '';
    selectedBirthDate.text = '2000-01-01';
    selectedWerkgever.text = '';
    inputGreen.text = '0,00';
    inputWhite.text = '0,00';
    inputBasicDagen.text = '';
    _taxNumbersItems = [];

    preFetchData();
  }

  @override
  void dispose() {
    super.dispose();
    selectedProcessDate.dispose();
    selectedBirthDate.dispose();
    selectedWerkgever.dispose();
    inputGreen.dispose();
    inputWhite.dispose();
    inputBasicDagen.dispose();
  }

  void preFetchData() async {
    List<int>? taxYears;
    List<Werkgever>? werkgevers;
    var tokens = context.read<UserTokens>().user;
    var servers = context.read<EndPointServers>().Endpoints!;

    if (context.read<TaxJaarLists>().taxJaar.isEmpty) {
      taxYears = await Endpoints(endpoint: servers).getTaxYears(tokens);
      context.read<TaxJaarLists>().setTaxJaar(taxYears);
    }

    if (context.read<WerkgeversLists>().werkgevers.isEmpty) {
      werkgevers = await Endpoints(endpoint: servers).getWerkgevers(tokens);
      context.read<WerkgeversLists>().setWerkgevers(werkgevers);
    }

    taxYears = context.read<TaxJaarLists>().taxJaar;
    werkgevers = context.read<WerkgeversLists>().werkgevers;

    setState(() {
      if (werkgevers != null && werkgevers.isNotEmpty) {
        _taxNumbersItems.clear();
        _taxNumbers.clear();

        var counter = 0;

        for (var werkgever in werkgevers) {
          counter++;
          _taxNumbers.add(werkgever.fiscaalNummer);

          _taxNumbersItems.add(DropdownMenuItem(
            child: Text(werkgever.fiscaalNummer),
            value: counter,
          ));
        }
      }

      if (taxYears != null && taxYears.isNotEmpty) {
        _maxTaxYears = taxYears.reduce(math.max);
        _minTaxYears = taxYears.reduce(math.min);
      }
    });
  }

  Future<Map<String, dynamic>> calculate() async {
    try {
      InhoudingParameters inhoudingParameters = InhoudingParameters(
        algemeneHeffingsKortingIndicator: _algemeneVoorwaarden,
        woondlandBeginselId: _selectedWoonlandIndex!,
        procesDatum: DateTime.parse(selectedProcessDate.text),
        loontijdvak: _selectedLoonTijdvakIndex!,
        inkomenWit: currencyFormat.parse(inputWhite.text.replaceAll(_currency, '')),
        inkomenGroen: currencyFormat.parse(inputGreen.text.replaceAll(_currency, '')),
        basisDagen: _selectedLoonTijdvakIndex == 1 ? int.parse(inputBasicDagen.text) : 1,
        geboortedatum: DateTime.parse(selectedBirthDate.text),
      );

      PremieBedragParameters premieBedragParameters = PremieBedragParameters(
        loonSocialVerzekeringen: currencyFormat.parse(inputWhite.text.replaceAll(_currency, '')),
        loonZiektekostenVerzekeringsWet: currencyFormat.parse(inputWhite.text.replaceAll(_currency, '')),
        socialeVerzekeringenDatum: DateTime.parse(selectedProcessDate.text),
      );

      WhkWerkgeverParameters whkWerkgeverParameters = WhkWerkgeverParameters(
        taxno: selectedWerkgever.text,
        inclusiveDate: DateTime.parse(selectedProcessDate.text),
      );

      CalculationParametersModel calculationParameters = CalculationParametersModel(
        inhoudingParameters: inhoudingParameters,
        premieBedragParameters: premieBedragParameters,
        whkWerkgeverParameters: whkWerkgeverParameters,
        werkgever: selectedWerkgever.text,
        klantId: 1,
        employeeId: 1,
        premieBedragAlgemeenWerkloosheIdsFondsLaagHoog: "Hoog",
        isPremieBedragUitvoeringsFondsvoordeOverheId: false,
        premieBedragWetArbeIdsOngeschikheIdLaagHoog: "Hoog",
        payee: "Werkgever",
      );

      var servers = context.read<EndPointServers>().Endpoints!;
      var tokens = context.read<UserTokens>().user;
      _berekeningen = await Endpoints(endpoint: servers).calculateBerekeningen(calculationParameters, tokens);

      if (_berekeningen == null) {
        return {'isOk': false, 'message': 'Something went wrong during the calculation process.'};
      }

      setState(() {
        _algemeneWerkloosheidsFondsIndex = 0;
        _algemeneWerkloosheidsFonds = _berekeningen?.premieBedrag!['premieBedragAlgemeenWerkloosheidsFondsHoog'];

        _wetArbeidsOngeschikheidIndex = 0;
        _wetArbeidsOngeschikheid = _berekeningen?.premieBedrag!['premieBedragWetArbeidsOngeschikheidHoog'];
      });

      return {'isOk': true, 'message': 'Successfully Calculated'};
    } catch (e) {
      return {'isOk': false, 'message': e.toString()};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berekeningen'),
        centerTitle: true,
        leading: context.read<CalculationCurrentPage>().currentPage == 1
            ? IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  pageCalculationController.animateToPage(0,
                      duration: Duration(milliseconds: 200), curve: Curves.linear);
                },
              )
            : null,
        actions: [
          context.read<CalculationCurrentPage>().currentPage == 0
              ? IconButton(
                  icon: Icon(Icons.arrow_forward_rounded),
                  onPressed: () {
                    pageCalculationController.animateToPage(1,
                        duration: Duration(milliseconds: 200), curve: Curves.linear);
                  },
                )
              : Container(),
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            context.read<CalculationCurrentPage>().setCurrentPage(index);
          });
        },
        controller: pageCalculationController,
        children: [
          Container(
            color: Colors.white,
            child: Page1(context),
          ),
          Container(color: Colors.white, child: Page2(context)),
        ],
      ),
      // ]),
    );
  }

  Widget Page1(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          //Woonland
          Woonland(context),

          //processdate
          ProcessDate(context),

          //loontijdvak
          loontijdvak(context),

          //input white
          White(context),

          //input green
          Green(context),

          //birthdate
          BirthDate(context),

          //basis dagen
          BasisDagen(context),

          //werkgevers
          WerkgeverDropDownBox(context),

          //algemene
          AlgemeneIndicator(context),

          //button
          // CalculateButton(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: !CanCalculate()
                      ? null
                      : () async {
                          const message = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Berekening wordt uitgevoerd'),
                            duration: Duration(days: 1),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(message);

                          var result = await calculate();

                          Future.delayed(Duration(seconds: 2), () {
                            if (result['isOk']) {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              pageCalculationController.animateToPage(1,
                                  duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                            } else {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();

                              final error = SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Text(result['message']),
                                duration: Duration(seconds: 10),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                  },
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(error);
                            }
                          });
                          // calculate();
                        },
                  child: const Text('Bereken'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Page2(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            switch (index) {
              case 0:
                _isExpanded1 = !_isExpanded1;
                break;
              case 1:
                _isExpanded2 = !_isExpanded2;
                break;
              case 2:
                _isExpanded3 = !_isExpanded3;
                break;
              case 3:
                _isExpanded4 = !_isExpanded4;
                break;
            }
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const Text('Resultaat Bruto Netto');
            },
            body: ResultaatBrutoNetto(),
            isExpanded: _isExpanded1,
            canTapOnHeader: true,
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const Text('Resultaat Sociale Verzekeringen zonder WHK');
            },
            body: ResultaatSocialeVerzekeringenZonderWHK(),
            isExpanded: _isExpanded2,
            canTapOnHeader: true,
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const Text('Ziektekosten Verzekerings Wet');
            },
            body: ZiektekostenVerzekeringsWet(),
            isExpanded: _isExpanded3,
            canTapOnHeader: true,
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const Text('Resultaat WHK');
            },
            body: ResultaatWHK(),
            isExpanded: _isExpanded4,
            canTapOnHeader: true,
          ),
        ],
      ),
    );
  }

  Widget ResultaatWHK() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('Sociale Verzekeringen Premieloon'),
            subtitle: Text(ToEuro(_berekeningen?.premieBedrag?['premieBedragSocialeVerzekeringenPremieloon'])),
          ),
          ListTile(
            title: Text('WGA Vast Werkgever'),
            subtitle: Text(ToEuro(_berekeningen?.werkgeverWhkPremieBedragWgaVastWerkgever)),
          ),
          ListTile(
            title: Text('WGA Vast Werknemer'),
            subtitle: Text(ToEuro(_berekeningen?.werkgeverWhkPremieBedragWgaVastWerknemer)),
          ),
          ListTile(
            title: Text('Flex Werkgever'),
            subtitle: Text(ToEuro(_berekeningen?.werkgeverWhkPremieBedragFlexWerkgever)),
          ),
          ListTile(
            title: Text('Flex Werknemer'),
            subtitle: Text(ToEuro(_berekeningen?.werkgeverWhkPremieBedragFlexWerknemer)),
          ),
          ListTile(
            title: Text('ZW Flex'),
            subtitle: Text(ToEuro(_berekeningen?.werkgeverWhkPremieBedragZwFlex)),
          ),
          ListTile(
            title: Text('Totaal'),
            subtitle: Text(ToEuro(_berekeningen?.werkgeverWhkPremieBedragTotaal)),
          ),
          ListTile(
            title: Text('Netto Te Betalen Sub Totaal'),
            subtitle: Text(ToEuro(_berekeningen?.nettoTeBetalenSubTotaal)),
          ),
          ListTile(
            title: Text('Netto Te Betalen Eind Totaal'),
            subtitle: Text(ToEuro(_berekeningen?.nettoTeBetalenEindTotaal)),
          ),
        ],
      ),
    );
  }

  Widget ZiektekostenVerzekeringsWet() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('Ziektekosten Verzekerings Wet Loon'),
            subtitle: Text(ToEuro(_berekeningen?.premieBedrag?['premieBedragZiektekostenVerzekeringsWetLoon'])),
          ),
          ListTile(
            isThreeLine: true,
            title: Text('Ziektekosten Verzekerings Wet'),
            subtitle: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wergever'),
                      Text(ToEuro(
                          _berekeningen?.premieBedrag?['premieBedragZiektekostenVerzekeringsWetWerkgeversbijdrage'])),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Werknemer'),
                      Text(ToEuro(
                          _berekeningen?.premieBedrag?['premieBedragZiektekostenVerzekeringsWetWerknemersbijdrage'])),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ResultaatSocialeVerzekeringenZonderWHK() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('Sociale Verzekeringen Premieloon'),
            subtitle: Text(ToEuro(_berekeningen?.sociaalVerzekeringsloon)),
          ),
          ListTile(
            title: Text('Algemene Werkloosheids Fonds'),
            subtitle: Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: ToggleSwitch(
                      // minWidth: 90.0,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Colors.green[800]!],
                        [Colors.red[800]!]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: _algemeneWerkloosheidsFondsIndex,
                      totalSwitches: 2,
                      labels: ['Hoog', 'Laag'],
                      radiusStyle: true,
                      onToggle: (index) {
                        setState(() {
                          switch (index) {
                            case 0:
                              _algemeneWerkloosheidsFonds =
                                  _berekeningen?.premieBedrag!['premieBedragAlgemeenWerkloosheidsFondsHoog'];
                              break;
                            case 1:
                              _algemeneWerkloosheidsFonds =
                                  _berekeningen?.premieBedrag!['premieBedragAlgemeenWerkloosheidsFondsLaag'];
                              break;
                          }

                          _algemeneWerkloosheidsFondsIndex = index;
                        });
                      },
                    ),
                  ),
                  Text(ToEuro(_algemeneWerkloosheidsFonds))
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Wet Kinderopvang'),
            subtitle: Text(ToEuro(_berekeningen?.premieBedrag?['premieBedragWetKinderopvang'])),
          ),
          ListTile(
            title: Text('Wet Arbeids Ongeschikheid'),
            subtitle: Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: ToggleSwitch(
                      // minWidth: 90.0,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Colors.green[800]!],
                        [Colors.red[800]!],
                        [Colors.yellow[800]!]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: _wetArbeidsOngeschikheidIndex,
                      totalSwitches: 3,
                      labels: ['Hoog', 'Laag', 'Ufo'],
                      radiusStyle: true,
                      onToggle: (index) {
                        setState(() {
                          switch (index) {
                            case 0:
                              _wetArbeidsOngeschikheid =
                                  _berekeningen?.premieBedrag!['premieBedragWetArbeidsOngeschikheidHoog'];
                              break;
                            case 1:
                              _wetArbeidsOngeschikheid =
                                  _berekeningen?.premieBedrag!['premieBedragWetArbeidsOngeschikheidLaag'];
                              break;
                            case 2:
                              _wetArbeidsOngeschikheid =
                                  _berekeningen?.premieBedrag!['premieBedragUitvoeringsFondsvoordeOverheid'];
                              break;
                          }

                          _wetArbeidsOngeschikheidIndex = index;
                        });
                      },
                    ),
                  ),
                  Text(ToEuro(_wetArbeidsOngeschikheid))
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Wet Langdurige Zorg'),
            subtitle: Text(ToEuro(_berekeningen?.premieBedrag?['premieBedragWetLangdurigeZorg'])),
          ),
        ],
      ),
    );
  }

  Widget ResultaatBrutoNetto() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('Inkomen Wit'),
            subtitle: Text(ToEuro(_berekeningen?.inkomenWit)),
          ),
          ListTile(
            title: Text('Inkomen Groen'),
            subtitle: Text(ToEuro(_berekeningen?.inkomenGroen)),
          ),
          ListTile(
            title: Text('Basis Dagen'),
            subtitle: Text(ToEuro(_berekeningen?.basisDagen)),
          ),
          ListTile(
            title: Text('Loontijdvak'),
            subtitle: Text(LoontidjvakToString(_berekeningen?.tijdvakId)),
          ),
          ListTile(
            title: Text('Woonlandbeginsel'),
            subtitle: Text(IdToWoonland(_berekeningen?.woonlandbeginselId)),
          ),
          ListTile(
            title: Text('Inhoudingstype'),
            subtitle: Text(_berekeningen?.inhouding?.inhoudingType ?? ''),
          ),
          ListTile(
            title: Text('Algemene Heffingskorting Indicator'),
            subtitle: Text((_berekeningen?.inhouding?.algemeneHeffingsKortingIndicator ?? false) ? 'Ja' : 'Nee'),
          ),
          ListTile(
            title: Text('Inhouding Wit'),
            subtitle: Text(ToEuro(_berekeningen?.inhouding?.inhoudingWit)),
          ),
          ListTile(
            title: Text('Inhouding Groen'),
            subtitle: Text(ToEuro(_berekeningen?.inhouding?.inhoudingGroen)),
          ),
          ListTile(
            title: Text('Algemene Heffingskorting'),
            subtitle: Text(ToEuro(_berekeningen?.inhouding?.algemeneHeffingsKorting)),
          ),
          ListTile(
            title: Text('Verrekende Arbeidskorting'),
            subtitle: Text(ToEuro(_berekeningen?.inhouding?.arbeidsKorting)),
          ),
          ListTile(
            title: Text('Netto te betalen'),
            subtitle: Text(ToEuro(_berekeningen?.inhouding?.nettoBetaling)),
          ),
        ],
      ),
    );
  }

  Widget Woonland(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Woonland'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownButton(
                    hint: const Text('Selecteer woonland'),
                    value: _selectedWoonlandIndex,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        child: const Text('Nederland'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: const Text('België'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: const Text('Landenkring'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: const Text('Derde Landen'),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: const Text('Suriname/Aruba'),
                        value: 5,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedWoonlandIndex = value;
                        CanCalculate();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ProcessDate(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Processdatum'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'YYYY-MM-DD',
                    ),
                    controller: selectedProcessDate,
                    readOnly: true,
                    onTap: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(_minTaxYears, 1),
                        lastDate: DateTime(_maxTaxYears, 12, 31),
                      );

                      if (date != null) {
                        setState(() {
                          selectedProcessDate.text = ToDateFormat(date);
                          CanCalculate();
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loontijdvak(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Loontijdvak'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownButton(
                    hint: const Text('Selecteer loontijdvak'),
                    items: const [
                      DropdownMenuItem(
                        child: Text('Dag'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Week'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Vier Wekelijks'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('Maand'),
                        value: 4,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedLoonTijdvakIndex = value;

                        switch (_selectedLoonTijdvakIndex) {
                          case 2:
                            inputBasicDagen.text = '5';
                            break;
                          case 3:
                            inputBasicDagen.text = '20';
                            break;
                          case 4:
                            inputBasicDagen.text = '21,75';
                            break;
                          default:
                            inputBasicDagen.text = '1';
                        }

                        CanCalculate();
                      });
                    },
                    value: _selectedLoonTijdvakIndex,
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget White(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Inkomen Wit'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                      controller: inputWhite,
                      decoration: InputDecoration(
                        hintText: 'Vul hier het aantal witte dagen in',
                        hintStyle: TextStyle(fontSize: 12),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            inputWhite.clear();
                          },
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        CurrencyTextInputFormatter(
                          locale: 'nl_NL',
                          decimalDigits: 2,
                          symbol: '',
                        )
                        // CurrencyInputFormatter(
                        //     // leadingSymbol: _currency,
                        //     useSymbolPadding: true,
                        //     thousandSeparator: ThousandSeparator.Period,
                        //     mantissaLength: 2,
                        // )
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Green(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Inkomen Groen'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                      controller: inputGreen,
                      decoration: InputDecoration(
                        hintText: 'Vul hier het aantal groene dagen in',
                        hintStyle: TextStyle(fontSize: 12),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            inputGreen.clear();
                          },
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        CurrencyTextInputFormatter(
                          locale: 'nl_NL',
                          decimalDigits: 2,
                          symbol: '',
                        )
                        // CurrencyInputFormatter(
                        //     leadingSymbol: _currency,
                        //     useSymbolPadding: true,
                        //     thousandSeparator: ThousandSeparator.Period,
                        //     mantissaLength: 2)
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BirthDate(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Geboortedatum'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'YYYY-MM-DD',
                    ),
                    controller: selectedBirthDate,
                    readOnly: true,
                    onTap: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                      );

                      if (date != null) {
                        setState(() {
                          selectedBirthDate.text = ToDateFormat(date);
                          CanCalculate();
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BasisDagen(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Basis Dagen'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                      controller: inputBasicDagen,
                      decoration: const InputDecoration(
                        hintText: 'Vul hier het aantal groene dagen in',
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget WerkgeverDropDownBox(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Werkgever'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownButton(
                    items: _taxNumbersItems,
                    value: _selectedWerkgeverIndex,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedWerkgever.text = _taxNumbers.elementAt(value - 1);
                        _selectedWerkgeverIndex = value;
                        CanCalculate();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget AlgemeneIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Algemene Heffingskorting Indicator',
          style: TextStyle(fontSize: 12),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Checkbox(
              value: _algemeneVoorwaarden,
              onChanged: (value) {
                setState(() {
                  _algemeneVoorwaarden = value!;
                  CanCalculate();
                });
              }),
        ),
      ],
    );
  }

  bool CanCalculate() =>
      _selectedWoonlandIndex != null &&
      _selectedWerkgeverIndex != null &&
      _selectedLoonTijdvakIndex != null &&
      _selectedLoonTijdvakIndex != 0 &&
      _selectedWerkgeverIndex != 0 &&
      _selectedWoonlandIndex != 0 &&
      inputWhite.text.isNotEmpty &&
      inputGreen.text.isNotEmpty &&
      inputBasicDagen.text.isNotEmpty &&
      selectedBirthDate.text.isNotEmpty &&
      selectedProcessDate.text.isNotEmpty &&
      inputBasicDagen.text.isNotEmpty;
}
