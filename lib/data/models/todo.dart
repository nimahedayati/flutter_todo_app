import 'package:intl/intl.dart';

class Todo {
  String title;
  DateTime dateTime;
  bool finished;

  String get formatedTime => DateFormat('kk:mm').format(dateTime);
  String get formatedDate => DateFormat('yyyy/MM/dd').format(dateTime);
  String get formatedDateTime => DateFormat('yyyy/MM/dd – kk:mm').format(dateTime);

  Todo({required this.title, required this.dateTime, required this.finished});
}
