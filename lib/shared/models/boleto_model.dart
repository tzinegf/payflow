import 'dart:convert';

class BoletoModel {
  final String? name;
  final String? codigo;
  final double? value;
  final String? dueDate;

  BoletoModel({
    this.name,
    this.codigo,
    this.value,
    this.dueDate,
  });
  
  BoletoModel copyWith({
    String? name,
    String? codigo,
    double? value,
    String? dueDate,
  }) {
    return BoletoModel(
      name: name ?? this.name,
      codigo: codigo ?? this.codigo,
      value: value ?? this.value,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'codigo': codigo,
      'value': value,
      'dueDate': dueDate,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      codigo: map['codigo'],
      value: map['value'],
      dueDate: map['dueDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) => BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, codigo: $codigo, value: $value, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BoletoModel &&
      other.name == name &&
      other.codigo == codigo &&
      other.value == value &&
      other.dueDate == dueDate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      codigo.hashCode ^
      value.hashCode ^
      dueDate.hashCode;
  }
}
