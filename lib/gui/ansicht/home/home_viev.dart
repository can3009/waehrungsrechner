// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/app_drawer.dart';
import 'package:waehrungsrechner/gui/ansicht/history_view/favorite.dart';
import 'dart:convert';

import 'package:waehrungsrechner/gui/ansicht/history_view/history.dart';
import 'package:waehrungsrechner/gui/ansicht/home/home_button/like_button.dart';
import 'package:waehrungsrechner/logic/app_state_provider.dart';
// import '/projects/waehrungsrechner/lib/logic/app_state_provider.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/app_drawer.dart';

import '../../widgets/country_card.dart';
import 'package:http/http.dart' as http;
import 'package:waehrungsrechner/logic/app_state_provider.dart';
import 'package:waehrungsrechner/gui/ansicht/history_view/favorite.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  //get conversion rates

  // void getConversion() async {
  //   String apiUrl =
  //       'https://v6.exchangerate-api.com/v6/873a7cab0f3c067a9736193a/latest/USD';

  //   try {
  //     http.Response response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = json.decode(response.body);

  //       if (data['result'] == 'success') {
  //         String baseCode = data['base_code'];
  //         Map<String, dynamic> conversionRates = data['conversion_rates'];

  //         // Accessing conversion rates for each currency

  //         double usdToAED =
  //             conversionRates['AED']; // Example: USD to AED conversion rate

  //         // Print base code and conversion rates
  //         print('Base Code: $baseCode');
  //         print('Conversion rate from USD to AED: $usdToAED');
  //       } else {
  //         print('API request failed: ${data['error']}');
  //       }
  //     } else {
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching data: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLiked = false;
    final appStateProvider = ref.read(refAppStateProvider.notifier);

    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: isDarkMode ? Colors.black : Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[120],
        elevation: 9,
        title: const Text(
          'Curreny  Converter ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const CountryCard(fromTo: 'from'),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 130,
                    ),
                  ),
                  LikeButton(
                    isLiked: isLiked,
                    onTap: () {
                      //Hier können sie Aktionen für den Like-Button in
                      isLiked = !isLiked;
                    },
                  ),
                  Expanded(
                    flex: 7,
                    child: InkWell(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.indigo[100],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.indigo),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Switch Currencies',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        appStateProvider.getConversion();
                        appStateProvider.switchFromTo();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const CountryCard(fromTo: 'to'),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          // Floating Action Button links unten
          Positioned(
            bottom: 41,
            left: 40,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => FavoriteViewState())
                        //Hier können sie Aktionen für den Like-Button in
                        //Ihrer Anwendung definieren.
                        ));
              },
              label: const Text('Favorite'),
              backgroundColor: Colors.indigo[100],
            ),
          ),
          // Floating Action Button rechts unten
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width - 100,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoryViewState()),
                );
              },
              label: const Text('History'),
              backgroundColor: Colors.indigo[100],
            ),
          ),
        ],
      ),
    );
  }
}

//https://www.zeitzonen.de/
