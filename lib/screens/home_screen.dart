import 'package:flutter/material.dart';
import 'package:khata_app/theme_data/drawer_material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMaterial() ,
      appBar: AppBar(
        title: const Text("This is khata app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Hello"),
            TextFormField(),
            TextButton(onPressed: (){}, child: const Text("HEllo")),
            ElevatedButton(onPressed: (){}, child: const Text("Hello"))
            
          ],
        ),
      ),
    );
  }
}
