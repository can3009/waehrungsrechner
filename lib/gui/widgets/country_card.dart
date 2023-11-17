import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waehrungsrechner/data/models/currency/currency.dart';
import 'package:waehrungsrechner/logic/app_state_provider.dart';

import '/data/models/models.dart';

class CountryCard extends ConsumerWidget {
  final String fromTo;
  const CountryCard({
    required this.fromTo,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(refAppStateProvider);
    log('build: appState.output: ${appState.output}');
    log('build: appState.input: ${appState.input}');
    final appStateProvider = ref.read(refAppStateProvider.notifier);
    // final Currency? currency;
    final Country? country;
    if (fromTo == 'from') {
      // currency = appState.fromCurrency;
      country = appState.fromCountry;
    } else {
      // currency = appState.toCurrency;
      country = appState.toCountry;
    }
    // if (currency == null) {
    //   return Container();
    // }
    if (country == null) {
      return Text('diese Währung wurde nicht gefunden');
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.indigo.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    // child: Image.asset('gb-flag.png'),
                    child: Image.asset(
                      country.urlFlag,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(country.currency,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                        Text(country.currency,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 46, 45, 45),
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  // const Icon(
                  //   Icons.chevron_right,
                  //   color: Colors.grey,
                  // )
                ],
              ),
              TextField(
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*[\.,]?\d{0,2}'))
                ],
                onChanged: (value) {
                  if (fromTo == 'from') {
                    log('onChanged: $value');
                    appStateProvider.setInputByString(value);
                  }
                },
                readOnly: fromTo == 'to' ? true : false,
                decoration: InputDecoration(
                  hintText:
                      fromTo == 'from' ? 'Betrag' : appState.output.toString(),
                  suffixIcon: Text(
                    country.currency,
                    style: const TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                  suffixIconConstraints:
                      const BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
