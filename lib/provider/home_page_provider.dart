
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_mod/model/popular_model.dart';
import 'package:movies_mod/model/user_model.dart';
import 'package:movies_mod/util/api_calling.dart';
import 'package:movies_mod/view/screen/favourite.dart';
import 'package:movies_mod/view/screen/home.dart';
import 'package:movies_mod/view/screen/profile.dart';
import 'package:movies_mod/view/screen/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/trending_model.dart';


class HomePageProvider extends ChangeNotifier{

  int tselectedIndex = 0 ;

  int get selectedIndex => tselectedIndex;

  set selectedIndex(int index) {
    tselectedIndex = index;
    notifyListeners();
  }

  UserModel? userModel;
  String? id;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;


  List popularData =[];
  List<PopularModel> popularList =[];
  List<PopularModel> carousalList =[];

  List trendingData = [];
  List<TrendingModel> trendingList = [];


  List pages = [
    Home(),
    Search(),
    Favourite(),
    Profile()
  ];

  HomePageProvider(){
    fetchPopularData();
    fetchTrendingData();
    getDataFromSP();
  }


  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    userModel = UserModel.fromMap(jsonDecode(data));
    id = userModel!.id;
    notifyListeners();
  }

  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
    SystemNavigator.pop();
    notifyListeners();
  }

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