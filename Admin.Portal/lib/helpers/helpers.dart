import 'package:intl/intl.dart';
import 'package:prechart_mobile/helpers/endpoint_domains.dart';
import 'package:prechart_mobile/models/personModel.dart' as person;
import 'package:prechart_mobile/models/werkgeverModel.dart' as werkgever;

var currencyFormat = NumberFormat.currency(locale: 'nl_NL', symbol: '€');

String ToDateFormat(DateTime? dateTime) {
  if (dateTime != null) {
    return DateFormat("yyyy-MM-dd").format(dateTime);
  } else {
    return '';
  }
}

String WerkgeverCollectieveTypeEnumToString(werkgever.CollectieveType? collectieveType) {
  if (collectieveType != null) {
    if (collectieveType == werkgever.CollectieveType.NORMAAL) {
      return 'Normaal';
    } else if (collectieveType == werkgever.CollectieveType.CORRECTIE) {
      return 'Correctie';
    } else {
      return '';
    }
  } else {
    return '';
  }
}

String PersonCollectieveTypeEnumToString(person.CollectieveType? collectieveType) {
  if (collectieveType != null) {
    if (collectieveType == person.CollectieveType.NORMAAL) {
      return 'Normaal';
    } else if (collectieveType == person.CollectieveType.CORRECTIE) {
      return 'Correctie';
    } else {
      return '';
    }
  } else {
    return '';
  }
}

String IndArbovOnbepTdEnumToString(person.IndArbovOnbepTdEnum? type) {
  if (type != null && type == person.IndArbovOnbepTdEnum.J) {
    return 'Ja';
  }

  return '';
}

String CdEnumToString(person.Cd? type) {
  if (type != null && type == person.Cd.K) {
    return 'K';
  }

  return '';
}

String IndSa03EnumToString(person.IndSa03Enum? type) {
  if (type != null && type == person.IndSa03Enum.N) {
    return 'N';
  }

  return '';
}

String ToEuro(double? value) {
  if (value != null) {
    return NumberFormat.currency(locale: 'nl_NL', symbol: '€', decimalDigits: 2).format(value);
  } else {
    return '';
  }
}

String LoontidjvakToString(int? loontijdvak) {
  switch (loontijdvak) {
    case 1:
      return 'Dag';
    case 2:
      return 'Week';
    case 3:
      return 'Vier Wekelijks';
    case 4:
      return 'Maand';
    case 5:
      return 'Kwartaal';
    default:
      return '';
  }
}

String IdToWoonland(int? id) {
  switch (id) {
    case 1:
      return 'Nederland';
    case 2:
      return 'België';
    case 3:
      return 'Landenkring';
    case 4:
      return 'Derde Landen';
    case 5:
      return 'Suriname/Aruba';
    default:
      return '';
  }
}
