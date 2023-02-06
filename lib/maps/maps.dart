import 'dart:async';
import 'package:halopet/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halopet/pages/home/home_page.dart';

class maps extends StatefulWidget {
  const maps({Key? key}) : super(key: key);

  @override
  _mapsState createState() => _mapsState();
}

class _mapsState extends State<maps> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(target: LatLng(-7.319805107510004, 112.7396524971812), zoom: 12.0);

  static const CameraPosition targetPosition = CameraPosition(target: LatLng(-7.279677490515373, 112.72924818534709), zoom: 18.0,  tilt: 60);
  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(
          markerId: MarkerId('1'),
          position: LatLng(-7.336932747168534, 112.72096497153504),
          infoWindow: InfoWindow(
            title: 'Harmoni Pet Care - Klinik Hewan Surabaya',
            snippet: 'Jl. Gayungsari Timur III Blok MGJ No.3, Menanggal, Gayungan, Surabaya City, East Java 60234',
          )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(-7.279677490515373, 112.72924818534709),
        infoWindow: InfoWindow(
            title: 'K and P Clinic',
            snippet: 'Jl. Mangkunegoro No.8, Darmo, Kec. Wonokromo, Kota SBY, Jawa Timur 60241',
        )
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(-7.378177318505826, 112.70132336021494),
        infoWindow: InfoWindow(
            title: 'Dokter Hewan Sidoarjo (Drh. Erlangga Petshop and Petcare)',
            snippet: 'Jl. Ketapang - Suko, Dusun Suko, Suko, Kec. Sukodono, Kabupaten Sidoarjo, Jawa Timur 61258',
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
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => maps()),
    ),

        color: Colors.white,

        ),//
        title: const Text("Clinic Terdekat"),
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
          CariCozy();
        },
        label: const Text("Search Nearest Clinic"),
        icon: const Icon(Icons.directions),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> CariCozy() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}