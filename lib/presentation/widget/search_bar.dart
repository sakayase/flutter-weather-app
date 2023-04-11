import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/domain/states/autocomplete.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Timer? _debounce;
  final TextEditingController searchController = TextEditingController();

  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<AutocompleteState>().getSuggestionsFromPlaceName(value);
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

    return ListView.builder(
      itemCount: suggestions.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            title: TextField(
              controller: searchController,
              onChanged: _onSearchChanged,
            ),
          );
        }
        return SuggestionTile(
          suggestion: suggestions[index - 1],
        );
      },
    );
  }
}

class SuggestionTile extends StatelessWidget {
  const SuggestionTile({Key? key, required this.suggestion}) : super(key: key);
  final Location suggestion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -3),
      contentPadding: const EdgeInsets.only(left: 15),
      title: Text(suggestion.name ?? 'Inconnu'),
      subtitle: Text('${suggestion.country} - ${suggestion.region}'),
      onTap: () {
        context.read<AutocompleteState>().setSelectedLocation(suggestion);
      },
    );
  }
}
