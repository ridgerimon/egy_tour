import 'dart:io';
import 'dart:math';

import 'package:egy_tour/models/tour_model.dart';
import 'package:egy_tour/modules/maps/cubit/cubit.dart';
import 'package:egy_tour/modules/maps/cubit/states.dart';
import 'package:egy_tour/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class TourListScreen extends StatelessWidget {
  late LatLng placeDistance;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener: (context, states) {},
      builder: (context, states) {
        List<TourPlaces> tour = [
          TourPlaces(
            placeLatLng: pharaonicVillage,
            placeName: pharaonicVillageName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              pharaonicVillage.latitude,
              pharaonicVillage.longitude,
            ) * 0.001).round().toString(),
          ),
          TourPlaces(
            placeLatLng: saintBarbaraArchaeologicalChurch,
            placeName: saintBarbaraArchaeologicalChurchName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              saintBarbaraArchaeologicalChurch.latitude,
              saintBarbaraArchaeologicalChurch.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: stGeorgeChurch, placeName: stGeorgeChurchName,distance: (Geolocator.distanceBetween(
            MapCubit.get(context).currentLatLng.latitude,
            MapCubit.get(context).currentLatLng.longitude,
            stGeorgeChurch.latitude,
            stGeorgeChurch.longitude,
          ) *
              0.001)
              .round()
              .toString(),),
          TourPlaces(placeLatLng: zamalekArtHall
            , placeName: zamalekArtHallName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              zamalekArtHall.latitude,
              zamalekArtHall.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: alRodaNiloMeter, placeName: alRodaNiloMeterName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              alRodaNiloMeter.latitude,
              alRodaNiloMeter.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: panoramaOctober, placeName: panoramaOctoberName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              panoramaOctober.latitude,
              panoramaOctober.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: egyptianRailwayMuseum,
            placeName: egyptianRailwayMuseumName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              egyptianRailwayMuseum.latitude,
              egyptianRailwayMuseum.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: lakeAinalSira, placeName: lakeAinalSiraName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              lakeAinalSira.latitude,
              lakeAinalSira.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: alMoezLdinAllahAlFatmi,
            placeName: alMoezLdinAllahAlFatmiName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              alMoezLdinAllahAlFatmi.latitude,
              alMoezLdinAllahAlFatmi.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: theHangingChurch, placeName: theHangingChurchName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              theHangingChurch.latitude,
              theHangingChurch.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: alHussainMosque, placeName: alHussainMosqueName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              alHussainMosque.latitude,
              alHussainMosque.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: mosqueofIbnTulun, placeName: mosqueofIbnTulunName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              mosqueofIbnTulun.latitude,
              mosqueofIbnTulun.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: mosqueOfMuhammadAli, placeName: mosqueOfMuhammadAliName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              mosqueOfMuhammadAli.latitude,
              mosqueOfMuhammadAli.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: theCopticMuseum, placeName: theCopticMuseumName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              theCopticMuseum.latitude,
              theCopticMuseum.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: gizaZoologicalGarden,
            placeName: gizaZoologicalGardenName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              gizaZoologicalGarden.latitude,
              gizaZoologicalGarden.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: ummKulthumMuseum, placeName: ummKulthumMuseumName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              ummKulthumMuseum.latitude,
              ummKulthumMuseum.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: alAzharPark, placeName: alAzharParkName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              alAzharPark.latitude,
              alAzharPark.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: theEgyptianMuseum, placeName: theEgyptianMuseumName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              theEgyptianMuseum.latitude,
              theEgyptianMuseum.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(placeLatLng: cairoOperaHouse, placeName: cairoOperaHouseName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              cairoOperaHouse.latitude,
              cairoOperaHouse.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: salahAlDinAlAyoubiCitadel,
            placeName: salahAlDinAlAyoubiCitadelName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              salahAlDinAlAyoubiCitadel.latitude,
              salahAlDinAlAyoubiCitadel.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
          TourPlaces(
            placeLatLng: aquariumGrottoGarden,
            placeName: aquariumGrottoGardenName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              aquariumGrottoGarden.latitude,
              aquariumGrottoGarden.longitude,
            ) *
                0.001)
                .round()
                .toString(),

          ),
          TourPlaces(
            placeLatLng: civilizationMuseum, placeName: civilizationMuseumName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              civilizationMuseum.latitude,
              civilizationMuseum.longitude,
            ) *
                0.001)
                .round()
                .toString(),

          ),
          TourPlaces(
            placeLatLng: theInternationalPark,
            placeName: theInternationalParkName,
            distance: (Geolocator.distanceBetween(
              MapCubit.get(context).currentLatLng.latitude,
              MapCubit.get(context).currentLatLng.longitude,
              theInternationalPark.latitude,
              theInternationalPark.longitude,
            ) *
                0.001)
                .round()
                .toString(),
          ),
        ];

        MapCubit.get(context).arrangeList(tour);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Tourist",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      TourListItem(tour[index], context),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: tour.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget TourListItem(TourPlaces model, context) {




    LatLng placeDistance = model.placeLatLng;

    var totalDistancePlace = Geolocator.distanceBetween(
    MapCubit.get(context).currentLatLng.latitude,
    MapCubit.get(context).currentLatLng.longitude,
    placeDistance.latitude,
    placeDistance.longitude,
    );

    int speed = 60;
    double time = totalDistancePlace / speed;

    String timeDistance = durationToString(time.round());


    return GestureDetector(
      onTap: (){
        MapsLauncher.launchCoordinates(
            placeDistance.latitude, placeDistance.longitude, 'Google Headquarters are here');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/map.png",
                  width: 70,
                  height: 70,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model.placeName}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        Text(
                          "${timeDistance}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Icon(Icons.social_distance_outlined),
                        Text(
                          "${model.distance}KM",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }
}
