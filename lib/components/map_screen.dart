// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:location/location.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/load_indicator.dart';
import 'package:uuid/uuid.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool? permisson;

  // Future<void> _checkPermission() async { // for check gps
  //   final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
  //   final isGpsOn = serviceStatus == ServiceStatus.enabled;
  //   // return isGpsOn;
  //   permisson = isGpsOn;
  //   setState(() {});
  // }

  Future<void> _getPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      print('Permission granted');
      permisson = true;
      setState(() {});
    } else if (status == PermissionStatus.denied) {
      print(
          'Permission denied. Show a dialog and again ask for the permission');
      permisson = false;
      setState(() {});
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
      bool allow = await openAppSettings();
      permisson = allow;
      setState(() {});
    }
  }

  final LatLng _center = const LatLng(55.70632, 37.603011);

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId(const Uuid().v4()),
      position: const LatLng(55.70632, 37.603011),
      infoWindow: const InfoWindow(
        title: 'AWG IT Company',
      ),
    ),
    Marker(
      markerId: MarkerId(const Uuid().v4()),
      position: const LatLng(55.760798, 37.619773),
      infoWindow: const InfoWindow(
        title: 'TSUM Moscow',
        snippet: 'Shop for clothes, shoes and more',
      ),
    ),
  };

  Widget _gMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      mapType: MapType.satellite,
      markers: _markers,
    );
  }

  Widget _permissionWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please allow the use of geo data for maps'),
          ElevatedButton(
            child: const Text('Allow'),
            onPressed: () {
              _getPermission();
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Shops'),
        backgroundColor: AppColors.orangeColor,
      ),
      body: permisson == null ? const LoadIndicator() : (permisson! ? _gMap() : _permissionWidget()),
    );
  }
}
