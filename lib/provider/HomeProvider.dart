import 'dart:convert';

import 'package:flutter/material.dart';

import 'BaseModel.dart';

class HomeProvider extends BaseModel {
  late BuildContext mContext;
  final items = [];
  int currentIndex = 0;
  bool showAll = false;
  final List<String> users = [];
  List<String> myImageAndCaption = [
    "assets/download.jpg",
    "assets/download.jpg",
    "assets/download.jpg",
    "assets/download.jpg",
    "assets/download.jpg",
    "assets/download.jpg",
    "assets/download.jpg",
  ];

  HomeProvider(BuildContext context) {
    mContext = context;
    addSliderImage();
    addUserDetails();
  }

  void addSliderImage() {
    items.add(Image.asset('assets/download.jpg'));
    items.add(Image.asset('assets/download.jpg'));
    items.add(Image.asset('assets/download.jpg'));
    items.add(Image.asset('assets/download.jpg'));
    notifyListeners();
  }

  void addUserDetails() {
    users.add("User 1");
    users.add("User 1");
    users.add("User 1");
    users.add("User 1");
    users.add("User 1");
    users.add("User 1");
    notifyListeners();
  }

  void setIndex(int index) {
    currentIndex=index;
    notifyListeners();
  }

  void showAllData(bool all) {
    showAll=all;
    notifyListeners();
  }
}
