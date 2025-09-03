import 'package:arz8/Screens/Home/home.dart';
import 'package:arz8/models/country.dart';
import 'package:arz8/data/http_client.dart';

class Homemethods {
  static List<Country> bordercountry = [];
  static List<Country> countryList = [];
  static Future<List<Country>> getcountry() async {
    var response = await httpClient.get(
      'all?fields=name,tld,flags,currencies,capital,region,subregion,languages,borders,population',
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      countryList.clear();
      for (var element in response.data) {
        countryList.add(Country.fromJson(element));
        pagestarted.value = 1;
      }
      return countryList;
    }

    throw Exception('Error');
  }

  static Future<List<Country>> getcountrybyname(String name) async {
    var response = await httpClient.get('name/$name');
    if (response.statusCode == 200 || response.statusCode == 201) {
      countryList.clear();
      for (var element in response.data) {
        countryList.add(Country.fromJson(element));
        pagestarted.value = 2;
      }
      return countryList;
    }
    throw Exception();
  }

  static Future<List<Country>> dropdown(String regoion) async {
    var response = await httpClient.get('region/$regoion');
    if (response.statusCode == 200 || response.statusCode == 201) {
      countryList.clear();
      pagestarted.value = pagestarted.value + 1;
      for (var element in response.data) {
        countryList.add(Country.fromJson(element));
        pagestarted.value = 0;
      }
      return countryList;
    }
    throw Exception();
  }

  static Future<List<Country>> codeserach(String code) async {
    var response = await httpClient.get('alpha/$code');
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var element in response.data) {
        bordercountry.clear();
        bordercountry.add(Country.fromJson(element));
      }
      return bordercountry;
    }
    throw Exception();
  }
}
