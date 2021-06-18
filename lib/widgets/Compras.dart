class Compra{
  String id;
  String mesreferente;
  String bandeiracartao;
  String pago;

  Compra({this.id,this.mesreferente,this.bandeiracartao,this.pago});

  factory Compra.fromJson(Map<String, dynamic>json){
    return Compra(
      id:json['id'] as String,
      mesreferente: json['mes_referente'] as String,
      bandeiracartao: json['bandeira_cartao'] as String,
      pago: json['pago'] as String,
    );
  }
}