class Country {
  String name;
  String urlFlag;
  String currency;
  Country({required this.name, required this.urlFlag, required this.currency});
}

//data demo
final List<Country> datas = [
  Country(
      name: 'USA',
      urlFlag:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYmGahfEnGMsDpFFmpF61UdX225_aXWAwQz2n6KYiKKzMH2ZgreTcIg0C3gKWGDUQOyaU&usqp=CAU',
      currency: 'USD'),
  Country(
      name: 'EU',
      urlFlag:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYmGahfEnGMsDpFFmpF61UdX225_aXWAwQz2n6KYiKKzMH2ZgreTcIg0C3gKWGDUQOyaU&usqp=CAU',
      currency: 'EUR'),
  Country(
      name: 'ENG',
      urlFlag:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYmGahfEnGMsDpFFmpF61UdX225_aXWAwQz2n6KYiKKzMH2ZgreTcIg0C3gKWGDUQOyaU&usqp=CAU',
      currency: 'GBP'),
];
