import 'package:flutter_test/flutter_test.dart';
import 'package:route_planner/models/stop.dart';
import 'package:route_planner/providers/route_provider.dart';

void main() {
  test('Sorts stops by latitude', () {
    final provider = RouteProvider();

    provider.addStop(Stop(id: '1', name: 'Stop 1', lat: 30, lng: 0));
    provider.addStop(Stop(id: '2', name: 'Stop 2', lat: 10, lng: 0));

    provider.optimizeStops(); // runs sorting logic 

    expect(provider.stops.first.name, 'Stop 2'); // asserts result 
  });

  test('Uses longitude as tie-breaker', () {
    final provider = RouteProvider();

    provider.addStop(Stop(id: '1', name: 'Stop 1', lat: 5, lng: 6));
    provider.addStop(Stop(id: '2', name: 'Stop 2', lat: 5, lng: 1));

    provider.optimizeStops(); // runs sorting logic

    expect(provider.stops.first.name, 'Stop 2'); // asserts result 
  });
}
