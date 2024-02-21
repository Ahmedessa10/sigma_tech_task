import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.maidenName,
    required super.age,
    required super.gender,
    required super.email,
    required super.phone,
    required super.username,
    required super.password,
    required super.birthDate,
    required super.image,
    required super.bloodGroup,
    required super.height,
    required super.weight,
    required super.eyeColor,
    required super.hair,
    required super.domain,
    required super.ip,
    required super.address,
    required super.macAddress,
    required super.university,
    required super.bank,
    required super.company,
    required super.ein,
    required super.ssn,
    required super.userAgent,
    required super.crypto,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      birthDate: json['birthDate'],
      image: json['image'],
      bloodGroup: json['bloodGroup'],
      height: json['height'],
      weight: json['weight'],
      eyeColor: json['eyeColor'],
      hair: HairModel.fromJson(json['hair']),
      domain: json['domain'],
      ip: json['ip'],
      address: AddressModel.fromJson(json['address']),
      macAddress: json['macAddress'],
      university: json['university'],
      bank: BankModel.fromJson(json['bank']),
      company: CompanyModel.fromJson(json['company']),
      ein: json['ein'],
      ssn: json['ssn'],
      userAgent: json['userAgent'],
      crypto: CryptoModel.fromJson(json['crypto']),
    );
  }
}

class AddressModel extends Address {
  const AddressModel({
    required super.address,
    required super.city,
    required super.coordinates,
    required super.postalCode,
    required super.state,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'] as String,
      city: json['city'].toString() as String,
      coordinates: CoordinatesModel.fromJson(
          json['coordinates'] as Map<String, dynamic>),
      postalCode: json['postalCode'] as String,
      state: json['state'] as String,
    );
  }
}

class CoordinatesModel extends Coordinates {
  const CoordinatesModel({
    required super.lat,
    required super.lng,
  });

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}

class BankModel extends Bank {
  const BankModel({
    required super.cardExpire,
    required super.cardNumber,
    required super.cardType,
    required super.currency,
    required super.iban,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      cardExpire: json['cardExpire'] as String,
      cardNumber: json['cardNumber'] as String,
      cardType: json['cardType'] as String,
      currency: json['currency'] as String,
      iban: json['iban'] as String,
    );
  }
}

class CompanyModel extends Company {
  const CompanyModel({
    required super.address,
    required super.department,
    required super.name,
    required super.title,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      department: json['department'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
    );
  }
}

class HairModel extends Hair {
  const HairModel({required super.color, required super.type});

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(
      color: json['color'] as String,
      type: json['type'] as String,
    );
  }
}

class CryptoModel extends Crypto {
  CryptoModel({
    required super.coin,
    required super.wallet,
    required super.network,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      coin: json['coin'] as String,
      wallet: json['wallet'] as String,
      network: json['network'] as String,
    );
  }
}
