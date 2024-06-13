import 'package:Rover/featuers/map/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:Rover/featuers/map/models/place_details_model/place_details_model.dart';
import 'package:Rover/featuers/map/util/map_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.places,
    required this.mapServices,
    required this.onPlaceSelect,
  });

  final List<PlaceModel> places;

  //vedieo 84 (1- clear and reast )

  final void Function(PlaceDetailsModel) onPlaceSelect;
  final MapServices mapServices;

  //vedieo 83 (1-fetch place details )

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(places[index].description!),
            leading: const Icon(FontAwesomeIcons.locationDot),
            trailing: IconButton(
              onPressed: () async {
                var placeDetails = await mapServices.getPlaceDetails(
                    placeId: places[index].placeId!);
                //vedieo 83 (2-fetch place details )
                onPlaceSelect(placeDetails);
              },
              icon: const Icon(Icons.chevron_right),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemCount: places.length,
      ),
    );
  }
}
