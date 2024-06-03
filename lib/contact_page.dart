import 'package:flutter/material.dart';
import 'main.dart'; // Ensure you import main.dart to use MainPage
import 'facilities.dart'; // Import FacilitiesPage

class ContactPage extends StatelessWidget {
  void _onMenuItemSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ContactPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FacilitiesPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak'),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.menu),
            onSelected: (int index) => _onMenuItemSelected(context, index),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Beranda'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('Kontak'),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text('Fasilitas Cupang'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hubungi Kami',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Email:@ngecupangkuy.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Telepon: +62 857 555 592 10',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
