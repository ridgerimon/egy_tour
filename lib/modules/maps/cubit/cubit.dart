import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:egy_tour/models/tour_model.dart';
import 'package:egy_tour/modules/maps/cubit/states.dart';
import 'package:egy_tour/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapAppInitialState());

  static MapCubit get(context) => BlocProvider.of(context);

  LatLng initPosition =
      const LatLng(0, 0); //initial Position cannot assign null values
  LatLng currentLatLng = const LatLng(
      0.0, 0.0); //initial currentPosition values cannot assign null values
  LocationPermission permission =
      LocationPermission.denied; //initial permission status
  final Completer<GoogleMapController> controller = Completer();

  List<Marker> markers = <Marker>[];

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void customMarker() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/map.png', 100);

    markers.add(
      Marker(
        markerId: MarkerId(pharaonicVillageName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: pharaonicVillage,
        infoWindow: InfoWindow(
            title: pharaonicVillageName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  pharaonicVillage.latitude, pharaonicVillage.longitude);
            }),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId(saintBarbaraArchaeologicalChurchName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: saintBarbaraArchaeologicalChurch,
        infoWindow: InfoWindow(
            title: saintBarbaraArchaeologicalChurchName,
            onTap: () {
              getPolyline(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  saintBarbaraArchaeologicalChurch.latitude,
                  saintBarbaraArchaeologicalChurch.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(stGeorgeChurchName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: stGeorgeChurch,
        infoWindow: InfoWindow(
            title: stGeorgeChurchName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  stGeorgeChurch.latitude, stGeorgeChurch.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(zamalekArtHallName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: zamalekArtHall,
        infoWindow: InfoWindow(
            title: zamalekArtHallName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  zamalekArtHall.latitude, zamalekArtHall.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(alRodaNiloMeterName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: alRodaNiloMeter,
        infoWindow: InfoWindow(
            title: alRodaNiloMeterName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  alRodaNiloMeter.latitude, alRodaNiloMeter.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(egyptianRailwayMuseumName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: egyptianRailwayMuseum,
        infoWindow: InfoWindow(
            title: egyptianRailwayMuseumName,
            onTap: () {
              getPolyline(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  egyptianRailwayMuseum.latitude,
                  egyptianRailwayMuseum.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(lakeAinalSiraName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: lakeAinalSira,
        infoWindow: InfoWindow(
            title: lakeAinalSiraName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  lakeAinalSira.latitude, lakeAinalSira.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(panoramaOctoberName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: panoramaOctober,
        infoWindow: InfoWindow(
            title: panoramaOctoberName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  panoramaOctober.latitude, panoramaOctober.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(alMoezLdinAllahAlFatmiName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: alMoezLdinAllahAlFatmi,
        infoWindow: InfoWindow(
            title: alMoezLdinAllahAlFatmiName,
            onTap: () {
              getPolyline(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  alMoezLdinAllahAlFatmi.latitude,
                  alMoezLdinAllahAlFatmi.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(theHangingChurchName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: theHangingChurch,
        infoWindow: InfoWindow(
            title: theHangingChurchName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  theHangingChurch.latitude, theHangingChurch.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(alHussainMosqueName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: alHussainMosque,
        infoWindow: InfoWindow(
            title: alHussainMosqueName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  alHussainMosque.latitude, alHussainMosque.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(alHussainMosqueName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: alHussainMosque,
        infoWindow: InfoWindow(
            title: alHussainMosqueName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  alHussainMosque.latitude, alHussainMosque.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(mosqueofIbnTulunName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: mosqueofIbnTulun,
        infoWindow: InfoWindow(
            title: mosqueofIbnTulunName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  mosqueofIbnTulun.latitude, mosqueofIbnTulun.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(mosqueOfMuhammadAliName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: mosqueOfMuhammadAli,
        infoWindow: InfoWindow(
            title: mosqueOfMuhammadAliName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  mosqueOfMuhammadAli.latitude, mosqueOfMuhammadAli.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(theCopticMuseumName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: theCopticMuseum,
        infoWindow: InfoWindow(
            title: theCopticMuseumName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  theCopticMuseum.latitude, theCopticMuseum.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(gizaZoologicalGardenName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: gizaZoologicalGarden,
        infoWindow: InfoWindow(
            title: gizaZoologicalGardenName,
            onTap: () {
              getPolyline(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  gizaZoologicalGarden.latitude,
                  gizaZoologicalGarden.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(ummKulthumMuseumName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: ummKulthumMuseum,
        infoWindow: InfoWindow(
            title: gizaZoologicalGardenName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  ummKulthumMuseum.latitude, ummKulthumMuseum.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(alAzharParkName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: alAzharPark,
        infoWindow: InfoWindow(
            title: alAzharParkName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  alAzharPark.latitude, alAzharPark.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(theEgyptianMuseumName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: theEgyptianMuseum,
        infoWindow: InfoWindow(
            title: theEgyptianMuseumName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  theEgyptianMuseum.latitude, theEgyptianMuseum.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(cairoOperaHouseName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: cairoOperaHouse,
        infoWindow: InfoWindow(
            title: cairoOperaHouseName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  cairoOperaHouse.latitude, cairoOperaHouse.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(salahAlDinAlAyoubiCitadelName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: salahAlDinAlAyoubiCitadel,
        infoWindow: InfoWindow(
            title: salahAlDinAlAyoubiCitadelName,
            onTap: () {
              getPolyline(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  salahAlDinAlAyoubiCitadel.latitude,
                  salahAlDinAlAyoubiCitadel.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(aquariumGrottoGardenName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: aquariumGrottoGarden,
        infoWindow: InfoWindow(
            title: aquariumGrottoGardenName,
            onTap: () {
              getPolyline(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  aquariumGrottoGarden.latitude,
                  aquariumGrottoGarden.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(civilizationMuseumName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: civilizationMuseum,
        infoWindow: InfoWindow(
            title: civilizationMuseumName,
            onTap: () {
              getPolyline(currentLatLng.latitude, currentLatLng.longitude,
                  civilizationMuseum.latitude, civilizationMuseum.longitude);
            }),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId(theInternationalParkName),
        icon: markerIcon != null
            ? BitmapDescriptor.fromBytes(markerIcon)
            : BitmapDescriptor.defaultMarker,
        position: theInternationalPark,
        infoWindow: InfoWindow(
            title: theInternationalParkName,
            onTap: () {
              getPolyline(
                  currentLatLng.latitude,
                  currentLatLng.longitude,
                  theInternationalPark.latitude,
                  theInternationalPark.longitude);
            }),
      ),
    );
    emit(IconMarkerState());
  }

  //checkPersion before initialize the map
  void checkPermission() async {
    permission = await Geolocator.checkPermission();
    emit(GetPermissionState());
  }

  // get current location
  void getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((currLocation) {
      currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      emit(GetCurrentLocationState());
    });
  }

  //call this onPress floating action button
  void currentLocation() async {
    final GoogleMapController Mapcontroller = await controller.future;
    getCurrentLocation();
    Mapcontroller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: currentLatLng,
          zoom: 18.0,
        ),
      ),
    );
    emit(CurrentLocationState());
  }

  //Check permission status and currentPosition before render the map
  bool checkReady(LatLng? x, LocationPermission? y) {
    if (x == initPosition ||
        y == LocationPermission.denied ||
        y == LocationPermission.deniedForever) {
      return true;
    } else {
      return false;
    }
  }

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      geodesic: true,
      jointType: JointType.round,
      width: 8,
    );
    polylines[id] = polyline;
    emit(AddPolyLinesState());
  }

  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCgQhXiDI9uEutnEDHzXnHm28cF-eXswMo";

  getPolyline(
      originLatitude, originLongitude, destLatitude, destLongitude) async {
    polylines.clear();
    polylineCoordinates.clear();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(originLatitude, originLongitude),
      PointLatLng(destLatitude, destLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine();
  }

  void arrangeList(List list) {
    list.sort((a, b) => a.distance.compareTo(b.distance));
    emit(ArrangeListState());
  }
}
