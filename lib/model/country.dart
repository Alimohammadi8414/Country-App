class CountryModel {
  final String? name;
  final List<String>? tld;
  final String? flagPng;
  final String? flagSvg;
  final Map<String, dynamic>? currencies;
  final List<String>? capital;
  final String? region;
  final String? subregion;
  final Map<String, String>? languages;
  final List<String>? borders;
  final int? population;

  CountryModel({
    this.name,
    this.tld,
    this.flagPng,
    this.flagSvg,
    this.currencies,
    this.capital,
    this.region,
    this.subregion,
    this.languages,
    this.borders,
    this.population,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'],
      tld: json["tld"] != null ? List<String>.from(json["tld"]) : [],
      flagPng: json["flags"]["png"] ?? "",
      flagSvg: json["flags"]["svg"] ?? "",
      currencies:
          json["currencies"] != null
              ? Map<String, dynamic>.from(json["currencies"])
              : {},
      capital:
          json["capital"] != null ? List<String>.from(json["capital"]) : [],
      region: json["region"] ?? "",
      subregion: json["subregion"] ?? "",
      languages:
          json["languages"] != null
              ? Map<String, String>.from(json["languages"])
              : {},
      borders:
          json["borders"] != null ? List<String>.from(json["borders"]) : [],
      population: json["population"] ?? 0,
    );
  }
}
