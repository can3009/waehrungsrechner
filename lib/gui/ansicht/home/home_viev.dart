import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/app_drawer.dart';
import 'dart:convert';


import 'package:waehrungsrechner/logic/app_state_provider.dart';
// import '/projects/waehrungsrechner/lib/logic/app_state_provider.dart';

import '../../widgets/country_card.dart';
import 'package:http/http.dart' as http;

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  //get conversion rates

void getConversion() async {
  String apiKey = '873a7cab0f3c067a9736193a'; 

  String baseCurrency = 'EUR';
  String targetCurrency = 'GBP';

  String apiUrl = 'https://v6.exchangerate-api.com/v6/$apiKey/pair/$baseCurrency/$targetCurrency';

  try {
    http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data['result'] == 'success') {
        String baseCode = data['base_code'];
        String targetCode = data['target_code'];
        double conversionRate = data['conversion_rate'];

        // Print base code, target code, and conversion rate
        print('Base Code: $baseCode');
        print('Target Code: $targetCode');
        print('Conversion Rate: $conversionRate');
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateProvider = ref.read(refAppStateProvider.notifier);
     getConversion();
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[100],
        elevation: 9,
        title: const Text(
          'Währungsumrechner',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              CountryCard(fromTo: 'from'),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 55,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 100,
                            offset: const Offset(2, 1),
                          )
                        ],
                      ),
                      child: const Center(
                        //!like button
                        child: Text(
                          '❤',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      //perform action on like button click
                    },
                  ),
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.indigo[100],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.indigo),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Switch Currencies',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        appStateProvider.switchFromTo();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CountryCard(fromTo: 'to'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo[100],
        currentIndex: 0,
        onTap: (index) {
          // switch screen based on index
        },
      ),
    );
  }
}



//https://www.zeitzonen.de/
