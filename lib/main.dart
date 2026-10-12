// Desarrollado por Yhadel López - Matrícula: 20242493
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Perfil',
      theme: ThemeData.dark(),
      home: const PerfilPage(),
    );
  }
}

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late Timer _timer;
  late DateTime _ahora;

  @override
  void initState() {
    super.initState();
    _ahora = DateTime.now();
    // Actualiza la fecha y hora cada segundo en movimiento
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _ahora = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Función para formatear la fecha y hora
  String _formatearFechaHora(DateTime fecha) {
    String dia = fecha.day.toString().padLeft(2, '0');
    String mes = fecha.month.toString().padLeft(2, '0');
    String anio = fecha.year.toString();

    int hora12 = fecha.hour % 12 == 0 ? 12 : fecha.hour % 12;
    String hora = hora12.toString().padLeft(2, '0');
    String minuto = fecha.minute.toString().padLeft(2, '0');
    String segundo = fecha.second.toString().padLeft(2, '0');
    String periodo = fecha.hour >= 12 ? 'p. m.' : 'a. m.';

    return '$dia/$mes/$anio $hora:$minuto:$segundo $periodo';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('Mi Perfil Académico'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E293B),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Tu Foto
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/perfil.jpeg'),
              ),
              const SizedBox(height: 20),

              // 2. Nombre y Apellido
              const Text(
                'Yhadel López',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              // 3. Matrícula
              const Text(
                'Matrícula: 20242493',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // 4. Fecha y Hora Actual en movimiento
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.lightBlueAccent, width: 1),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Fecha y Hora en Tiempo Real',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatearFechaHora(_ahora),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}