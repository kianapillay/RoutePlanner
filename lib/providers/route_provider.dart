import 'package:flutter/material.dart';
import '../models/stop.dart';

class RouteProvider extends ChangeNotifier // manages the state of the route, including the list of stops and the route name
{
  String _routeName = 'My Route';
  final List<Stop> _stops = [];

  String get routeName => _routeName;
  List<Stop> get stops => _stops;

  void setRouteName(String name) // changes the route name
  {
    _routeName = name;
    notifyListeners();
  }

  void addStop(Stop stop) // adds a new stop to the route
  {
    _stops.add(stop);
    notifyListeners();
  }

  void deleteStop(String id) // removes a stop from the route by its ID
  {
    _stops.removeWhere((s) => s.id == id);
    notifyListeners();
  }

  void optimizeStops()
  {
    _stops.sort((a,b) // sorts stops by latitude, then longitude as a tie-breaker
    {
      final latCompare = a.lat.compareTo(b.lat); // primary sort by latitude
      if(latCompare != 0) return latCompare; // if latitudes are different, return that comparison
      return a.lng.compareTo(b.lng); // if latitudes are the same, sort by longitude

    });
    notifyListeners();
  }
}