import 'package:dio/dio.dart';

import '../../../core/config/network/networking_service.dart';

class AuthService {
  final NetworkingService networkingService;
  AuthService(this.networkingService);

  // login with pin
  Future<Response> loginWithQrcode(String qrCode) async {
    final response = await networkingService.post(
      '/users/signin',
      data: {'qr_code': qrCode},
    );
    return response;
  }


}
