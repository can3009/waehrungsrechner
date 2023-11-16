import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waehrungsrechner/data/models/currency/currency.dart';
import 'package:waehrungsrechner/data/models/models.dart';
import 'package:waehrungsrechner/logic/app_state_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateProvider = ref.read(refAppStateProvider.notifier);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 9,
          title: const Text(
            'Währungsumrechner',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              CountryCard(fromTo: 'from'),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.indigo.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3))
                        ]),
                    child: const Center(
                      child: Text(
                        '=',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.indigo)),
                      child: const Row(
                        children: [
                          Text(
                            'Switch Currencies',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      appStateProvider.switchFromTo();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CountryCard(fromTo: 'to')
            ]),
          ),
        ));
  }
}



//https://www.zeitzonen.de/
