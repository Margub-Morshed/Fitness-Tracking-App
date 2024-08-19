import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateProvider extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  String _pickedDate =
      DateFormat('dd/MM/yyyy hh:mm', 'bn').format(DateTime.now());
  String _timeStamp = '';

  DateTime get selectedDate => _selectedDate;
  String get pickedDate => _pickedDate;
  String get timeStamp => _timeStamp;

  void setPickedDate(String pick) {
    _pickedDate = pick;
    notifyListeners();
  }

  void setTimeStamp(String time) {
    _timeStamp = time;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
