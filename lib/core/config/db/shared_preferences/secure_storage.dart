import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Private constructor and singleton instance
  SecureStorage._();
  static final SecureStorage instance = SecureStorage._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // General error logger (optional)
  void _logError(String action, dynamic e) {
    log('[SecureStorage] Error during $action: $e');
  }

  // Set item safely
  Future<bool> setItem({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
      return true;
    } catch (e) {
      _logError('setItem', e);
      return false;
    }
  }

  // Get item safely
  Future<String?> getItem({required String key}) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      _logError('getItem', e);
      if (e is PlatformException) {
        await _storage.deleteAll(); // Clear corrupted storage
      }
      return null;
    }
  }

  // Delete item safely
  Future<bool> deleteItem({required String key}) async {
    try {
      await _storage.delete(key: key);
      return true;
    } catch (e) {
      _logError('deleteItem', e);
      return false;
    }
  }

  // Clear all safely
  Future<bool> clear() async {
    try {
      await _storage.deleteAll();
      return true;
    } catch (e) {
      _logError('clear', e);
      return false;
    }
  }

  // Save generic object as JSON
  Future<bool> save<T>(
    String key,
    T data,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    try {
      final String jsonData = jsonEncode(toJson(data));
      await _storage.write(key: key, value: jsonData);
      return true;
    } catch (e) {
      _logError('save', e);
      return false;
    }
  }

  // Retrieve object as JSON
  Future<T?> get<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final jsonData = await _storage.read(key: key);
      if (jsonData == null) return null;
      return fromJson(jsonDecode(jsonData));
    } catch (e) {
      _logError('get<T>', e);
      return null;
    }
  }
}

class SecureStorageKey {
  static const token = "access_token";
  static const user = "user";
  static const sector = "sector";
  static const countryId = "Country-Id";
}
