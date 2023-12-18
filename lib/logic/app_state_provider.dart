import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../data/models/models.dart';

final refAppStateProvider =
    NotifierProvider<AppStateProvider, AppState>(() => AppStateProvider());

//!

class AppStateProvider extends Notifier<AppState> {
  @override
  AppState build() => AppState(
        input: 1.5,
        currencies: [
          Currency(
            name: 'Dollar',
            code: 'USD',
            isCypto: false,
            symbol: '\$',
            exchangeRate: 1.1,
          ),
          Currency(
            name: 'Euro',
            code: 'EUR',
            isCypto: false,
            symbol: '€',
            exchangeRate: 1.0,
          ),
          Currency(
            name: 'Pound',
            code: 'GBP',
            isCypto: false,
            symbol: '£',
            exchangeRate: 0.78,
          ),
          Currency(
              name: 'Arabische Dirham',
              code: 'AED',
              isCypto: false,
              symbol: 'د. إ',
              exchangeRate: 0.25),
        ],
        to: 'EU',
        countries: [
          Country(
            name: 'USA',
            urlFlag: 'assets/us-flag.png',
            // urlFlag:
            //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYmGahfEnGMsDpFFmpF61UdX225_aXWAwQz2n6KYiKKzMH2ZgreTcIg0C3gKWGDUQOyaU&usqp=CAU',
            currency: 'USD',
          ),
          Country(
            name: 'EU',
            urlFlag: 'assets/eu-flag.png',
            // urlFlag:
            //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ZbRbmPx32hgxg3G_l1g4JGX0VjbTD-ZJXoT_TNw507DbN6nqaaap98AqETu4PcbSad4&usqp=CAU',
            currency: 'EUR',
          ),
          Country(
            name: 'ENG',
            urlFlag: 'assets/gb-flag.png',
            // urlFlag:
            //     'https://media.istockphoto.com/id/854115776/de/foto/flagge-von-england.jpg?s=612x612&w=0&k=20&c=2WZv964ANrMWsdGPnVlUJ56q49NKe6LpZUduHJtWT7M=',
            currency: 'GBP',
          ),
          Country(name: 'Arabisch', urlFlag: 'urlFlag', currency: 'AED'),
        ],
        from: 'USA',
      );

//! Switchfromto Methode Tauscht die Ausgangs und Zielwährung aus,
//! Indem sie den Zustand mit den neuen werten aktualisiert.
  void switchFromTo() {
    final newTo = state.from;
    final newFrom = state.to;
    state = state.copyWith(to: newTo, from: newFrom);
  }

//! Methode aktualisiert den Eingabewert basierend auf einem übergebenen String
//! Der String kann Kommas oder Punkte als Dezimaltrennzeichen erhalten.
//! die Methode versucht, ihn in einen Gleitkommawert umzuwandeln
  void setInputByString(String value) {
    final replacedCommas = value.replaceAll(',', '.');
    var newInput = double.tryParse(replacedCommas) ?? 0.0;
    log('newInput: $newInput');
    state = state.copyWith(input: newInput);
  }

  void setFromTo(Country? country, String fromTo) {
    if (fromTo == 'from') {
      // currency = appState.fromCurrency;
      state = state.copyWith(from: country?.name);
    } else {
      // currency = appState.toCurrency;
      state = state.copyWith(to: country?.name);
    }
  }

  ///Funktion, um Währungsumrechnungsinformationen von einer externen API abzurufen

  void getConversion() async {
    ///API-URL für die ExchangeRate-API (USD als Basiswährung)
    final apiUrl =
        'https://v6.exchangerate-api.com/v6/873a7cab0f3c067a9736193a/latest/USD';

    try {
      ///Sendet eine HTTP-GET-Anfrage an die API und wartet auf die Antwort
      Response response = await get(Uri.parse(apiUrl));

      ///Überprüft den Statuscode der Antwort
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['result'] == 'success') {
          String baseCode = data['base_code'];
          Map<String, dynamic> conversionRates = data['conversion_rates'];
          print('meinemap: $conversionRates');
          print('${conversionRates["AED"]}');
          // Accessing conversion rates for each currency

          //Erstelle eine Liste der API-Währungen

          double usdToAED =
              conversionRates['AED']; // Example: USD to AED conversion rate

          // Print base code and conversion rates
          print('Base Code: $baseCode');
          print('Conversion rate from USD to AED: $usdToAED');
        } else {
          print('API request failed: ${data['error']}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

