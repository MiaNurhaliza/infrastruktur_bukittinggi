import 'package:flutter/material.dart';
import 'package:infrastruktur_bukittinggi/infra_main.dart';

class ImageCenter extends StatefulWidget {
  @override
  _ImageCenterState createState() => _ImageCenterState();
}

class _ImageCenterState extends State<ImageCenter> {
  int _selectedIndex = 0;
  int? _selectedShapeIndex; // untuk menyimpan pilihan radio button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar utama dengan elemen interaktif
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'lib/assets/images/imagecenter.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        "Area",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text(
                        "Area",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 400,
                child: DataTable(
                  dataRowHeight: 80,
                  columnSpacing: 7, //  spacing kolom

                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey[200]!),
                  columns: const [
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Shape',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14, // Ukuran font lebih kecil
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.all(
                            0), // Mengurangi padding untuk header
                        child: Text(
                          'Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.all(
                            0), // Mengurangi padding untuk header
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.all(
                            0), // Mengurangi padding untuk header
                        child: Text(
                          'Asset',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.all(
                            0), // Mengurangi padding untuk header
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.all(
                            0), // Mengurangi padding untuk header
                        child: Text(
                          'Action',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    3, // Jumlah baris dalam tabel
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Row(
                            children: [
                              Radio<int>(
                                value: index, // Value untuk tiap opsi
                                groupValue: _selectedShapeIndex,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedShapeIndex = value;
                                  });
                                },
                                materialTapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap, // Membuat radio button lebih kecil
                              ),
                              // Spacer minimal antara radio button dan teks
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        0), // Padding vertikal lebih kecil
                                child: Text('Rectangle',
                                    textAlign: TextAlign.left),
                              ),
                            ],
                          ),
                        ),
                        const DataCell(
                          Padding(
                            padding: EdgeInsets.all(0), // Mengurangi padding
                            child: Text('Baik', textAlign: TextAlign.left),
                          ),
                        ),
                        const DataCell(
                          Padding(
                            padding: EdgeInsets.all(0), // Mengurangi padding
                            child: Text('Port 5', textAlign: TextAlign.left),
                          ),
                        ),
                        const DataCell(
                          Padding(
                            padding: EdgeInsets.all(0), // Mengurangi padding
                            child: Text('Tidak ada aset',
                                textAlign: TextAlign.left),
                          ),
                        ),
                        const DataCell(
                          Padding(
                            padding: EdgeInsets.all(0), // Mengurangi padding
                            child: Text('digunakan untuk sambungan ke ATB',
                                textAlign: TextAlign.left),
                          ),
                        ),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                tooltip: 'Edit',
                              ),
                              const SizedBox(width: 0),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                tooltip: 'Delete',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // BottomNavigationBar
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
