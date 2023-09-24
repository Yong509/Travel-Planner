import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/models/mapbox/geocoding/geocoding_places.dart';
import '../../constants/widget/home/slide_bottom_sheet_sizes.dart';
import '../../providers/mapbox_provider.dart';

class SearchResultList extends StatefulWidget {
  final Function(Feature selectedPlace) onSelected;
  const SearchResultList({super.key, required this.onSelected});

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapboxProvider>(
      builder: (context, mapboxProvider, child) {
        if (mapboxProvider.searchPlaceResults != null) {
          final places = mapboxProvider.searchPlaceResults!;
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: places.features!.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  widget.onSelected(places.features![index]);
                  mapboxProvider.setSelectedPlace(
                      selected: places.features![index]);
                },
                title: Text(
                  places.features![index].text!,
                ),
                subtitle: Text(places.features![index].placeName!.substring(
                    places.features![index].placeName!.indexOf(",") + 2)),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    SlideBottomSheetSlideSizes.resultSearchPlacePaddingDivider,
                child: Divider(
                  color: Colors.black.withAlpha(20),
                  thickness: SlideBottomSheetSlideSizes
                      .resultSearchPlacePaddingDividerThickness,
                  height: SlideBottomSheetSlideSizes
                      .resultSearchPlacePaddingDividerHigh,
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
