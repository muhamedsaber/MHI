class FireBaseHospitalsModel {
  final String? name;
  final String? address;
  final String? phone1;
  final String? phone2;
  final String? fax;
  final String? location;

  FireBaseHospitalsModel(
      {required this.name,
      required this.address,
      required this.phone1,
      required this.phone2,
      required this.fax,
      required this.location});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phone1': phone1,
      'phone2': phone2,
      'fax': fax,
      'location': location,
    };
  }

  factory FireBaseHospitalsModel.fromJson(Map<String, dynamic> map) {
    return FireBaseHospitalsModel(
      name: map['name'],
      address: map['address'],
      phone1: map['phone1'],
      phone2: map['phone2'],
      fax: map['fax'],
      location: map['location'],
    );
  }
  @override
  String toString() {
    return 'FireBaseHospitalsModel(name: $name, address: $address, phone1: $phone1, phone2: $phone2, fax: $fax, location: $location)';
  }
}
