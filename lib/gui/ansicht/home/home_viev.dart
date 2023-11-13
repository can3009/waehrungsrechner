import 'package:flutter/material.dart';
import 'package:noob_flutter/data/models/models.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Country fromCountry = datas[0];
  Country toCountry = datas[1];

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            _buildCurrencyView(fromCountry),
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            _buildCurrencyView(toCountry)
          ]),
        ));
  }

  Widget _buildCurrencyView(Country? country) {
    print(country);
    if (country == null) {
      return Text('diese land wurde nicht gefunden');
    }
    return CountryCard(country: country);
  }
}



//https://www.zeitzonen.de/
