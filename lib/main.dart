import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'contact_page.dart';
import 'facilities.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NgecupangKuy',
      theme: ThemeData(
        primaryColor: Color(0xFFE3F2FD),
        scaffoldBackgroundColor: Color(0xFFE3F2FD), 
        appBarTheme: AppBarTheme(
          color: Color(0xFFE3F2FD),
          toolbarTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> cartItems = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _addToCart(String item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _onMenuItemSelected(int index) {
    switch (index) {
      case 0:
        _tabController.index = 0;
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FacilitiesPage()),
        );
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NgecupangKuy'),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.menu),
            onSelected: _onMenuItemSelected,
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
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(addToCart: _addToCart),
          CartPage(cartItems: cartItems, removeFromCart: _removeFromCart),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Beranda'),
          Tab(icon: Icon(Icons.shopping_cart), text: 'Keranjang'),
        ],
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }
}
