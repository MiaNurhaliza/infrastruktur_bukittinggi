import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'infra_main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapsCenter extends StatefulWidget {
  const MapsCenter({super.key});

  @override
  MapCenterState createState() => MapCenterState();
}

class MapCenterState extends State<MapsCenter> {
  GoogleMapController? mapController;
  int _selectedIndex = 0;
  int? selectedCheckbox = 1;
  List<List<LatLng>> polylineCoordinatesList =
      []; // ini untuk menyimpan list titik-titik koordinat
  MapType _currentMapType = MapType.normal;
  List<Map<String, dynamic>> listDataFO = [];
  List<Map<String, dynamic>> listDataCCTV = [];

  // ini variable untuk mengontrol visabilitas line,cctv

  bool showFOMarkers = true;
  bool showCCTVMarkers = true;
  bool showPolyline = true;

  // ini variable untuk merubah warna button ketika di klik
  final List<bool> _buttonColors = [true, true, true];

  Set<Marker> cctvMarkers = {};
  Set<Marker> foMarkers = {};

  @override
  void initState() {
    super.initState();
    _loadGeoJsonData();
    _loadCCTVData();
    _loadFOData();
    _loadlistDataFO();
    _loadlistDataCCTV();
  }

  // Fungsi untuk memuat file JSON dan memparsing data koordinat
  Future<void> _loadGeoJsonData() async {
    final String response = await rootBundle
        .loadString('./lib/assets/data/01HPR1A8GTRBT4TRJG4KAHG1FX.json');
    final data = json.decode(response);

    polylineCoordinatesList.clear();

    // Loop untuk semua fitur dalam file JSON
    for (var feature in data['features']) {
      List<dynamic> coordinates = feature['geometry']['coordinates'];
      List<LatLng> polylineCoordinates = [];

      // Loop untuk setiap koordinat
      for (var coord in coordinates) {
        polylineCoordinates.add(LatLng(coord[1], coord[0]));
      }

      polylineCoordinatesList.add(polylineCoordinates);
    }

    setState(() {}); // Memperbarui UI setelah memuat koordinat
  }

  // Fungsi untuk memuat data CCTV dari file JSON
  Future<void> _loadCCTVData() async {
    final String cctvResponse = await rootBundle
        .loadString('./lib/assets/data/01HQA2T87PETB77Q005C00STC8.json');
    final cctvData = json.decode(cctvResponse);

    Set<Marker> cctvMarkerSet = {};

    // Loop untuk semua fitur CCTV dalam file JSON
    for (var feature in cctvData['features']) {
      double lat = feature['geometry']['coordinates'][1];
      double lng = feature['geometry']['coordinates'][0];
      String namobj = feature['properties']['NAMOBJ'];
      String imageUrl = feature['properties']['GAMBAR'];
      String remark = feature['properties']['REMARK'];

      cctvMarkerSet.add(
        Marker(
          markerId:
              MarkerId('cctv_${namobj}'), // ID marker berdasarkan nama objek
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: namobj, snippet: 'CCTV Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onTap: () {
            _onMarkerTappedCctv(
                MarkerId('cctv_$namobj'), namobj, remark, imageUrl);
          },
        ),
      );
    }

    setState(() {
      cctvMarkers = cctvMarkerSet;
    });
  }

  // ketika cctv diklik
  void _onMarkerTappedCctv(
      MarkerId markerId, String namobj, String remark, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "CCTV",
            style: TextStyle(fontSize: 18),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Lokasi : $namobj",
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                "Remark : $remark",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              imageUrl.isNotEmpty
                  ? Image.asset('lib/assets/images/imagecctv.jpg')
                  : const Text('No image available'),
            ],
          ),
        );
      },
    );
  }

  // data tiang FO
  Future<void> _loadFOData() async {
    final String foResponse = await rootBundle
        .loadString('./lib/assets/data/01HPR2WHZXDZ2358QWT8RG9BAF.json');
    final foData = json.decode(foResponse);

    Set<Marker> foMarkerSet = {};

    for (var feature in foData['features']) {
      double lat = feature['geometry']['coordinates'][1];
      double lng = feature['geometry']['coordinates'][0];
      String no = feature['properties']['NO'];
      String name = feature['properties']['NAME'];
      String imageUrl = feature['properties']['GAMBAR'];

      foMarkerSet.add(
        Marker(
          markerId: MarkerId('fo_$no'),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name, snippet: 'Tiang FO'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {
            _onMarkerTapped(MarkerId('fo_$no'), no, name, imageUrl);
          },
        ),
      );
    }

    setState(() {
      foMarkers = foMarkerSet;
    });
  }

  // Ffungsi untuk popup ketika marker di kllik
  void _onMarkerTapped(
      MarkerId markerId, String no, String nama, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Tiang FO",
            style: TextStyle(fontSize: 18),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "No : $no",
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                "Nama : $nama",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              imageUrl.isNotEmpty
                  ? Image.asset('lib/assets/images/router.jpeg')
                  : const Text('No image available'),
            ],
          ),
        );
      },
    );
  }

//data untuk chatboxnya
  Future<void> _loadlistDataFO() async {
    final String jsonResponse = await rootBundle.loadString(
        './lib/assets/data/01HPR2WHZXDZ2358QWT8RG9BAF.json'); // Sesuaikan file JSON kamu
    final data = json.decode(jsonResponse);

    List<Map<String, dynamic>> tempList = [];

    for (var feature in data['features']) {
      tempList.add({
        'no': feature['properties']['NO'],
        'nama': feature['properties']['NAME'],
        'gambar': feature['properties']['GAMBAR'] ?? "",
      });
    }

    setState(() {
      listDataFO = tempList; // menyimpan ke listDataFO
    });
  }

  Future<void> _loadlistDataCCTV() async {
    final String jsonResponse = await rootBundle
        .loadString('.lib/assets/data/01HQA2T87PETB77Q005C00STC8.json');
    final data = json.decode(jsonResponse);

    List<Map<String, dynamic>> tempList = [];

    for (var feature in data['features']) {
      tempList.add({
        'Lokasi': feature['properties']['Namobj'],
        'Remark': feature['properties']['Remark'],
        'gambar': feature['properties']['GAMBAR'] ?? "",
      });
    }

    setState(() {
      listDataCCTV = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maps Location',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 57, 40, 247),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 4,
              child: SizedBox(
                height: 360,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-0.3007865012348818, 100.37352464210747),
                    zoom: 13,
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId('marker1'),
                      position: LatLng(-0.30485525765404325, 100.3695635430293),
                      infoWindow: InfoWindow(title: 'Bukittinggi'),
                    ),
                    if (showCCTVMarkers) ...cctvMarkers,
                    if (showFOMarkers) ...foMarkers,
                  },
                  polylines: showPolyline && polylineCoordinatesList.isNotEmpty
                      ? {
                          for (int i = 0;
                              i < polylineCoordinatesList.length;
                              i++)
                            Polyline(
                              polylineId: PolylineId('line${i + 1}'),
                              color: Colors.blue,
                              width: 5,
                              points: polylineCoordinatesList[i],
                            ),
                        }
                      : {},
                  mapType: _currentMapType,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300, // ini mengatur semua tinggi layoutnya
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: selectedCheckbox == 1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedCheckbox = 1;
                                    _currentMapType = MapType.normal;
                                  });
                                },
                              ),
                              const Text('Street'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: selectedCheckbox == 2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedCheckbox = 2;
                                    _currentMapType = MapType.satellite;
                                  });
                                },
                              ),
                              const Text('Satellite'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 10),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: _buttonColors[0]
                                  ? const Color.fromARGB(255, 100, 141, 255)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(12),
                            ),
                            child: Icon(
                              FontAwesomeIcons.towerCell,
                              color: _buttonColors[0]
                                  ? Colors.white
                                  : const Color.fromARGB(255, 57, 40, 247),
                            ),
                            onPressed: () {
                              setState(() {
                                _buttonColors[0] = !_buttonColors[0];
                                showFOMarkers = !showFOMarkers;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: _buttonColors[1]
                                  ? const Color.fromARGB(255, 100, 141, 255)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(12),
                            ),
                            child: Icon(
                              FontAwesomeIcons.video,
                              color: _buttonColors[1]
                                  ? Colors.white
                                  : const Color.fromARGB(255, 57, 40, 247),
                            ),
                            onPressed: () {
                              setState(() {
                                _buttonColors[1] = !_buttonColors[1];
                                showCCTVMarkers = !showCCTVMarkers;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: _buttonColors[2]
                                  ? const Color.fromARGB(255, 100, 141, 255)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(12),
                            ),
                            child: Icon(
                              FontAwesomeIcons.linesLeaning,
                              color: _buttonColors[2]
                                  ? Colors.white
                                  : const Color.fromARGB(255, 97, 83, 255),
                            ),
                            onPressed: () {
                              setState(() {
                                _buttonColors[2] = !_buttonColors[2];
                                showPolyline = !showPolyline;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ini line pembatasnya
              Container(
                width: 1,
                height: 300,
                color: Colors.black,
              ),
              Expanded(
                flex: 5, // Ini untuk menambah lebarnya
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 5),
                  child: showFOMarkers
                      ? ListView.builder(
                          itemCount: listDataFO.length,
                          itemBuilder: (context, index) {
                            final item = listDataFO[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.location_pin,
                                    color: Color.fromARGB(255, 33, 224, 39)),
                                title: Text(item['nama']),
                                subtitle: Text("No: ${item['no']}"),
                                trailing: const Icon(Icons.arrow_forward_ios,
                                    size: 16),
                                onTap: () {
                                  _onMarkerTapped(
                                    MarkerId(item['no']),
                                    item['no'],
                                    item['nama'],
                                    item['gambar'],
                                  );
                                },
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text("Tidak Ada Data"),
                        ),
                ),
              )
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 57, 40, 247),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFFF0F0F0),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });

            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const InfraMain(title: 'Infrastruktur')),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'Infrastruktur',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
