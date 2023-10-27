import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Detail_screen extends StatefulWidget {
  Detail_screen({super.key, this.latitude, this.longitude, this.name, this.icao, this.country, this.city, this.state, this.tz});

  final double? latitude;
  final double? longitude;
  final String? name;
  final String? icao;
  final String? country;
  final String? city;
  final String? state;
  final String? tz;

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  @override
  void initState() {
    super.initState();
  }

  GoogleMapController? _controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            markers: markers.values.toSet(),
            onMapCreated: (GoogleMapController controller) {
              controller!.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(widget.latitude!, widget.longitude!), 14));
              final marker = Marker(
                markerId: MarkerId('place_name'),
                position: LatLng(widget.latitude!, widget.longitude!),
                // icon: BitmapDescriptor.,
                infoWindow: InfoWindow(
                  title: 'title',
                  snippet: 'address',
                ),
              );
              setState(() {
                markers[MarkerId(widget.name!)] = marker;
              });
            },
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: MediaQuery.of(context).size.height / 4.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(widget.icao.toString())
                      ],
                    ),
                    Text(widget.city.toString()),
                    SizedBox(height: 5,),
                    Text(widget.state.toString()),
                    SizedBox(height: 5,),
                    Text(widget.country.toString()),
                    SizedBox(height: 5,),
                    Text(widget.tz.toString())
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
