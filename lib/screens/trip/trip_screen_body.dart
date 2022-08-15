import 'package:flutter/material.dart';
import 'package:transit/database/db.dart';
import 'package:transit/models/db.dart';

class TripScreenListBody extends StatelessWidget {
  final ScrollController scrollController;
  final List<StopWithStopTimes> stopsWithStopTimes;
  final Stop selectedStop;

  const TripScreenListBody({
    super.key,
    required this.scrollController,
    required this.stopsWithStopTimes,
    required this.selectedStop,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Stepper(
        controlsBuilder: (context, details) {
          return SizedBox.shrink();
        },
        physics: NeverScrollableScrollPhysics(),
        margin: EdgeInsets.zero,
        currentStep: _getSelectedStopIndex(),
        steps: [
          for (final stopWithStopTime in stopsWithStopTimes)
            _buildStep(stopWithStopTime)
        ],
      ),
    );
  }

  int _getSelectedStopIndex() {
    return stopsWithStopTimes.indexWhere(
      (st) => st.stop.stop_id == selectedStop.stop_id,
    );
  }

  Step _buildStep(StopWithStopTimes stopWithStopTimes) {
    final stop = stopWithStopTimes.stop;
    final stopTimes = stopWithStopTimes.stopTime;

    return Step(
      title: Text(stop.stop_name),
      subtitle: Text(stopTimes.departure_time),
      content: SizedBox.shrink(),
      isActive: selectedStop.stop_id == stopTimes.stop_id,
    );
  }
}
