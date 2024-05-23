class Medication {
  String name;
  String drug_name;
  String indication;
  String contra_indication;
  String dose_adult;
  String dose_child;
  String? cave;
  String? breastfeeding;

  Medication({
    required this.name,
    required this.drug_name,
    required this.indication,
    required this.contra_indication,
    required this.dose_adult,
    required this.dose_child,
    this.cave,
    this.breastfeeding,
  });

  static Medication fromJson(Map<String, dynamic> json) => Medication(
    name: json['name'] as String,
    drug_name: json['drug_name'] as String,
    indication: json['indication'] as String,
    contra_indication: json['contra_indication'] as String,
    dose_adult: json['dose_adult'] as String,
    dose_child: json['dose_child'] as String,
    cave: json['cave'] as String,
    breastfeeding: json['breastfeeding'] as String,
  );

  Map<String, Object?> toJson() => {
    'name': name,
  };
}