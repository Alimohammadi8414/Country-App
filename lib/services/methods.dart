import 'package:arz8/model/country.dart';
import 'package:arz8/data/http_client.dart';

class Services {
  static List<CountryModel> bordercountry = [];
  static List<CountryModel> countryList = [];
  static Future<List<CountryModel>> getcountry() async {
    var response = await httpClient.get(
      'all?fields=name,tld,flags,currencies,capital,region,subregion,languages,borders,population',
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      countryList.clear();
      for (var element in response.data) {
        countryList.add(CountryModel.fromJson(element));
      }
      return countryList;
    }
    throw Exception();
  }

  static Future<List<CountryModel>> getcountrybyname(String name) async {
    var response = await httpClient.get('name/$name');
    if (response.statusCode == 200 || response.statusCode == 201) {
      countryList.clear();
      for (var element in response.data) {
        countryList.add(CountryModel.fromJson(element));
      }
      return countryList;
    }
    throw Exception();
  }

  static Future<List<CountryModel>> dropdown(String regoion) async {
    var response = await httpClient.get('region/$regoion');
    if (response.statusCode == 200 || response.statusCode == 201) {
      countryList.clear();

      for (var element in response.data) {
        countryList.add(CountryModel.fromJson(element));
      }
      return countryList;
    }
    throw Exception();
  }

  static Future<List<CountryModel>> codeserach(String code) async {
    var response = await httpClient.get('alpha/$code');
    if (response.statusCode == 200 || response.statusCode == 201) {
      bordercountry.clear();
      for (var element in response.data) {
        bordercountry.add(CountryModel.fromJson(element));
      }
      return bordercountry;
    }
    throw Exception();
  }
}
