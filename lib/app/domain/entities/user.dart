import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final num height;
  final num weight;
  final String eyeColor;
  final Hair hair;
  final String domain;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;
  final Crypto crypto;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    maidenName,
    age,
    gender,
    email,
    phone,
    username,
    password,
    birthDate,
    image,
    bloodGroup,
    height,
    weight,
    eyeColor,
    hair,
    domain,
    ip,
    address,
    macAddress,
    university,
    bank,
    company,
    ein,
    ssn,
    userAgent,
    crypto,
  ];
}

class Hair extends Equatable {
  final String color;
  final String type;

  const Hair({required this.color, required this.type});

  @override
  List<Object?> get props => [color, type];
}

class Address extends Equatable {
  final String address;
  final String city;
  final Coordinates coordinates;
  final String postalCode;
  final String state;

  const Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  @override
  List<Object?> get props => [address, city, coordinates, postalCode, state];
}

class Coordinates extends Equatable {
  final double lat;
  final double lng;

  const Coordinates({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}

class Bank extends Equatable {
  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  const Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  @override
  List<Object?> get props => [cardExpire, cardNumber, cardType, currency, iban];
}

class Company extends Equatable {
  final Address address;
  final String department;
  final String name;
  final String title;

  const Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });

  @override
  List<Object?> get props => [address, department, name, title];
}

class Crypto extends Equatable {
  final String coin;
  final String wallet;
  final String network;

  const Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  @override
  List<Object?> get props => [coin, wallet, network];
}
