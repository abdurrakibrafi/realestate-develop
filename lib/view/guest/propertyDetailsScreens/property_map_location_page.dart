
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyMapScreen extends StatefulWidget {
  final double lat;
  final double lng;
  const PropertyMapScreen({super.key, required this.lat, required this.lng});

  @override
  _PropertyMapScreenState createState() => _PropertyMapScreenState();
}

class _PropertyMapScreenState extends State<PropertyMapScreen> {
  GoogleMapController? _controller;
 // static  LatLng? _initialPosition ; // San Francisco
  final Set<Marker> _markers = {};



  @override
  void initState() {
    super.initState();
//    _initialPosition = LatLng(widget.lat, widget.lng);
    _markers.add(
      Marker(
        markerId: MarkerId('marker_1'),
        position:  LatLng(widget.lat, widget.lng),
        // infoWindow: InfoWindow(
        //   title: 'San Francisco',
        //   snippet: 'A cool place to visit',
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Mapview'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target:  LatLng(widget.lat, widget.lng),
          zoom: 12.0,
        ),
        markers: _markers,
      ),
    );
  }
}