import 'package:flutter/material.dart';
import 'package:week_7_blabla_project/model/ride/ride_pref.dart';
import 'package:week_7_blabla_project/repository/ride_preferences_repository.dart';

class RidesPreferencesProvider extends ChangeNotifier {
  RidePreference? _currentPreference;
  List<RidePreference> _pastPreferences = [];

  final RidePreferencesRepository repository;

  RidesPreferencesProvider({required this.repository}) {
    // TODO: fetch the past preference only 1 time
    // For now past preferences are fetched only 1 time
    // Your code
    _pastPreferences = repository.getPastPreferences();
  }

  RidePreference? get currentPreference =>
      _currentPreference; //get the current preference(can be null)

  void setCurrentPreference(RidePreference pref) {
    // TODO: set the current preference
    // Your code
    _currentPreference = pref;
    _addPreference(pref);
    notifyListeners();
  }

  void _addPreference(RidePreference preference) {
    // TODO: add preference
    // Your code
    _pastPreferences.remove(preference); // Remove the preference if it already exists
    _pastPreferences.add(preference);
    notifyListeners();
  }

  // History is returned from newest to oldest preference
  List<RidePreference> get preferencesHistory =>
      _pastPreferences.reversed.toList();
}
