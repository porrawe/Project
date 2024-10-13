class Transactions {
  int? keyID;
  final String title;
  final String name;
  final String lo;
  final DateTime date;

  Transactions({
    this.keyID,
    required this.title,
    required this.name,
    required this.lo,
    required this.date,
  });
}
