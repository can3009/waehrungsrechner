// Klassen erweitern und attribute und methoden
// TODO: - app anschauen
// https://riverpod.dev/docs/providers/state_notifier_provider

// unit test schreiben .

//abstrackte klasse von appstate
import 'models.dart';

class AppState {
  final Country selectedCountry;
  final Country compareCountry;
  final List<Country> knownCountrys;
  AppState(
      {required this.compareCountry,
      required this.knownCountrys,
      required this.selectedCountry});
}

//function in der appstate benutzt wird
