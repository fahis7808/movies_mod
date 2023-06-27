
import 'package:flutter/material.dart';
import 'package:movies_mod/model/popular_model.dart';
import 'package:movies_mod/util/api_calling.dart';
import 'package:movies_mod/view/screen/favourite.dart';
import 'package:movies_mod/view/screen/home.dart';
import 'package:movies_mod/view/screen/profile.dart';
import 'package:movies_mod/view/screen/search.dart';

import '../model/trending_model.dart';


class HomePageProvider extends ChangeNotifier{

  int tselectedIndex = 0 ;

  int get selectedIndex => tselectedIndex;

  set selectedIndex(int index) {
    tselectedIndex = index;
    notifyListeners();
  }

  List popularData =[];
  List<PopularModel> popularList =[];
  List<PopularModel> carousalList =[];

  List trendingData = [];
  List<TrendingModel> trendingList = [];

  final List<String> imageList = [
    'assets/Image/extraction_2.png',
    'assets/Image/extraction_2.png',
    'assets/Image/extraction_2.png',
  ];

  HomePageProvider(){
    fetchPopularData();
    fetchTrendingData();
  }

  List pages = [
    Home(),
    Search(),
    Favourite(),
    Profile()
  ];



  Future fetchPopularData() async{
    var res = await ApiCalling.fetchData(
    '/popular?'
    );
    popularData = res['results'];
    popularList = popularData.map((e) => PopularModel.fromJson(e)).toList();
    notifyListeners();

    List<PopularModel> firstFour = popularList.sublist(0, 4);
    carousalList = firstFour;
    print('-------------- data ------------');
    print(carousalList);
  }

  Future fetchTrendingData() async{
    var res = await ApiCalling.fetchData(
    '/top_rated?'
    );
    trendingData = res['results'];
    trendingList = trendingData.map((e) => TrendingModel.fromJson(e)).toList();
    notifyListeners();
  }



}