import 'package:waehrungsrechner/data/models/currency/currency.dart';

class Country {
  String name;
  String urlFlag;
  Currency currency;
  Country({required this.name, required this.urlFlag, required this.currency});
}

//data demo
final List<Country> datas = [
  Country(
    name: 'USA',
    urlFlag: 'assets/us-flag.png',
    // urlFlag:
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYmGahfEnGMsDpFFmpF61UdX225_aXWAwQz2n6KYiKKzMH2ZgreTcIg0C3gKWGDUQOyaU&usqp=CAU',
    currency: Currency(
      name: 'Dollar',
      code: 'USD',
      isCypto: false,
      symbol: '\$',
      exchangeRate: 1.1,
    ),
  ),
  Country(
    name: 'EU',
    urlFlag: 'assets/eu-flag.png',
    // urlFlag:
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ZbRbmPx32hgxg3G_l1g4JGX0VjbTD-ZJXoT_TNw507DbN6nqaaap98AqETu4PcbSad4&usqp=CAU',
    currency: Currency(
      name: 'Dollar',
      code: 'USD',
      isCypto: false,
      symbol: '€',
      exchangeRate: 1.1,
    ),
  ),
  Country(
      name: 'ENG',
      urlFlag: 'assets/gb-flag.png',
      // urlFlag:
      //     'https://media.istockphoto.com/id/854115776/de/foto/flagge-von-england.jpg?s=612x612&w=0&k=20&c=2WZv964ANrMWsdGPnVlUJ56q49NKe6LpZUduHJtWT7M=',
      currency: Currency(
        name: 'Pound',
        code: 'USD',
        isCypto: false,
        symbol: '€',
        exchangeRate: 1.1,
      )),
];
