import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/features/personalization/models/address_model.dart';
import '../../../utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String username;
  String password;
  final String email;
  String phoneNumber;
  String profilePicture;
  String gender;
  String day;
  String month;
  String year;
  bool smsSubscribed;
  String role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.gender,
    required this.day,
    required this.month,
    required this.year,
    required this.smsSubscribed,
    required this.role,
    required List<AddressModel> addresses,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);


  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    password: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
    gender: '',
    day: '',
    month: '',
    year: '',
    smsSubscribed: false,
    role: 'user',
    addresses: [],
  );

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Password': password,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Gender': gender,
      'Day': day,
      'Month': month,
      'Year': year,
      'SmsSubscribed': smsSubscribed,
      'Role': role,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        password: data['Password'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        gender: data['Gender'] ?? '',
        day: data['Day'] ?? '',
        month: data['Month'] ?? '',
        year: data['Year'] ?? '',
        smsSubscribed: data['SmsSubscribed'] ?? false,
        role: data['Role'] ?? 'user',
        addresses: [],
      );
    } else {
      return UserModel.empty();
    }
  }
}
