// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  int _currentCarouselIndex = 0;

  final List<Map<String, dynamic>> _services = [
    {'title': 'Laporan  ', 'icon': Icons.report},
    {'title': 'Status Laporan', 'icon': Icons.article},
    {'title': 'Semua', 'icon': Icons.apps},
    {'title': 'Statistik', 'icon': Icons.money},
  ];

  final List<Map<String, dynamic>> _carouselItems = [
    {
      'title': 'Panduan penggunaan',
      'subtitle': 'Mempelajari penggunaan aplikasi secara optimal',
      'action': 'Baca Selengkapnya',
      'color': Colors.blue,
    },
    {
      'title': 'Limbah Elektronik',
      'subtitle': 'Pelajari cara membuang peralatan elektronik dengan benar.',
      'action': 'Baca Selengkapnya',
      'color': Colors.teal,
    },
  ];

  final List<Map<String, dynamic>> _features = [
    {'title': 'Lapor Sampah', 'icon': Icons.delete, 'color': Colors.green},
    {'title': 'Status Laporan', 'icon': Icons.list_alt, 'color': Colors.blue},
    {'title': 'Statistik', 'icon': Icons.bar_chart, 'color': Colors.orange},
    {'title': 'Panduan', 'icon': Icons.help, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JABE', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[700],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan informasi pengguna
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.green[700],
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.green),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Halo, Warga!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Mari jaga kebersihan lingkungan',
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Laporan Sampah',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),

            // Grid Layanan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${_services[index]['title']} ditekan'),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            _services[index]['icon'],
                            color: Colors.green[700],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _services[index]['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Carousel Slider
            SizedBox(
              height: 160,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 160,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 22 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
                items: _carouselItems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                          color: item['color'],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item['subtitle'],
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    item['action'],
                                    style: TextStyle(
                                      color: item['color'],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselItems.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(
                      _currentCarouselIndex == entry.key ? 0.9 : 0.4,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Fitur-fitur utama
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Laporan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemCount: _features.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${_features[index]['title']} ditekan'),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _features[index]['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _features[index]['color'].withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Icon(
                            _features[index]['icon'],
                            color: _features[index]['color'],
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _features[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _features[index]['color'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Menu ${_getBottomNavTitle(index)} ditekan'),
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Lapor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  String _getBottomNavTitle(int index) {
    switch (index) {
      case 0:
        return 'Beranda';
      case 1:
        return 'Aktivitas';
      case 2:
        return 'Lapor';
      case 3:
        return 'Notifikasi';
      case 4:
        return 'Profil';
      default:
        return '';
    }
  }
}
