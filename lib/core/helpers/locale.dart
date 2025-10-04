import 'dart:io';

import 'package:intl/intl.dart';

class LocalHelpers {
  static String formatDateTime(DateTime dateTime) {
    String dayAbbreviation = DateFormat("EEE", "fr_FR").format(dateTime);
    String formattedDate = DateFormat(
      "dd/MM/yyyy HH:mm",
      "fr_FR",
    ).format(dateTime);
    return "$dayAbbreviation $formattedDate";
  }

  static String formatShortDateTime(DateTime dateTime) {
    String formattedDate = DateFormat("dd/MM/yyyy", "fr_FR").format(dateTime);
    return formattedDate;
  }

  /// Convert a date string like "2025-04-01" to "01/04/2025"
  static String getFrFormattedDate(String dateStr) {
    try {
      final dt = DateTime.parse(dateStr);
      return DateFormat('dd/MM/yyyy').format(dt);
    } catch (_) {
      return dateStr; // fallback to original
    }
  }

  static String extractTime(String createdAt) {
    try {
      final dt = DateTime.parse(createdAt);
      return DateFormat('HH:mm').format(dt);
    } catch (_) {
      return "";
    }
  }

  /// Format created_at from API format "2025-06-30T16:55:15.158Z" to "30/06/2025 16:55"
  static String formatCreatedAt(String createdAt) {
    try {
      final dt = DateTime.parse(createdAt);
      return DateFormat('dd/MM/yyyy HH:mm', 'fr_FR').format(dt);
    } catch (_) {
      return createdAt; // fallback to original
    }
  }

  static String getUserCurrency() {
    try {
      // Get system locale (e.g., "fr_FR", "en_US", etc.)
      String locale = Platform.localeName;

      // Extract currency from the locale
      return NumberFormat.simpleCurrency(locale: locale).currencyName ?? "XOF";
    } catch (e) {
      return "USD"; // Default to USD in case of error
    }
  }

  static String formatPrice(int price) {
    final formatter = NumberFormat("#,##0", "fr_FR");
    return formatter.format(price).replaceAll(',', ' ');
  }

  static String formatDoublePrice(double price) {
    final formatter = NumberFormat("#,##0", "fr_FR");
    return formatter.format(price).replaceAll(',', ' ');
  }

  /// Get duration in minutes between two dates
  static int getDurationInMinutes(DateTime startDate, DateTime endDate) {
    return endDate.difference(startDate).inMinutes;
  }
}
