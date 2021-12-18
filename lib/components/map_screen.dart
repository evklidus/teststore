// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:uuid/uuid.dart';

class MapScreen extends StatefulWidget {
  MapScreen({ Key? key }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final LatLng _center = const LatLng(55.70632,37.603011);
  
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId(const Uuid().v4()),
      position: const LatLng(55.70632,37.603011),
      infoWindow: const InfoWindow(
        title: 'AWG IT Company',
      ),
    ),
    Marker(
      markerId: MarkerId(const Uuid().v4()),
      position: const LatLng(55.760798,37.619773),
      infoWindow: const InfoWindow(
        title: 'TSUM Moscow',
        snippet: 'Shop for clothes, shoes and more',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Our Shops'),
          backgroundColor: AppColors.orangeColor,
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.satellite,
          markers: _markers,
        )
    );
  }
}