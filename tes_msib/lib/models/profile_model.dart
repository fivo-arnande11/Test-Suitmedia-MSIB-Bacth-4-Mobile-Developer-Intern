import 'package:flutter/cupertino.dart';
import 'package:tes_msib/models/user_model.dart';

class DataUser with ChangeNotifier {
  Data? dataUser = null;

  Data? inputUser = null;
  void addUser(Data) {
    dataUser = Data;
    notifyListeners();
  }

  void nameUser(String firstName, String lastName) {
    inputUser = Data(firstName: firstName, lastName: lastName);
    notifyListeners();
  }
}
