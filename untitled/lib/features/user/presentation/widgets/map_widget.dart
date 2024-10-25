import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  Position? position;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _kGooglePlex;
  Set<Marker> markers = {};
  final Set<Polyline> _polylines = {};

  final List<LatLng> _polylineCoordinates = [
    const LatLng(-31.421190, -64.184747),
    const LatLng(-31.420066, -64.188825),
    const LatLng(-31.422282, -64.189705),
    const LatLng(-31.423070, -64.187424),
    const LatLng(-31.428118, -64.185136),
  ];

  @override
  void initState() {
    getPosition();
    super.initState();
  }

  Future<void> getPosition() async {
    position = await _determinePosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    setMarker();

    setPolyLines();

    setState(() {});
  }

  void setPolyLines() {
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route1'),
        points: _polylineCoordinates, // Coordenadas de la polilínea
        color: Colors.blue, // Color de la polilínea
        width: 5, // Ancho de la polilínea
      ),
    );
  }

  void setMarker() {
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId('initialPosition'),
      onDrag: null,
      onDragStart: null,
      position: LatLng(position!.latitude, position!.longitude),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMap(),
    );
  }

  Widget buildMap() {
    if (position == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: GoogleMap(
          polylines: _polylines,
          markers: markers,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      );
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
