// extension on date returning current date in this format 2025-03-03
extension DateFormatting on DateTime {
  String formatDate() {
    return "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
  }
}
