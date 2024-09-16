import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App com Quadrados',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"name": "Alto-Falante", "image": "assets/image1.png", "page": ItemPage1()},
    {"name": "Driver", "image": "assets/image2.png", "page": ItemPage2()},
    {"name": "Tweeter", "image": "assets/image3.png", "page": ItemPage3()},
    {"name": "Módulo", "image": "assets/image4.png", "page": ItemPage4()},
    {"name": "Manual", "image": "assets/image7.png", "page": ItemPage4()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peças Altomotivas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navega para a página correspondente ao quadrado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => items[index]['page']),
                );
              },
              child: SquareTile(
                name: items[index]['name']!,
                imagePath: items[index]['image']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  final String name;
  final String imagePath;

  const SquareTile({
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(imagePath),
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Página para o Item 1
class ItemPage1 extends StatelessWidget {
  final List<Map<String, dynamic>> subItems = [
    {"name": "Woofer", "image": "assets/image5.png", "page": SubItem1Page()},
    {"name": "SubWoofer", "image": "assets/image6.png", "page": SubItem2Page()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alto-Falante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: subItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => subItems[index]['page']),
                );
              },
              child: SquareTile(
                name: subItems[index]['name']!,
                imagePath: subItems[index]['image']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

// Sub páginas para os quadrados dentro do Item 1

class SubItem1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Woofer'),
      ),
      body: Center(
        child: Text('Conteúdo da SubPágina 1', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class SubItem2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SubWoofer'),
      ),
      body: Center(
        child: Text('Conteúdo da SubPágina 2', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Páginas para os outros itens (Item 2, Item 3, Item 4)

class ItemPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver'),
      ),
      body: Center(
        child: Text('Conteúdo do Item 2', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ItemPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweeter'),
      ),
      body: Center(
        child: Text('Conteúdo do Item 3', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ItemPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Módulo'),
      ),
      body: Center(
        child: Text('Conteúdo do Item 4', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ItemPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual'),
      ),
      body: Center(
        child: Text('Conteúdo do Item 5', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
