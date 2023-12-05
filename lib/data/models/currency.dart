// ignore_for_file: public_member_api_docs

class Currency {
  final String name;
  final String code;
  final String symbol;
  final bool isCypto;
  final double exchangeRate;

  Currency(
      {required this.name,
      required this.code,
      required this.isCypto,
      required this.symbol,
      required this.exchangeRate});

  double umrechnen(int betrag) {
    return betrag * exchangeRate;
  }
}




// class Euro extends Currency {
//   //der constructor für die klasse euro , wir definieren wie ein euro sich verhalten soll!Q!!!
//   Euro({
//     euroName = 'Euro',
//     euroCode = '123',
//     eurocountry = 'Europa',
//     euroIsCrypto = false,
//     eurosysmbol = '€',
//     euroExchancerate = 1.1,
//   }) : super(
//           name: euroName,
//           code: euroCode,
//           country: eurocountry,
//           isCypto: euroIsCrypto,
//           symbol: eurosysmbol,
//           exchangeRate: euroExchancerate,
//         );

//   @override
//   String get code => '123';

//   @override
//   String get country => 'country';

//   @override
//   double get exchangeRate => 1.10;

//   @override
//   bool get isCypto => false;

//   @override
//   String get name => throw UnimplementedError();

//   @override
//   String get symbol => throw UnimplementedError();

// }
