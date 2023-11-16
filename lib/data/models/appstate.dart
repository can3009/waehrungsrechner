import 'dart:developer';

import 'package:waehrungsrechner/data/models/currency/currency.dart';

import 'models.dart';

// Klassen erweitern und attribute und methoden
// TODO: - app anschauen
// https://riverpod.dev/docs/providers/state_notifier_provider

// unit test schreiben .

class AppState {
  final String from;
  final String to;
  final List<Country> countries;
  final List<Currency> currencies;
  final double input;
  AppState({
    required this.to,
    required this.from,
    required this.countries,
    required this.currencies,
    required this.input,
  });

  Country? get fromCountry {
    log('from: $from');
    for (final c in countries) {
      if (c.name == from) {
        return c;
      }
    }
    return null;
  }

  Currency? get fromCurrency {
    final country = fromCountry;
    if (country == null) return null;
    for (final c in currencies) {
      if (c.code == country.currency) {
        return c;
      }
    }
    return null;
  }

  Country? get toCountry {
    for (final c in countries) {
      if (c.name == to) {
        return c;
      }
    }
    return null;
  }

  Currency? get toCurrency {
    final country = toCountry;
    log('toCuntry: $country');
    if (country == null) return null;
    for (final c in currencies) {
      if (c.code == country.currency) {
        return c;
      }
    }
    return null;
  }

  double get output {
    final fromExchangeRate = fromCurrency?.exchangeRate;
    final toExchangeRate = toCurrency?.exchangeRate;
    if (fromExchangeRate == null) {
      log('fromExchangeRate == null');
      return 0.0;
    }
    if (toExchangeRate == null) {
      log('toExchangeRate == null');

      return 0.0;
    }
    return input / fromExchangeRate * toExchangeRate;
  }

  AppState copyWith({
    String? from,
    String? to,
    List<Country>? countries,
    List<Currency>? currencies,
    double? input,
  }) =>
      AppState(
        to: to ?? this.to,
        from: from ?? this.from,
        countries: countries ?? this.countries,
        currencies: currencies ?? this.currencies,
        input: input ?? this.input,
      );
}



//function in der appstate benutzt wird
//1 den input festlegen 
//2 den output festlegen 
