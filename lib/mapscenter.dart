import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsCenter extends StatefulWidget {
  @override
  _MapsCenterState createState() => _MapsCenterState();
}

class _MapsCenterState extends State<MapsCenter> {
  late GoogleMapController mapController;

  // Anda dapat menambahkan data marker dan latLng di sini
  // Contoh marker bisa menggunakan loadJsonData() yang sudah kita diskusikan sebelumnya
  final LatLng _initialCameraPosition = LatLng(-0.298715, 100.379153);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tampilan Peta'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          // Bagian Peta
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _initialCameraPosition,
                    zoom: 15,
                  ),
                  markers: {}, // Tambahkan markers di sini
                ),
                // Overlay informasi di atas peta
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Text('PORT/01/DISKOMINFO',
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
          // Bagian Kontrol di bawah
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                CheckboxListTile(
                  title: Text('Street'),
                  value: true,
                  onChanged: (bool? value) {
                    setState(() {
                      // logika untuk mengubah tampilan street
                    });
                  },
                ),
                SizedBox(height: 10),
                // Anda bisa menambahkan elemen lain sesuai kebutuhan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(icon: Icon(Icons.info), onPressed: () {}),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                    IconButton(icon: Icon(Icons.save), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MapsCenter(),
  ));
}
