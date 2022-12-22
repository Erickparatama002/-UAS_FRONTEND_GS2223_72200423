import 'package:flutter/material.dart';
import 'package:uas_frontend_72200423/mahasiswa/mahasiswa_get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const  MyApp({Key? key});
  static const appTitle = 'Website Database';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Welcome'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                ),
                accountName: Text('Erick Pratama Laiyo'),
                accountEmail: Text('Universitas Kristen Duta Wacana')),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('POST'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Mahasiswa_get()));
              },
            ),
            ListTile(
               // leading: const Icon(Icons.access_time_outlined),
              title: const Text('COMMENTS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Mahasiswa_get()));
                },
            ),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('PHOTOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Mahasiswa_get()));
              },
            ),

            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('USERS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Mahasiswa_get()));
              },
            ),
          ],
        ),
      ),
    );
  }
}