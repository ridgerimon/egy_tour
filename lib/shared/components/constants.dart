import 'package:egy_tour/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

double height(context) => MediaQuery.of(context).size.height;
String ?uId  = '';
UserModel? model;

String pharaonicVillageName = 'Pharaonic Village';
var pharaonicVillage = LatLng(29.9972821, 31.2147713);

String saintBarbaraArchaeologicalChurchName = 'كنيسة القديسه بربارة الاثرية';
var saintBarbaraArchaeologicalChurch = LatLng(30.0060314, 31.2314015);

String stGeorgeChurchName = 'كنيسة القديس مارجرجس';
var stGeorgeChurch = LatLng(30.0062868, 31.2300861);

String zamalekArtHallName = 'قاعة الزمالك للفن';
var zamalekArtHall = LatLng(30.0613676, 31.2229587);

String alRodaNiloMeterName = 'Al-Roda Nilometer';
var alRodaNiloMeter = LatLng(30.006916, 31.2250067);

String panoramaOctoberName = 'Panorama October';
var panoramaOctober = LatLng(30.0742728, 31.3068068);

String egyptianRailwayMuseumName = 'Egyptian Railway Museum';
var egyptianRailwayMuseum = LatLng(30.0634886, 31.2462799);

String lakeAinalSiraName = 'Lake Ain al-Sira';
var lakeAinalSira = LatLng(30.0105337, 31.2368322);

String alMoezLdinAllahAlFatmiName = 'Al Moez Ldin Allah Al Fatmi';
var alMoezLdinAllahAlFatmi = LatLng(30.0509306, 31.2593861);

String theHangingChurchName = 'The Hanging Church';
var theHangingChurch = LatLng(30.0052663, 31.2279939);

String alHussainMosqueName = 'Al-Hussain Mosque';
var alHussainMosque = LatLng(30.0476847,31.2608698);

String mosqueofIbnTulunName = 'Mosque of Ibn Tulun';
var mosqueofIbnTulun = LatLng(30.028691,31.2472054);

String mosqueOfMuhammadAliName = 'Mosque of Muhammad Ali';
var  mosqueOfMuhammadAli = LatLng(30.0287015,31.2577219);

String theCopticMuseumName = 'The Coptic Museum';
var theCopticMuseum = LatLng(30.0056036,31.2279278);

String gizaZoologicalGardenName = 'Giza Zoological Garden';
var gizaZoologicalGarden = LatLng(30.02795,31.2181573);

String ummKulthumMuseumName = 'Umm Kulthum Museum';
var ummKulthumMuseum = LatLng(30.0075026,31.2226694);

String alAzharParkName = 'Al Azhar Park';
var  alAzharPark = LatLng(30.040758,31.262544);

String theEgyptianMuseumName = 'The Egyptian Museum';
var  theEgyptianMuseum = LatLng(30.0478001,31.2358049);

String cairoOperaHouseName = 'Cairo Opera House';
var  cairoOperaHouse = LatLng(30.0423613,31.2258569);

String salahAlDinAlAyoubiCitadelName = 'Salah Al-Din Al-Ayoubi Citadel';
var  salahAlDinAlAyoubiCitadel = LatLng(30.028801, 31.2575733);

String aquariumGrottoGardenName = 'Aquarium Grotto Garden';
var  aquariumGrottoGarden = LatLng(30.0565699, 31.2164253);

String civilizationMuseumName = 'Civilization Museum';
var  civilizationMuseum = LatLng(30.0062334, 31.2468767);

String theInternationalParkName = 'The International Park';
var   theInternationalPark = LatLng(30.0495526, 31.3343216);