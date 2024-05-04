import 'package:example_code/model.dart';
import 'package:example_code/services.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  bool isLoading = false;
  late List<Person> people;

  void getData() async {
    isLoading = true;
    people = await PersonServices.getData();
    isLoading = false;
    notifyListeners();
  }
}
