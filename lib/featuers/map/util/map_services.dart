import 'dart:math';

import 'package:Rover/featuers/map/models/location_info/lat_lng.dart';
import 'package:Rover/featuers/map/models/location_info/location.dart';
import 'package:Rover/featuers/map/models/location_info/location_info.dart';
import 'package:Rover/featuers/map/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:Rover/featuers/map/models/place_details_model/place_details_model.dart';
import 'package:Rover/featuers/map/models/routes_model/routes_model.dart';
import 'package:Rover/featuers/map/util/google_maps_place_service.dart';
import 'package:Rover/featuers/map/util/location_service.dart';
import 'package:Rover/featuers/map/util/routes_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapServices {
  PlacesService placesService = PlacesService();
  LocationService locationService = LocationService();
  RoutesService routesService = RoutesService();

  Future<void> getPredictions(
      {required String input,
      required String sesstionToken,
      required List<PlaceModel> places}) async {
    if (input.isNotEmpty) {
      var result = await placesService.getPredictions(
          sesstionToken: sesstionToken, input: input);

      places.clear();
      places.addAll(result);
    } else {
      places.clear();
    }
  }

  //  vidieo 97 (2-get route data ))
  Future<List<LatLng>> getRouteData(
      {required LatLng currentLocation,
      required LatLng destinationLocation}) async {
    //  vidieo 98 (1-get route data ))
    LocationInfoModel origin = LocationInfoModel(
      location: LocationModel(
        latLng: LatLngModel(
            latitude: currentLocation.latitude,
            longitude: currentLocation.longitude),
      ),
    );
    LocationInfoModel destination = LocationInfoModel(
      location: LocationModel(
        latLng: LatLngModel(
            latitude: destinationLocation.latitude,
            longitude: destinationLocation.longitude),
      ),
    );

    RoutesModel routes = await routesService.fetchRoutes(
        origin: origin, destination: destination);
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> points = getDecodedRoute(polylinePoints, routes);
    return points;
  }

  List<LatLng> getDecodedRoute(
      PolylinePoints polylinePoints, RoutesModel routes) {
    List<PointLatLng> result = polylinePoints
        .decodePolyline(routes.routes!.first.polyline!.encodedPolyline!);
    List<LatLng> points =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }

//  vidieo 100 (2-display route  ))
  void displayRoute(List<LatLng> points,
      {required Set<Polyline> polylines,
      required GoogleMapController googleMapController}) {
    Polyline route = Polyline(
        color: Colors.red,
        width: 5,
        polylineId: PolylineId("route"),
        points: points);

    polylines.add(route);
//vedio 101(1-update LatLan)
    LatLngBounds bounds = getLatLagBounds(points);
    googleMapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 32));
  }

  LatLngBounds getLatLagBounds(List<LatLng> points) {
    var southWestLatitude = points.first.latitude;
    var southWestLongitude = points.first.longitude;
    var northEastLatitude = points.first.latitude;
    var northEastLongitude = points.first.longitude;
    for (var point in points) {
      southWestLatitude = min(southWestLatitude, point.latitude);
      southWestLongitude = min(southWestLongitude, point.longitude);
      northEastLatitude = max(northEastLatitude, point.latitude);
      northEastLongitude = max(northEastLongitude, point.longitude);
    }
    return LatLngBounds(
      southwest: LatLng(southWestLongitude, southWestLatitude),
      northeast: LatLng(northEastLongitude, northEastLatitude),
    );
  }

  Future<LatLng> upDateCurrentLocation(
      {required GoogleMapController googleMapController,
      required Set<Marker> markers}) async {
    var locationData = await locationService.getLocation();
    var currentLocation =
        LatLng(locationData.latitude!, locationData.longitude!);

    Marker currentLocationMarker = Marker(
      markerId: const MarkerId('myLocation'),
      position: currentLocation,
    );
    CameraPosition myCurrentCameraPostion = CameraPosition(
      target: currentLocation,
      zoom: 16,
    );
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(myCurrentCameraPostion));
    markers.add(currentLocationMarker);

    return currentLocation;
  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    return await placesService.getPlaceDetails(placeId: placeId);
  }
}
