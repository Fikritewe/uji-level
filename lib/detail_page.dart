import 'package:flutter/material.dart';
import 'home.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final List<Fish> fishes;
  final Function(String) addToCart;

  DetailsPage({required this.title, required this.fishes, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: fishes.length,
        itemBuilder: (context, index) {
          final fish = fishes[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fish.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Image.asset(
                    fish.imagePath,
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5.0),
                  Text(fish.description),
                  SizedBox(height: 5.0),
                  Text('Harga: Rp ${fish.price.toString()}'),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        addToCart(fish.name);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${fish.name} ditambahkan ke keranjang.'),
                          ),
                        );
                      },
                      child: Text('Tambahkan ke Keranjang'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
