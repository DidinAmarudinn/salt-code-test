import 'package:intl/intl.dart';

extension ParsePokemonId on String {
String toFormatedDate() {
    try {
      final dateTime = DateTime.parse(this);
      final formatter = DateFormat('M-d-yyyy hh:mm a');
      final formattedDate = formatter.format(dateTime);
      return formattedDate;
    } catch (e) {
      return "-";
    }
  }
}

extension NullableStringExtensions on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}