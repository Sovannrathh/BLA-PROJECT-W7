import 'package:flutter/material.dart';
import 'package:week_7_blabla_project/service/rides_service.dart';
import '../../../model/ride/ride_filter.dart';
import 'widgets/ride_pref_bar.dart';
// import '../../../service/ride_prefs_service.dart';

import '../../../model/ride/ride.dart';
import '../../../model/ride/ride_pref.dart';
// import '../../../service/rides_service.dart';
import '../../theme/theme.dart';
import '../../../utils/animations_util.dart';
import 'widgets/ride_pref_modal.dart';
import 'widgets/rides_tile.dart';
import 'package:week_7_blabla_project/ui/providers/rides_preferences_provider.dart';
import 'package:provider/provider.dart';

///
///  The Ride Selection screen allow user to select a ride, once ride preferences have been defined.
///  The screen also allow user to re-define the ride preferences and to activate some filters.
///
class RidesScreen extends StatelessWidget {
  RidesScreen({super.key});

  onRidePrefSelected(RidePreference newPreference) async {}

  final RideFilter currentFilter = RideFilter();

  void onBackPressed(context) {
    // 1 - Back to the previous view
    Navigator.of(context).pop();
  }

  void onPreferencePressed(context) async {
    var ridesPreferenceProvider =
        Provider.of<RidesPreferencesProvider>(context, listen: false);
    RidePreference? currentRidePreference =
        ridesPreferenceProvider.currentPreference;
    // Open a modal to edit the ride preferences
    RidePreference? newPreference = await Navigator.of(
      context,
    ).push<RidePreference>(
      AnimationUtils.createTopToBottomRoute(
        RidePrefModal(initialPreference: currentRidePreference),
      ),
    );

    if (newPreference != null) {
      // 1 - Update the current preference
      ridesPreferenceProvider.setCurrentPreference(newPreference);

      // 2 -   Update the state   -- TODO MAKE IT WITH STATE MANAGEMENT
    }
  }

  void onFilterPressed() {}

  @override
  Widget build(BuildContext context) {
    var ridesPreferenceProvider =
        Provider.of<RidesPreferencesProvider>(context);
    RidePreference? currentRidePreference =
        ridesPreferenceProvider.currentPreference;

    var matchingRides =
        RidesService.instance.getRidesFor(currentRidePreference!, currentFilter);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            // Top search Search bar
            RidePrefBar(
              ridePreference: currentRidePreference!,
              onBackPressed: () => onBackPressed(context),
              onPreferencePressed: () => onPreferencePressed(context),
              onFilterPressed: onFilterPressed,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: matchingRides.length,
                itemBuilder: (ctx, index) =>
                    RideTile(ride: matchingRides[index], onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
