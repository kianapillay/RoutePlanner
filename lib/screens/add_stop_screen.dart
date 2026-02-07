import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/route_provider.dart';
import '../models/stop.dart';
import '../utils/validation.dart';
import 'dart:math';

class AddStopScreen extends StatefulWidget {
  const AddStopScreen({super.key});

  @override
  State<AddStopScreen> createState() => _AddStopScreenState();
}

class _AddStopScreenState extends State<AddStopScreen> {
  final _nameController = TextEditingController();
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  void _save() {
    final name = _nameController.text;
    final lat = double.tryParse(_latController.text);
    final lng = double.tryParse(_lngController.text);

    if (!StopValidation.isValidName(name) ||
        lat == null ||
        lng == null ||
        !StopValidation.isValidLatitude(lat) ||
        !StopValidation.isValidLongitude(lng)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid input')),
      );
      return;
    }

    context.read<RouteProvider>().addStop(
          Stop(
            id: Random().nextDouble().toString(),
            name: name,
            lat: lat,
            lng: lng,
          ),
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Stop')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: _latController, decoration: const InputDecoration(labelText: 'Latitude')),
            TextField(controller: _lngController, decoration: const InputDecoration(labelText: 'Longitude')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _save, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
