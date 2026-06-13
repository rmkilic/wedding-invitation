import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get invitationDate {
    return DateFormat(
      'd MMMM y',
      'tr_TR',
    ).format(this);
  }

  String get invitationDay {
    return DateFormat(
      'EEEE',
      'tr_TR',
    ).format(this);
  }
}