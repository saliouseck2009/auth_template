import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class Utils {
  ///Cette fonction calcul la somme des élémments d'un tableau d'entiers
  static sum(List<int> listeEntier) {
    return listeEntier.reduce((value, element) => value + element);
  }

  ///Format Date exple: 25-02-2022
  static getFormattedDateOf(DateTime date) {
    DateFormat outputFormat = DateFormat('dd-MM-yyyy');
    return outputFormat.format(date);
  }

  static compareDate(DateTime d1, DateTime d2) {
    return (d1.day == d2.day && d1.month == d2.month && d1.year == d2.year);
  }

  static String formatMoney({required int montant}) {
    // final oCcy = NumberFormat("#,##0", "en_US");
    final oCcy = NumberFormat("#,##0", "eu");
    return oCcy.format(montant);
  }

  ///Format cellphone number like 77 245 88 69
  static String formatPhoneNumber({required String number}) {
    if (number.length != 9) {
      return number;
    } else {
      return "${number.substring(0, 2)} ${number.substring(2, 3)}${number.substring(3, 5)} ${number.substring(5, 7)} ${number.substring(7, 9)}";
    }
  }

  static Map<int, String> dayNumberToString() => {
        0: "Monday",
        1: "Tuesday",
        2: "Wednesday",
        3: "Thursday",
        4: "Friday",
        5: "Saturday"
      };
  static Map<String, int> dayStringToNumber() => {
        "Monday": 0,
        "Tuesday": 1,
        "Wednesday": 2,
        "Thursday": 3,
        "Friday": 4,
        "Saturday": 5
      };

  static bool checkEmail({required String email}) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static Color getColorFromStr({required String colorStr}) {
    String valueString =
        colorStr.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    return Color(value);
  }

  // static List<Product> ordonateProductList({required List<Product> products}) {

  // }
  final availableLocalesForDateFormatting = const [
    "en_ISO",
    "af",
    "am",
    "ar",
    "ar_DZ",
    "ar_EG",
    "az",
    "be",
    "bg",
    "bn",
    "br",
    "bs",
    "ca",
    "chr",
    "cs",
    "cy",
    "da",
    "de",
    "de_AT",
    "de_CH",
    "el",
    "en",
    "en_AU",
    "en_CA",
    "en_GB",
    "en_IE",
    "en_IN",
    "en_MY",
    "en_SG",
    "en_US",
    "en_ZA",
    "es",
    "es_419",
    "es_ES",
    "es_MX",
    "es_US",
    "et",
    "eu",
    "fa",
    "fi",
    "fil",
    "fr",
    "fr_CA",
    "fr_CH",
    "ga",
    "gl",
    "gsw",
    "gu",
    "haw",
    "he",
    "hi",
    "hr",
    "hu",
    "hy",
    "id",
    "in",
    "is",
    "it",
    "it_CH",
    "iw",
    "ja",
    "ka",
    "kk",
    "km",
    "kn",
    "ko",
    "ky",
    "ln",
    "lo",
    "lt",
    "lv",
    "mk",
    "ml",
    "mn",
    "mr",
    "ms",
    "mt",
    "my",
    "nb",
    "ne",
    "nl",
    "no",
    "no_NO",
    "or",
    "pa",
    "pl",
    "ps",
    "pt",
    "pt_BR",
    "pt_PT",
    "ro",
    "ru",
    "si",
    "sk",
    "sl",
    "sq",
    "sr",
    "sr_Latn",
    "sv",
    "sw",
    "ta",
    "te",
    "th",
    "tl",
    "tr",
    "uk",
    "ur",
    "uz",
    "vi",
    "zh",
    "zh_CN",
    "zh_HK",
    "zh_TW",
    "zu"
  ];
}
