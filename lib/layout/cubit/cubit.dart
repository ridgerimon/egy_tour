import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_tour/layout/cubit/states.dart';
import 'package:egy_tour/models/user_model.dart';
import 'package:egy_tour/modules/maps/maps_screen.dart';
import 'package:egy_tour/modules/settings/settings_screen.dart';
import 'package:egy_tour/modules/tour_list/tour_list_screen.dart';
import 'package:egy_tour/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeLayoutAppCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutAppCubit() : super(HomeLayoutAppInitialState());

  static HomeLayoutAppCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.map_outlined),
      label: 'Maps',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_outlined),
      label: 'Tour List',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  List<Widget> Screens = [
    MapsScreen(),
    TourListScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  void getUserData() async {
    emit(LoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      model = UserModel.formJson(value.data());
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }
}
