class PhoneChecker {
  static final List<String> countries = [
    "Austria",
    "Belgium",
    "Bulgaria",
    "Croatia",
    "Czech Republic",
    "Denmark",
    "Estonia",
    "Finland",
    "France",
    "Germany",
    "Greece",
    "Hungary",
    "Ireland",
    "Italy",
    "Latvia",
    "Lithuania",
    "Luxembourg",
    "Malta",
    "Netherlands",
    "Poland",
    "Portugal",
    "Turkey",
    "Romania",
    "Slovakia",
    "Slovenia",
    "Spain",
    "Sweden"
  ];

  static String countryCodeSwitch(String? value) {
    String _countryCode = '';

    switch (value) {
      case "Austria":
        _countryCode = "+43";
        break;
      case "Belgium":
        _countryCode = "+32";
        break;
      case "Bulgaria":
        _countryCode = "+359";
        break;
      case "Croatia":
        _countryCode = "+385";
        break;
      case "Czech Republic":
        _countryCode = "+420";
        break;
      case "Denmark":
        _countryCode = "+45";
        break;
      case "Estonia":
        _countryCode = "+372";
        break;
      case "Finland":
        _countryCode = "+358";
        break;
      case "France":
        _countryCode = "+358";
        break;
      case "Germany":
        _countryCode = "+49";
        break;
      case "Greece":
        _countryCode = "+30";
        break;
      case "Hungary":
        _countryCode = "+36";
        break;
      case "Ireland":
        _countryCode = "+353";
        break;
      case "Italy":
        _countryCode = "+39";
        break;
      case "Latvia":
        _countryCode = "+371";
        break;
      case "Lithuania":
        _countryCode = "+370";
        break;
      case "Luxembourg":
        _countryCode = "+352";
        break;
      case "Malta":
        _countryCode = "+356";
        break;
      case "Netherlands":
        _countryCode = "+31";
        break;
      case "Poland":
        _countryCode = "+48";
        break;
      case "Portugal":
        _countryCode = "+351";
        break;
      case "Turkey":
        _countryCode = "+90";
        break;
      case "Romania":
        _countryCode = "+40";
        break;
      case "Slovakia":
        _countryCode = "+386";
        break;
      case "Slovenia":
        _countryCode = "+386";
        break;
      case "Spain":
        _countryCode = "+34";
        break;
      case "Sweden":
        _countryCode = "+46";
        break;
      default:
        _countryCode = '';
    }
    return _countryCode;
  }
}
