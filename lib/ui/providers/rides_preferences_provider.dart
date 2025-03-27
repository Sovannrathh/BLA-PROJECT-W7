import 'package:flutter/material.dart';
import 'package:week_7_blabla_project/model/ride/ride_pref.dart';
import 'package:week_7_blabla_project/repository/ride_preferences_repository.dart';

class RidesPreferencesProvider extends ChangeNotifier { 

  RidePreference? _currentPreference; 
  List<RidePreference> _pastPreferences = []; 
 
  final RidePreferencesRepository repository; 
 
  RidesPreferencesProvider({required this.repository}) { 
    // For now past preferences are fetched only 1 time 
    // Your code 
  } 
    
  RidePreference? get currentPreference => _currentPreference; 
 
  void setCurrentPreferrence(RidePreference pref) { 
     // Your code 
  } 
 
  void _addPreference(RidePreference preference) { 
     // Your code 
  } 
   
  // History is returned from newest to oldest preference 
  List<RidePreference> get preferencesHistory => 
_pastPreferences.reversed.toList(); 
}