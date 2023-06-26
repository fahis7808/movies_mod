import 'package:flutter/widgets.dart';
import 'package:movies_mod/view/screen/favourite.dart';
import 'package:movies_mod/view/screen/home.dart';
import 'package:movies_mod/view/screen/profile.dart';
import 'package:movies_mod/view/screen/search.dart';

class HomePageProvider extends ChangeNotifier{

  int tselectedIndex = 0 ;

  int get selectedIndex => tselectedIndex;

  set selectedIndex(int index) {
    tselectedIndex = index;
    notifyListeners();
  }

  final List<String> imageList = [
    'assets/images/football_3.png',
    'assets/images/football_4.png',
    'assets/images/football_5.png',
  ];

  List pages = [
    Home(),
    Search(),
    Favourite(),
    Profile()
  ];

}