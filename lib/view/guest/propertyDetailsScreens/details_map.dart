import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatelessWidget {
  final LatLng location;

  const GoogleMapScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location on Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: location,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('location_marker'),
            position: location,
          ),
        },
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }
}
