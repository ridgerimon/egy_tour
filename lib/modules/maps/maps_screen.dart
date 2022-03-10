import 'package:egy_tour/modules/maps/cubit/cubit.dart';
import 'package:egy_tour/modules/maps/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MapCubit()..getCurrentLocation()..checkPermission()..customMarker(),
      child: BlocConsumer<MapCubit, MapStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            body:MapCubit.get(context).checkReady(
              MapCubit.get(context).currentLatLng,
              MapCubit.get(context).permission,)
                ? const Center(child: CircularProgressIndicator())
                //Stack : place floating action button on top of the map
                : Stack(children: [
                    GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      compassEnabled: true,
                      polylines: Set<Polyline>.of(MapCubit.get(context).polylines.values),
                      markers: Set<Marker>.of(MapCubit.get(context).markers),
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(target: MapCubit.get(context).currentLatLng),
                      onMapCreated: (GoogleMapController controller) {
                        MapCubit.get(context).controller.complete(controller);
                        MapCubit.get(context).currentLocation();
                      },
                    ),
                    //Positioned : use to place button bottom right corner
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: FloatingActionButton(
                            onPressed:
                            MapCubit.get(context).currentLocation,
                            child: const Icon(Icons.location_on)),
                      ),
                    ),
                  ]),
          );
        },
      ),
    );
  }
}
