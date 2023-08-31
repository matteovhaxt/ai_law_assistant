import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/core/core.dart';

class UserInfoConverter extends JsonConverter<UserInfo, Map<String, dynamic>> {
  const UserInfoConverter();

  @override
  UserInfo fromJson(Map<String, dynamic> json) {
    return UserInfo.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserInfo object) {
    return <String, dynamic>{
      'uid': object.uid,
      'email': object.email,
      'displayName': object.displayName,
      'photoURL': object.photoURL,
      'phoneNumber': object.phoneNumber,
      'providerId': object.providerId,
    };
  }
}
