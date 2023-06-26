import 'package:flutter/cupertino.dart';

class LoginPageProvider extends ChangeNotifier{

  bool remember = false;

  onRemember(){
    remember = !remember;
    notifyListeners();
  }

}