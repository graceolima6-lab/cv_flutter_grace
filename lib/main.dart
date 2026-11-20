import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CvGraceApp());
}

class CvGraceApp extends StatelessWidget {
  const CvGraceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV - Grace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const AccueilCvPage(),
    );
  }
}

class AccueilCvPage extends StatefulWidget {
  const AccueilCvPage({super.key});

  @override
  State<AccueilCvPage> createState() => _AccueilCvPageState();
}

class _AccueilCvPageState extends State<AccueilCvPage> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    ProfilTab(),
    ParcoursTab(),
    FamilleTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Numérique — Grace'),
        centerTitle: true,
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'Parcours & Exp.',
          ),
          NavigationDestination(
            icon: Icon(Icons.family_restroom_outlined),
            selectedIcon: Icon(Icons.family_restroom),
            label: 'Famille',
          ),
        ],
      ),
    );
  }
}

class ProfilTab extends StatelessWidget {
  const ProfilTab({super.key});

  Future<void> _ouvrirLien(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 72,
            backgroundImage: AssetImage('assets/images/profil.jpg'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Grace',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            'Étudiante & Développeuse en formation',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'À propos de moi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Je suis Grace, motivée, rigoureuse et passionnée par le développement d\'applications et les technologies numériques. '
                    'Cette application présente mon profil, mon parcours académique, mes expériences et ma famille.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Localisation'),
                  subtitle: Text('À compléter'),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: const Text('grace@exemple.com'),
                  onTap: () => _ouvrirLien('mailto:grace@exemple.com'),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Téléphone'),
                  subtitle: const Text('À compléter'),
                  onTap: () => _ouvrirLien('tel:+243000000000'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParcoursTab extends StatelessWidget {
  const ParcoursTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'Expériences & Projets',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Card(
          child: ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Application CV Mobile / Web avec Flutter'),
            subtitle: Text(
              'Création d\'une interface multi-onglets, gestion des assets locaux et navigation fluide avec Dart.',
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.laptop_mac),
            title: Text('Travaux pratiques & Projets numériques'),
            subtitle: Text(
              'Réalisation d\'exercices pratiques, structuration de code et résolution de problèmes techniques.',
            ),
          ),
        ),
        SizedBox(height: 22),
        Text(
          'Parcours Académique & Formations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Card(
          child: ListTile(
            leading: Icon(Icons.school),
            title: Text('Études supérieures / Universitaires'),
            subtitle: Text('À compléter avec votre filière, promotion et établissement.'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Études secondaires'),
            subtitle: Text('À compléter avec votre option et l\'année d\'obtention.'),
          ),
        ),
      ],
    );
  }
}

class FamilleTab extends StatelessWidget {
  const FamilleTab({super.key});

 final _membres = const [
    {
      'nom': 'Père',
      'role': 'Papa',
      'image': 'assets/images/pere.jpg',
    },
    {
      'nom': 'Mère',
      'role': 'Maman',
      'image': 'assets/images/maman.jpg',
    },
    {
      'nom': 'Frère',
      'role': 'Frère',
      'image': 'assets/images/frere.jpg',
    },
    {
      'nom': 'Sœur',
      'role': 'Sœur',
      'image': 'assets/images/soeur.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _membres.length,
      itemBuilder: (context, index) {
        final membre = _membres[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(membre['image']!),
            ),
            title: Text(
              membre['nom']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(membre['role']!),
          ),
        );
      },
    );
  }
}