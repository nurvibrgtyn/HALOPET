import 'dart:async';
import 'package:halopet/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halopet/pages/home/home_page.dart';
import 'package:halopet/pages/search/search_page.dart';

class petshop_maps extends StatefulWidget {
  const petshop_maps({Key? key}) : super(key: key);

  @override
  _petshop_mapsState createState() => _petshop_mapsState();
}

class _petshop_mapsState extends State<petshop_maps> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(target: LatLng(-7.319805107510004, 112.7396524971812), zoom: 12.0);

  static const CameraPosition targetPosition = CameraPosition(target: LatLng(-7.3272986801190685, 112.73609634631116), zoom: 18.0,  tilt: 60);
  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(
          markerId: MarkerId('1'),
          position: LatLng(-7.3272986801190685, 112.73609634631116),
          infoWindow: InfoWindow(
            title: 'Luna Pet Shop',
            snippet: 'Ruko Raya Jemur Handayani, Jl. Raya Jemursari, Jemur Wonosari, Kec. Wonocolo, Kota SBY, Jawa Timur 60239',
          )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(-7.350692387531862, 112.69399033427919),
        infoWindow: InfoWindow(
            title: 'Royal Canin',
            snippet: 'Jl. Rungkut Industri Kidul No.64 C, Rungkut Kidul, Kec. Rungkut, Kota SBY, Jawa Timur 60293',
        )
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(-7.330743590417129, 112.7654334910599),
        infoWindow: InfoWindow(
            title: 'Sweety Petshop',
            snippet: 'Jl. Imam Bonjol No.11-18, Taman, Kec. Taman, Kabupaten Sidoarjo, Jawa Timur 61257',
        )
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage()),
    ),

        color: Colors.white,

        ),//
        title: const Text("Pet Shop Terdekat"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(

        onPressed: () {
          SearchPetshop();
        },
        label: const Text("Search Nearest Pet Shop"),
        icon: const Icon(Icons.directions),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> SearchPetshop() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}