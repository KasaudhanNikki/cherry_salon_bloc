import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  GoogleMapController? _mapController;

  LatLng? _currentLatLng;
  String _currentAddress = "Fetching location...";

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    LatLng latLng = LatLng(position.latitude, position.longitude);

    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks.first;

    String address =
        "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}";

    setState(() {
      _currentLatLng = latLng;
      _currentAddress = address;

      _markers = {
        Marker(
          markerId: const MarkerId("current_location"),
          position: latLng,
          infoWindow: InfoWindow(title: address),
        )
      };
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLatLng == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentLatLng!,
              zoom: 13,
            ),
            markers: _markers,
            myLocationEnabled: true,
            onMapCreated: (controller) => _mapController = controller,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          child: Text(
            _currentAddress,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}