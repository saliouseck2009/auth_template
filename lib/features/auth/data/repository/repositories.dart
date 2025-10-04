// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class UserRepository {
//   static String mainUrl = "https://baj3n.herokuapp.com";
//   String loginUrl = '$mainUrl/api/auth/login';
//   String signupUrl = '$mainUrl/api/auth/signup';

//   final FlutterSecureStorage storage = const FlutterSecureStorage();
//   final Dio _dio = Dio();

//   ///check if token exist in local
//   Future<bool> hasToken() async {
//     try {
//       var value = await storage.read(key: 'token');
//       if (value != null && value.isNotEmpty) {
//         // Temporarily comment out the service locator call to avoid hanging
//         // locator.get<UserInfo>().setToken = value;
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }

//   ///check if user exist in local
//   Future<bool> hasUsersId() async {
//     try {
//       var value = await storage.read(key: 'userId');
//       if (value != null && value.isNotEmpty) {
//         // Temporarily comment out the service locator call to avoid hanging
//         // locator.get<UserInfo>().setId = value;
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }

//   ///persist token in local
//   Future<void> persistToken(String token) async {
//     await storage.write(key: 'token', value: token);
//   }

//   ///persist userId in local
//   Future<void> persistUserId(String id) async {
//     await storage.write(key: 'userId', value: id);
//   }

//   ///delete the userToken in local
//   Future<void> deleteToken() async {
//     storage.delete(key: 'token');
//     storage.deleteAll();
//   }

//   ///delete the UserId in local
//   Future<void> deleteUserId() async {
//     storage.delete(key: 'userId');
//   }

//   Future<Map<String, String>> login(String username, String password) async {
//     Response response = await _dio.post(
//       loginUrl,
//       data: {"userName": username, "password": password},
//     );
//     Map<String, String> userInfo = {
//       'token': response.data["token"],
//       'userId': response.data["userId"],
//     };

//     return userInfo;
//   }

//   Future<void> signUp({
//     required username,
//     email,
//     required password,
//     phone,
//   }) async {
//     Response response = await _dio.post(
//       signupUrl,
//       data: {
//         "userName": username,
//         "email": email,
//         "password": password,
//         "phone": phone,
//       },
//     );
//   }
// }
