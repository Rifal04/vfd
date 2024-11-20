import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '>>> Daftar Menu V F D <<<',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 254, 2, 2), Color.fromARGB(255, 251, 251, 251)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        bottom: const TabBar(
        labelColor: Color.fromARGB(255, 244, 7, 7),
        unselectedLabelColor: Colors.black54,
        indicatorColor: Color.fromARGB(255, 255, 21, 0),
        tabs: [
          Tab(text: 'Makanan'),
          Tab(text: 'Minuman'),
        ],
      ),
    ),

        body: const TabBarView(
          children: [
            ListViewWidget(),
            GridViewWidget(),
          ],
        ),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foods = [
      {'name': 'Nasi Liwet Komplit', 'description': 'Nasi dengan lauk pauk dan sambal', 'image': 'assets/nasi_liwet.jpg'},
      {'name': 'Karedok', 'description': 'Sayuran mentah dengan bumbu kacang', 'image': 'assets/karedok.jpg'},
      {'name': 'Lotek', 'description': 'Sayuran rebus dengan bumbu kacang', 'image': 'assets/lotek.jpg'},
      {'name': 'Pepes Ikan', 'description': 'Ikan dibungkus daun pisang dan dibakar', 'image': 'assets/pepes_ikan.jpg'},
      {'name': 'Sate Maranggi', 'description': 'Sate khas Sunda dengan bumbu khas', 'image': 'assets/sate_maranggi.jpg'},
      {'name': 'Sayur Asem', 'description': 'Sayur dengan kuah asam segar', 'image': 'assets/sayur_asem.jpg'},
      {'name': 'Soto Bandung', 'description': 'Soto bening dengan daging sapi', 'image': 'assets/soto_bandung.jpg'},
      {'name': 'Batagor', 'description': 'Bakso tahu goreng dengan bumbu kacang', 'image': 'assets/batagor.jpg'},
    ];

    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: const Icon(Icons.restaurant_menu, color: Colors.green),
            title: Text(foods[index]['name']!),
            subtitle: Text(foods[index]['description']!),
            onTap: () {
              _showImageDialog(context, foods[index]['name']!, foods[index]['image']!);
            },
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String title, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Image.asset(imagePath, fit: BoxFit.cover),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> drinks = [
      {'name': 'Es Kopi', 'image': 'assets/es_kopi.jpg'},
      {'name': 'Kopi Hangat', 'image': 'assets/kopi_hangat.jpg'},
      {'name': 'Es Cendol', 'image': 'assets/es_cendol.jpg'},
      {'name': 'Bajigur', 'image': 'assets/bajigur.jpg'},
      {'name': 'Bandrek', 'image': 'assets/bandrek.jpg'},
      {'name': 'Es Teh Manis', 'image': 'assets/es_teh.jpg'},
      {'name': 'Es Doger', 'image': 'assets/es_doger.jpg'},
      {'name': 'Wedank', 'image': 'assets/wedank.jpg'},
      {'name': 'jus Buah', 'image': 'assets/jus_buah.jpg'},
      {'name': 'Es Cokelat', 'image': 'assets/es_cokelat.jpg'},
      
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showImageDialog(context, drinks[index]['name']!, drinks[index]['image']!);
          },
          child: Card(
            color: const Color.fromARGB(255, 255, 89, 0),
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                drinks[index]['name']!,
                style: const TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String title, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Image.asset(imagePath, fit: BoxFit.cover),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
