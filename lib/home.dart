import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final Function(String) addToCart;

  HomePage({required this.addToCart});

  void _navigateToDetails(BuildContext context, String title, List<Fish> fishes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(title: title, fishes: fishes, addToCart: addToCart),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           Text(
            'Cupang Terbaik',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.0),
          Image.asset('assets/images/cupangterbaik.jpg'), // Replace with your image path
          SizedBox(height: 10.0),
         
          SizedBox(height: 20.0),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.0),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () => _navigateToDetails(context, 'Plakat', plakatFishes),
                child: FishCategoryCard(
                  imagePath: 'assets/images/plakat.png',
                  categoryName: 'Plakat',
                ),
              ),
              GestureDetector(
                onTap: () => _navigateToDetails(context, 'Halfmoon', halfmoonFishes),
                child: FishCategoryCard(
                  imagePath: 'assets/images/halfmoon.png',
                  categoryName: 'Halfmoon',
                ),
              ),
              GestureDetector(
                onTap: () => _navigateToDetails(context, 'Crowntail', crowntailFishes),
                child: FishCategoryCard(
                  imagePath: 'assets/images/crowntail.png',
                  categoryName: 'Crowntail',
                ),
              ),
              GestureDetector(
                onTap: () => _navigateToDetails(context, 'Double Tail', doubletailFishes),
                child: FishCategoryCard(
                  imagePath: 'assets/images/doubletail.png',
                  categoryName: 'Double Tail',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FishCategoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryName;

  FishCategoryCard({required this.imagePath, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            categoryName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }
}

class Fish {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Fish({required this.name, required this.description, required this.price, required this.imagePath});
}

final List<Fish> plakatFishes = [
  Fish(name: 'Plakat White Platinum', description: 'Plakat White Platinum memiliki warna putih yang elegan dan sirip yang pendek dan tebal. Jenis ini sangat digemari karena keindahan dan kekuatannya.', price: 100000, imagePath: 'assets/images/plakat_white_platinum.webp'),
  Fish(name: 'Plakat Neon', description: 'Plakat Neon dikenal dengan warna cerah dan mengkilap yang memukau. Ikan ini memiliki sirip pendek yang kuat dan merupakan pilihan favorit untuk kompetisi.', price: 150000, imagePath: 'assets/images/plakat_neon.webp'),
  Fish(name: 'Plakat BlueRim', description: 'Plakat BlueRim memiliki kombinasi warna biru di bagian tepi siripnya yang membuatnya tampak eksotis dan unik. Ikan ini sering menjadi pusat perhatian di akuarium.', price: 200000, imagePath: 'assets/images/plakat_bluerim.webp'),
];

final List<Fish> halfmoonFishes = [
  Fish(name: 'Halfmoon DumbEar', description: 'Halfmoon DumbEar dikenal dengan siripnya yang lebar dan simetris, membentuk setengah lingkaran saat dibentangkan. Jenis ini memiliki warna yang beragam dan sering digunakan dalam kontes.', price: 120000, imagePath: 'assets/images/halfmoon_dumbear.webp'),
  Fish(name: 'Halfmoon Blue Panda', description: 'Halfmoon Blue Panda memiliki warna biru dengan pola panda yang menarik. Siripnya yang besar dan lebar membuatnya sangat mencolok di akuarium.', price: 170000, imagePath: 'assets/images/halfmoon_bluepanda.webp'),
  Fish(name: 'Halfmoon BigEar', description: 'Halfmoon BigEar memiliki sirip yang sangat besar dan lebar, menyerupai telinga besar. Warna dan bentuknya yang unik menjadikannya salah satu jenis yang paling dicari.', price: 220000, imagePath: 'assets/images/halfmoon_bigear.webp'),
];

final List<Fish> crowntailFishes = [
  Fish(name: 'Crowntail Fancy', description: 'Crowntail Fancy memiliki sirip yang bergerigi seperti mahkota, dengan warna yang cerah dan menarik. Ikan ini dikenal karena penampilannya yang eksotis dan indah.', price: 130000, imagePath: 'assets/images/crowntail_fancy.webp'),
  Fish(name: 'Crowntail White Premium', description: 'Crowntail White Premium memiliki warna putih bersih dengan sirip yang menyerupai mahkota. Ikan ini sangat elegan dan menjadi pilihan utama para kolektor.', price: 180000, imagePath: 'assets/images/crowntail_white_premium.webp'),
  Fish(name: 'Crowntail Yellow', description: 'Crowntail Yellow dikenal dengan warna kuning cerah dan sirip bergerigi yang indah. Jenis ini sangat menarik perhatian dan cocok untuk hiasan akuarium.', price: 230000, imagePath: 'assets/images/crowntail_yellow.webp'),
];

final List<Fish> doubletailFishes = [
  Fish(name: 'Double Tail Halfmoon', description: 'Double Tail Halfmoon memiliki dua ekor yang membentuk setengah lingkaran saat dibentangkan. Jenis ini memiliki warna yang menarik dan bentuk ekor yang unik.', price: 140000, imagePath: 'assets/images/doubletail_halfmoon.webp'),
  Fish(name: 'Double Tail BlueRed', description: 'Double Tail BlueRed memiliki dua ekor dengan warna biru dan merah yang mencolok. Kombinasi warna yang menarik membuatnya menjadi salah satu ikan favorit.', price: 190000, imagePath: 'assets/images/doubletail_bluered.jpeg'),
  Fish(name: 'Double Tail Blue', description: 'Double Tail Blue memiliki dua ekor dengan warna biru yang indah. Bentuk ekor yang unik dan warna yang mencolok membuatnya menjadi pilihan yang populer.', price: 240000, imagePath: 'assets/images/doubletail_blue.jpeg'),
];

