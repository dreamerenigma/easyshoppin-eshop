import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/features/personalization/models/address_model.dart';
import '../../../utils/formatters/formatter.dart';

/// Model class representing user data.
class UserModel {
  // Keep those values final; which you do not want to update
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

  /// Constructor for UserModel.
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
    required List<AddressModel> addresses,
  });

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);


  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model.
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
    addresses: [],
  );

  /// Convert model to JSON structure for storing data in Firebase.
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
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
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
        addresses: [],
      );
    } else {
      return UserModel.empty();
    }
  }
}
