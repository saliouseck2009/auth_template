class AuthService {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Simulate successful login for any email/password combination
    // In real implementation, this would make actual API call
    return {
      'success': true,
      'user': {
        'id': '1',
        'username': email.split('@')[0],
        'email': email,
        'phone': null,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      },
      'token': {
        'access_token': _generateToken(),
        'refresh_token': _generateToken(),
        'token_type': 'Bearer',
        'expires_at': DateTime.now()
            .add(const Duration(hours: 24))
            .toIso8601String(),
      },
    };
  }

  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
    String? phone,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Simulate successful registration
    // In real implementation, this would make actual API call
    return {
      'success': true,
      'user': {
        'id': '2',
        'username': username,
        'email': email,
        'phone': phone,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      },
      'token': {
        'access_token': _generateToken(),
        'refresh_token': _generateToken(),
        'token_type': 'Bearer',
        'expires_at': DateTime.now()
            .add(const Duration(hours: 24))
            .toIso8601String(),
      },
    };
  }

  Future<void> logout() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // In real implementation, this would call logout endpoint
    // and invalidate tokens on the server
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate successful token refresh
    // In real implementation, this would call refresh endpoint
    return {
      'success': true,
      'token': {
        'access_token': _generateToken(),
        'refresh_token': _generateToken(),
        'token_type': 'Bearer',
        'expires_at': DateTime.now()
            .add(const Duration(hours: 24))
            .toIso8601String(),
      },
    };
  }

  // Helper method to generate mock tokens
  String _generateToken() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(32, (index) => chars[random % chars.length]).join();
  }
}
