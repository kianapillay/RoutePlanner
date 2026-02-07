import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/route_provider.dart';
import 'add_stop_screen.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final route = context.watch<RouteProvider>();

    return Scaffold(
      appBar: AppBar(title: Text(route.routeName)),
      body: ListView.builder(
        itemCount: route.stops.length,
        itemBuilder: (context, index) {
          final stop = route.stops[index];
          return ListTile(
            title: Text(stop.name),
            subtitle: Text('${stop.lat}, ${stop.lng}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => route.deleteStop(stop.id),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'adds_stop_fab',
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddStopScreen()),
              );
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'sorts_stops_fab',
            child: const Icon(Icons.sort),
            onPressed: () {
              route.optimizeStops();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Stops optimized')),
              );
            },
          ),
        ],
      ),
    );
  }
}
