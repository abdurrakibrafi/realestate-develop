import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'dart:developer';

import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final controller = Get.put(AddResidenceController());
  GoogleMapController? mapController;
  LatLng selectedLocation = const LatLng(40.758, -73.9855);
  String locationInfo = '';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onTap(LatLng location) async {
    setState(() {
      selectedLocation = location;
    });

    await _getAddressFromLatLng(location);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        String areaCity = _formatAddress(place);

        controller.address.value = areaCity;
        controller.latitude.value = position.latitude.toString();
        controller.longitude.value = position.longitude.toString();

        locationInfo = '''
        {
          "latitude": ${position.latitude},
          "longitude": ${position.longitude},
          "coordinates": [${position.latitude}, ${position.longitude}],
          "type": "Point",
          "address": "$areaCity"
        }''';

        log(locationInfo);
      }
    } catch (e) {
      log('Error occurred while getting location: $e');
    }
  }

  String _formatAddress(Placemark place) {
    String subLocality = place.subLocality?.trim() ?? '';
    String locality = place.locality?.trim() ?? '';
    String administrativeArea = place.administrativeArea?.trim() ?? '';
    String country = place.country?.trim() ?? '';
    String street = place.street?.trim() ?? '';
    String name = place.name?.trim() ?? '';

    List<String> addressParts = [
      if (name.isNotEmpty) name,
      if (street.isNotEmpty) street,
      if (subLocality.isNotEmpty) subLocality,
      if (locality.isNotEmpty) locality,
      if (administrativeArea.isNotEmpty) administrativeArea,
      if (country.isNotEmpty) country,
    ];

    return addressParts.join(', ');
  }

  Future<List<Location>> _searchLocation(String query) async {
    try {
      return await locationFromAddress(query);
    } catch (e) {
      log('Error searching location: $e');
      return [];
    }
  }

  Future<String> _getAddressFromLocation(Location location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return _formatAddress(place);
      }
      return 'Unknown location';
    } catch (e) {
      log('Error getting address: $e');
      return 'Unknown location';
    }
  }

  void _moveCamera(LatLng target) {
    mapController?.animateCamera(CameraUpdate.newLatLng(target));
  }

  void _onSearchSelect(Location location) {
    LatLng target = LatLng(location.latitude, location.longitude);
    setState(() {
      selectedLocation = target;
    });
    _moveCamera(target);
    _getAddressFromLatLng(target);
  }

  void _onOkPressed() {
    Navigator.pop(context, selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText('Select Location on Map', size: 16),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TypeAheadField<Location>(
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  hintText: 'Enter area, city, or country',
                  border: OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await _searchLocation(pattern);
              },
              itemBuilder: (context, Location suggestion) {
                return FutureBuilder<String>(
                  future: _getAddressFromLocation(suggestion),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ListTile(
                        title: Text('Loading...'),
                      );
                    } else if (snapshot.hasError) {
                      return const ListTile(
                        title: Text('Error loading location'),
                      );
                    } else {
                      return ListTile(
                        title: Text(snapshot.data ?? 'Unknown location'),
                        subtitle: const Text('Tap to select this location'),
                      );
                    }
                  },
                );
              },
              onSuggestionSelected: (Location suggestion) {
                _onSearchSelect(suggestion);
              },
              noItemsFoundBuilder: (context) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('No location found'),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: selectedLocation,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('selectedLocation'),
                  position: selectedLocation,
                ),
              },
              onTap: _onTap,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _onOkPressed,
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }
}



































// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
// import 'dart:developer';

// import 'package:real_estate_management/res/components/common_text.dart';
// import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final controller = Get.put(AddResidenceController());
//   GoogleMapController? mapController;
//   LatLng selectedLocation = LatLng(40.758, -73.9855);
//   String locationInfo = '';

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   void _onTap(LatLng location) async {
//     setState(() {
//       selectedLocation = location;
//     });

//     await _getAddressFromLatLng(location);
//   }

//   Future<void> _getAddressFromLatLng(LatLng position) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );

//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks[0];

//         String subLocality = place.subLocality ?? '';
//         String locality = place.locality ?? '';
//         String administrativeArea = place.administrativeArea ?? '';
//         String country = place.country ?? '';

//         // Fallback to administrativeArea and country if subLocality or locality is empty
//         String areaCity = subLocality.isNotEmpty || locality.isNotEmpty
//             ? '$subLocality, $locality'
//             : '$administrativeArea, $country';

//         controller.address.value = areaCity;
//         controller.latitude.value = position.latitude.toString();
//         controller.longitude.value = position.longitude.toString();

//         locationInfo = '''
//         {
//           "latitude": ${position.latitude},
//           "longitude": ${position.longitude},
//           "coordinates": [${position.latitude}, ${position.longitude}],
//           "type": "Point",
//           "address": "$areaCity"
//         }''';

//         // Log the full location info
//         log(locationInfo);
//       }
//     } catch (e) {
//       log('Error occurred while getting location: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: commonText('Select Location on Map', size: 16),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: selectedLocation,
//           zoom: 14.0,
//         ),
//         markers: {
//           Marker(
//             markerId: MarkerId('selectedLocation'),
//             position: selectedLocation,
//           ),
//         },
//         onTap: _onTap,
//       ),
//     );
//   }
// }
