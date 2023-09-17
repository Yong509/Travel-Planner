import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/providers/location_provider.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController searchController = TextEditingController();
  Timer? isStopTyping;
  bool? isLoading;
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  _onChange(String value) {
    if (isStopTyping != null) {
      setState(() => isStopTyping?.cancel());
    }

    setState(() {
      isStopTyping = Timer(const Duration(seconds: 2), () async {
        await _onSearchPlace(searched: value);
      });
    });
  }

  _onSearchPlace({required String searched}) async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    await locationProvider.searchPlace(searchedPlace: searched);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        return Column(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  controller: searchController,
                  focusNode: _focusNode,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (value) => _onChange(value),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    hintText: "ไปที่ไหนดี?",
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final searchedPlace = searchController.text;
                        _onSearchPlace(searched: searchedPlace);
                      },
                      icon: const Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            if (locationProvider.searchPlaceResults != null &&
                _focusNode.hasFocus) ...[
              const SizedBox(
                height: 15,
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount:
                        locationProvider.searchPlaceResults!.features!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          locationProvider
                              .searchPlaceResults!.features![index].text!,
                        ),
                        subtitle: Text(locationProvider
                            .searchPlaceResults!.features![index].placeName!
                            .substring(locationProvider.searchPlaceResults!
                                    .features![index].placeName!
                                    .indexOf(",") +
                                2)),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: Colors.black.withAlpha(20),
                          thickness: 1,
                          height: 1,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}



// sk.eyJ1Ijoia2Vya3dpdCIsImEiOiJjbG1sbTE1MXIwZXZqMnNzN25oMjJ5djlpIn0.LJYqIxm8iI0oyjDmSksjBw
