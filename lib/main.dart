import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.greenAccent,
      ),
      home: const AdminScreen(),
    );
  }
}

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      // --- CAMBIO CLAVE: SingleChildScrollView permite el scroll ---
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // Agrega un rebote suave al scrollear
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bienvenido',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
              ),
              const Text(
                'Administrador',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black45, thickness: 1),
              const SizedBox(height: 20),
              const Text(
                'Tablas',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 20),
              
              // Lista de opciones (puedes duplicar estas filas para probar el scroll)
              _buildAdminRow('Usuarios'),
              _buildAdminRow('Destinos'),
              _buildAdminRow('Tours'),
              _buildAdminRow('Reservas'),
              _buildAdminRow('Reportes'), // Fila extra para probar scroll
              _buildAdminRow('Configuración'), // Fila extra para probar scroll
              
              const SizedBox(height: 20), // Espacio final para que no pegue con la barra
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.greenAccent[700],
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'EXPLORAR'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me_outlined), label: 'TOURS'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'RESEÑAS'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'CUENTA'),
        ],
      ),
    );
  }

  Widget _buildAdminRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22, 
              decoration: TextDecoration.underline,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
              shape: const StadiumBorder(),
              elevation: 2,
            ),
            child: const Text('VER', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}