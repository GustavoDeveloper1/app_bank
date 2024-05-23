class Transaction {
  final int id;
  final String name;
  final String type;
  final double value;
  final DateTime date;
  final int? numberOfInstallments;
  final bool hasParcel;
  final double? valuePerParcel;

  Transaction({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
    required this.date,
    this.numberOfInstallments,
    required this.hasParcel,
    this.valuePerParcel,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      value: double.parse(json['value']),
      date: DateTime.parse(json['date']),
      numberOfInstallments: json['numberOfInstallments'],
      hasParcel: json['hasParcel'],
      valuePerParcel: json['valuePerParcel'] != null
          ? double.parse(json['valuePerParcel'])
          : null,
    );
  }
}
