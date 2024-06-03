import 'package:flutter/material.dart';
import 'main.dart'; // Ensure you import main.dart to use MainPage
import 'contact_page.dart'; // Import ContactPage

class FacilitiesPage extends StatelessWidget {
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
        title: Text('Fasilitas Cupang'),
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 10),
          Text(
            'Fasilitas Kami',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          FacilityItem(
            name: 'Aquarium',
            description:
                'Fasilitas Aquarium kami menyediakan lingkungan yang ideal untuk ikan cupang Anda. Dengan berbagai ukuran dan desain, Anda dapat menemukan akuarium yang cocok untuk kebutuhan Anda.',
           
          ),
          SizedBox(height: 10),
          FacilityItem(
            name: 'Makanan Ikan Cupang',
            description:
                'Makanan khusus ikan cupang kami diformulasikan untuk memenuhi nutrisi dan kebutuhan diet mereka. Diproduksi dari bahan-bahan berkualitas tinggi, makanan ini akan membantu menjaga kesehatan dan vitalitas ikan cupang Anda.',
           
          ),
          SizedBox(height: 10),
          FacilityItem(
            name: 'Paket Perawatan Cupang',
            description:
                'Kesehatan ikan cupang Anda adalah prioritas kami. Kami menyediakan berbagai jenis obat-obatan yang aman dan efektif untuk merawat berbagai masalah kesehatan pada ikan cupang, mulai dari infeksi hingga penyakit parasit.',
          
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  final String name;
  final String description;


  FacilityItem({
    required this.name,
    required this.description,
   
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
           
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
