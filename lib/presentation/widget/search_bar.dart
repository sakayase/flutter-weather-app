import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/domain/states/autocomplete.dart';
import 'package:weather_app/domain/states/forecast.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool loading = false;
  Timer? _debounce;
  final TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  _onSearchChanged(String value) {
    setState(() {
      loading = true;
    });
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await context
          .read<AutocompleteState>()
          .getSuggestionsFromPlaceName(value);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Location> suggestions = context.watch<AutocompleteState>().suggestions;
    double determineHeight() {
      double idealSize = suggestions.length * 60;
      if (idealSize <= 300) {
        return idealSize;
      }
      return 300;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 56,
          child: Center(
            child: TextField(
              onTap: () {
                setState(() {
                  searchController.value == TextEditingValue.empty;
                });
              },
              focusNode: focusNode,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cherchez un lieu',
              ),
              controller: searchController,
              onChanged: _onSearchChanged,
            ),
          ),
        ),
        loading
            ? SizedBox(
                height: 56,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(15, 15),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: const LinearProgressIndicator(),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        (focusNode.hasFocus && (suggestions.isNotEmpty))
            ? ConstrainedBox(
                constraints: BoxConstraints(maxHeight: determineHeight()),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: suggestions
                      .map(
                        (suggestion) => SuggestionTile(
                          suggestion: suggestion,
                          onTap: updateInput,
                        ),
                      )
                      .toList(),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  updateInput(String value) {
    focusNode.unfocus();
    setState(() {
      searchController.value = TextEditingValue(text: value);
    });
  }
}

class SuggestionTile extends StatelessWidget {
  const SuggestionTile(
      {Key? key, required this.suggestion, required this.onTap})
      : super(key: key);
  final Location suggestion;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -3),
        contentPadding: const EdgeInsets.only(left: 15),
        title: Text(suggestion.name ?? 'Inconnu'),
        subtitle: Text('${suggestion.country} - ${suggestion.region}'),
        onTap: () {
          onTap(suggestion.name ?? '');
          context.read<AutocompleteState>().setSelectedLocation(suggestion);
          context.read<ForecastState>().getForecast(suggestion);
        },
      ),
    );
  }
}
