import 'dart:convert';

class AtoModel {
  String tipo;
  String processo;
  String magistrado;
  String vara;
  String classe;
  String titulo;
  String data;
  String texto;

  AtoModel({
    required this.tipo,
    required this.processo,
    required this.magistrado,
    required this.vara,
    required this.classe,
    required this.titulo,
    required this.data,
    required this.texto,
  });

  AtoModel copyWith({
    String? tipo,
    String? processo,
    String? magistrado,
    String? vara,
    String? classe,
    String? titulo,
    String? data,
    String? texto,
  }) {
    return AtoModel(
      tipo: tipo ?? this.tipo,
      processo: processo ?? this.processo,
      magistrado: magistrado ?? this.magistrado,
      vara: vara ?? this.vara,
      classe: classe ?? this.classe,
      titulo: titulo ?? this.titulo,
      data: data ?? this.data,
      texto: texto ?? this.texto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'processo': processo,
      'magistrado': magistrado,
      'vara': vara,
      'classe': classe,
      'titulo': titulo,
      'data': data,
      'texto': texto,
    };
  }

  factory AtoModel.fromMap(Map<String, dynamic> map) {
    return AtoModel(
      tipo: map['tipo'] ?? '',
      processo: map['processo'] ?? '',
      magistrado: map['magistrado'] ?? '',
      vara: map['vara'] ?? '',
      classe: map['classe'] ?? '',
      titulo: map['titulo'] ?? '',
      data: map['data'] ?? '',
      texto: map['texto'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AtoModel.fromJson(String source) =>
      AtoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AtoModel(tipo: $tipo, processo: $processo, magistrado: $magistrado, vara: $vara, classe: $classe, titulo: $titulo, data: $data, texto: $texto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AtoModel &&
        other.tipo == tipo &&
        other.processo == processo &&
        other.magistrado == magistrado &&
        other.vara == vara &&
        other.classe == classe &&
        other.titulo == titulo &&
        other.data == data &&
        other.texto == texto;
  }

  @override
  int get hashCode {
    return tipo.hashCode ^
        processo.hashCode ^
        magistrado.hashCode ^
        vara.hashCode ^
        classe.hashCode ^
        titulo.hashCode ^
        data.hashCode ^
        texto.hashCode;
  }
}
