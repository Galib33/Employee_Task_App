import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String get formatDate => DateFormat('d MMM y').format(this);
  String get formatDateForList => DateFormat('d MMM, y').format(this);
}
