import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:waehrungsrechner/data/models/country.dart';

import '../data/models/models.dart';

final refAppStateProvider =
    NotifierProvider<AppStateProvider, AppState>(() => AppStateProvider());

//!
class AppStateProvider extends Notifier<AppState> {
  @override
  AppState build() {
    return AppState(
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
          symbol: '€',
          exchangeRate: 0.78,
        ),
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
      ],
      from: 'USA',
    );
  }

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
}
