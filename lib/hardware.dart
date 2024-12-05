import 'package:flutter/material.dart';
import 'package:infrastruktur_bukittinggi/infra_main.dart';
import 'package:infrastruktur_bukittinggi/mapscenter.dart';
import 'imagecenter.dart';

class HardwarePage extends StatefulWidget {
  @override
  _HardwarePageState createState() => _HardwarePageState();
}

class _HardwarePageState extends State<HardwarePage> {
  int _selectedIndex = 0;

  void _showBBCDialog() {
    double cardWidth = MediaQuery.of(context).size.width * 0.9;
    double cardHeight = MediaQuery.of(context).size.height * 0.6;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Container(
            height: cardHeight,
            width: cardWidth,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Perangkat di BBC',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 57, 40, 247),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'lib/assets/images/perangkatbcc.jpg',
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30, width: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        backgroundColor: const Color.fromARGB(255, 57, 40, 247),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Maps Image',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Column(
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.of(context).pop();
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 100,
                  //           vertical: 15,
                  //         ),
                  //         backgroundColor: Color.fromARGB(255, 57, 40, 247),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         'Maps Image',
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 228, 165, 107),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Maps Location',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDataCenterDialog() {
    double cardWidth = MediaQuery.of(context).size.width * 0.9;
    double cardHeight = MediaQuery.of(context).size.height * 0.6;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Container(
            height: cardHeight,
            width: cardWidth,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Perangkat di Data Center',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 57, 40, 247),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'lib/assets/images/perangkatcenter.jpg',
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30, width: 50),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageCenter(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        backgroundColor: const Color.fromARGB(255, 57, 40, 247),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Maps Image',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Image Center (Maps Location)
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapsCenter()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 228, 165, 107),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Maps Location',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // void _showDataCenterDialog() {
  //   double cardWidth = MediaQuery.of(context).size.width * 0.9;
  //   double cardHeight = MediaQuery.of(context).size.height * 0.5;

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16.0),
  //         ),
  //         insetPadding:
  //             const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
  //         child: Container(
  //           height: cardHeight,
  //           width: cardWidth,
  //           padding: const EdgeInsets.all(20.0),
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 const Text(
  //                   'Perangkat di Data Center',
  //                   style: TextStyle(
  //                     fontSize: 30,
  //                     fontWeight: FontWeight.bold,
  //                     color: Color.fromARGB(255, 57, 40, 247),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 16.0),
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(16),
  //                   child: Image.asset(
  //                     'lib/assets/images/perangkatcenter.jpg',
  //                     height: MediaQuery.of(context).size.height * 0.2,
  //                     width: MediaQuery.of(context).size.width * 0.8,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 30),
  //                 Column(
  //                   children: [
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                         // Navigasi ke halaman peta
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => ImageCenter(),
  //                           ),
  //                         );
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 100,
  //                           vertical: 15,
  //                         ),
  //                         backgroundColor:
  //                             const Color.fromARGB(255, 57, 40, 247),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(8.0),
  //                         ),
  //                       ),
  //                       child: const Text(
  //                         'Maps Image',
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10),
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                         // Navigasi ke halaman peta
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => MapsCenter(),
  //                           ),
  //                         );
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 93,
  //                           vertical: 15,
  //                         ),
  //                         backgroundColor:
  //                             const Color.fromARGB(255, 228, 165, 107),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(8.0),
  //                         ),
  //                       ),
  //                       child: const Text(
  //                         'Maps Location',
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 57, 40, 247),
                      Color(0xFFE6DFFF),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              left: 25,
              right: 16,
              child: const Text(
                'Hardware',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.22,
              left: 16,
              right: 16,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _showBBCDialog,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20)),
                                child: Image.asset(
                                  'lib/assets/images/perangkatbcc.jpg',
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Perangkat di BBC',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _showDataCenterDialog,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20)),
                                child: Image.asset(
                                  'lib/assets/images/perangkatcenter.jpg',
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Perangkat di Data Center',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
