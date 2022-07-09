class ZipCode {
  String? zipcode;
  String? street;
  String? complement;
  String? district;
  String? location;
  String? uf;

  ZipCode({
    this.zipcode,
    this.street,
    this.complement,
    this.district,
    this.location,
    this.uf,
  });

  ZipCode.fromJson(Map<String, dynamic> json) {
    zipcode = json['cep'];
    street = json['logradouro'];
    complement = json['complemento'];
    district = json['bairro'];
    location = json['localidade'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = zipcode;
    data['logradouro'] = street;
    data['complemento'] = complement;
    data['bairro'] = district;
    data['localidade'] = location;
    data['uf'] = uf;
    return data;
  }
}
