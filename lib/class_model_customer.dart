class ModelCustomer {
  String docId;
  String name;
  String contact;
  String amount;

  ModelCustomer({
    required this.docId,
    required this.name,
    required this.contact,
    required this.amount,
  });

  factory ModelCustomer.fromJson(Map<String, dynamic> json) => ModelCustomer(
    docId: json["docId"] ?? "",  // Simplified null check
    name: json["name"] ?? "",
    contact: json["contact"] ?? "",
    amount: json["amount"] ?? "",  // Corrected spelling and simplified null check
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "name": name,
    "contact":contact,
    "amount": amount, // Corrected spelling
  };
}
