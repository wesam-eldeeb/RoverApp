import 'dart:async';

import 'package:Rover/featuers/map/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:Rover/featuers/map/util/location_service.dart';
import 'package:Rover/featuers/map/util/map_services.dart';
import 'package:Rover/featuers/map/widgets/custom_list_view.dart';
import 'package:Rover/featuers/map/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late CameraPosition initalCameraPosition;

  //  vidieo 105 (1-Debounce effect )
  late MapServices mapServices;

  //  vidieo 76 (1-listen to the text field)
  late TextEditingController textEditingController;
  late GoogleMapController googleMapController;

  //  vidieo 88 (1-generate setion token part two )
  String? sesstionToken;

  // vedio 87 (1-generate setion token )
  late Uuid uuid;
  Set<Marker> markers = {};

  //  vidieo 78 (1-display result )
  List<PlaceModel> places = [];

  //vedio 100 (3-display route )
  Set<Polyline> polylines = {};

  //  vidieo 87(1-get rout data)
  late LatLng currentLocation;

  //  vidieo 87(2-get rout data)
  late LatLng destinationLocation;

  //vedio 106 (1-timer)
  Timer? debounce;

  @override
  void initState() {
    //vedio 105 (2-Debounce effect )
    mapServices = MapServices();
    //  vedio 87 (2-generate setion token )
    uuid = const Uuid();
    //  vidieo 76 (2-listen to the text field)
    textEditingController = TextEditingController();
    initalCameraPosition = const CameraPosition(
      target: LatLng(0, 0),
    );
    fetchPreedictions();
    super.initState();
  }

//فانكشن المسئوله عن البحث
  void fetchPreedictions() {
    //  vidieo 76 (7-listen to the text field)
    textEditingController.addListener(() {
      //vedio 106 (2-timer)
      if (debounce?.isActive ?? false) {
        debounce?.cancel();
      }
      // vedio 106 (3-timer)
      debounce = Timer(const Duration(milliseconds: 100), () async {
        //  vedio 87 (3-generate setion token )
        sesstionToken ?? uuid.v4();
        await mapServices.getPredictions(
            input: textEditingController.text,
            sesstionToken: uuid.v4(),
            places: places);
        //Share.share('https://www.google.com/maps/search/?api=1&query=${currentLocation.latitude},${currentLocation.longitude}');
        //  Share.share('https://www.google.com/maps/search/?api=1&query=${currentLocation.latitude},${currentLocation.longitude}');

        setState(() {});
      });
    });
    //  Share.share('https://www.google.com/maps/search/?api=1&query=${currentLocation.latitude},${currentLocation.longitude}');
  }

  //  vidieo 76 (3-listen to the text field)
  @override
  void dispose() {
    textEditingController.dispose();
    //vedio 106 (4-timer)
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          //  vidieo 89 (1-How to create route)
          //  vidieo 100 (4-display route  )
          polylines: polylines,
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
            upDateCurrentLocation();
            //        Share.share('https://www.google.com/maps/search/?api=1&query=${currentLocation.latitude},${currentLocation.longitude}');
          },
          zoomControlsEnabled: false,
          initialCameraPosition: initalCameraPosition,
        ),
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Column(
            children: [
              CustomTextField(
                //  vidieo 76 (6-listen to the text field)
                textEditingController: textEditingController,
              ),
              //  vidieo 78 (2-display result )
              const SizedBox(
                height: 16,
              ),
              CustomListView(
                //vidieo 83 (3- clear and reast )
                onPlaceSelect: (PlaceDetailsModel) async {
                  textEditingController.clear();
                  places.clear();
                  //  vedio 88 (3-generate setion token part two)
                  sesstionToken = null;
                  setState(() {});
                  //  vidieo 97 (3-get route data )
                  destinationLocation = LatLng(
                      PlaceDetailsModel.geometry!.location!.lat!,
                      PlaceDetailsModel.geometry!.location!.lng!);
                  //  vedio 98 (1-get route data ))
                  var points = await mapServices.getRouteData(
                    currentLocation: currentLocation,
                    destinationLocation: destinationLocation,
                  );
                  mapServices.displayRoute(points,
                      polylines: polylines,
                      googleMapController: googleMapController);
                  setState(() {});
                },
                places: places,
                //vedieo 83 (2-fetch place details )

                mapServices: mapServices,
              )
            ],
          ),
        ),
      ],
    );
  }

  void upDateCurrentLocation() async {
    try {
      currentLocation = await mapServices.upDateCurrentLocation(
          googleMapController: googleMapController, markers: markers);
      setState(() {});
    } on LocationServiceException catch (e) {
      //TODO
    } on LocationPermissionException catch (e) {
//TODO
    } catch (e) {
      //TODO
    }
  }
}

//text Field
//listen to the text field
//make request  each time the text field changes(Google Places API)
//display list of results (places)
