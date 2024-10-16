import 'package:flutter/material.dart';
import 'hardware.dart';
import 'sidebar.dart';

class InfraMain extends StatefulWidget {
  final String title;

  const InfraMain({super.key, required this.title});

  @override
  State<InfraMain> createState() => _InfraMainState();
}

class _InfraMainState extends State<InfraMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // variabel untuk menyimpan item yang akan kita pilih
  String selectedItem = '/InfraMain';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Sidebar(
        onSelect: (String route) {
          Navigator.pop(context); // Tutup sidebar
          if (route.isNotEmpty) {
            setState(() {
              selectedItem = route; // Update state selectedItem
            });
            Navigator.pushNamed(context, route); // Navigasi ke halaman sesuai
          }
        },
        selectedItem: selectedItem, // Kirim selectedItem ke Sidebar
      ),
      body: Stack(
        children: [
          // Background Header
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 57, 40, 247), Color(0xFFE6DFFF)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 28.0, top: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Kategori Infrastruktur',
                      style: TextStyle(
                        color: Color(0xFF0C203B),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Icon Back
          Positioned(
            top: 30,
            left: 16,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pop(context); // Aksi untuk kembali
              },
            ),
          ),
          Positioned(
            top: 30,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.storage_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ),

          Positioned(
            left: 30,
            top: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildCategoryItem(
                  context,
                  'Brainware',
                  './lib/assets/images/brainware.png',
                  () {
                    // Aksi untuk Brainware
                  },
                ),
                const SizedBox(width: 30),
                _buildCategoryItem(
                  context,
                  'Hardware',
                  './lib/assets/images/hardware.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HardwarePage()),
                    );
                  },
                ),
                const SizedBox(width: 30),
                _buildCategoryItem(
                  context,
                  'Software',
                  './lib/assets/images/software.png',
                  () {
                    // Aksi untuk Software
                  },
                ),
              ],
            ),
          ),
        ],
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
          currentIndex: 1, // Set index sesuai dengan item BottomNavigationBar
          onTap: (index) {
            // Tambahkan aksi navigasi sesuai dengan index item BottomNavigationBar
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

  Widget _buildCategoryItem(
      BuildContext context, String label, String imageUrl, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 94,
            height: 94,
            decoration: BoxDecoration(
              color: const Color.fromARGB(250, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 6,
                  offset: Offset(2, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imageUrl, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF1F376B),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
