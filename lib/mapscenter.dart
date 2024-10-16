import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'infra_main.dart';

class MapsCenter extends StatefulWidget {
  const MapsCenter({super.key});

  @override
  _MapCenterState createState() => _MapCenterState();
}

class _MapCenterState extends State<MapsCenter> {
  GoogleMapController? mapController;
  int _selectedIndex = 0;
  int? selectedCheckbox;

  // ini untuk menyimpan perubahan warna tombol ketika diklik
  List<bool> _buttonColors = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maps Location',
          style: TextStyle(
            color: Colors.white,
          ),
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
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              elevation: 4,
              child: Container(
                height: 400,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-0.2015, 100.4053), // Koordinat Bukittinggi
                    zoom: 14,
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId('marker1'),
                      position: LatLng(-0.2015, 100.4053),
                      infoWindow: InfoWindow(title: 'Bukittinggi'),
                    ),
                  },
                ),
              ),
            ),
            // const SizedBox(height: 1), // Padding antara map dan checkbox
            // Checkbox
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: selectedCheckbox == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckbox = 1;
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
                          });
                        },
                      ),
                      const Text('Satellite'),
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Padding antara checkbox dan tombol
                  // Tombol
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              _buttonColors[0] ? Colors.purple : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.network_cell,
                            color: _buttonColors[0]
                                ? Colors.white
                                : Colors.purple),
                        onPressed: () {
                          setState(() {
                            _buttonColors[0] = !_buttonColors[0];
                          });
                        },
                      ),
                      const SizedBox(
                          height:
                              10), // Padding antara tombol pertama dan kedua
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              _buttonColors[1] ? Colors.purple : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.build,
                            color: _buttonColors[1]
                                ? Colors.white
                                : Colors.purple),
                        onPressed: () {
                          setState(() {
                            _buttonColors[1] = !_buttonColors[1];
                          });
                        },
                      ),
                      const SizedBox(
                          height: 10), // Padding antara tombol kedua dan ketiga
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              _buttonColors[2] ? Colors.purple : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.edit,
                            color: _buttonColors[2]
                                ? Colors.white
                                : Colors.purple),
                        onPressed: () {
                          setState(() {
                            _buttonColors[2] = !_buttonColors[2];
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
