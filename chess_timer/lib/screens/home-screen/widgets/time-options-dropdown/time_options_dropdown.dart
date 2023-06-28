import 'package:chess_timer/features/app-features/controllers/timer_controller.dart';
import 'package:chess_timer/services/color_service.dart';
import 'package:chess_timer/services/time_options.dart';
import 'package:flutter/material.dart';

class TimeOptionsDropDown extends StatelessWidget {
  const TimeOptionsDropDown({
    super.key,
    required this.timerController,
  });

  final TimerController timerController;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: timerController.selectedTime.value,
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        style: const TextStyle(color: Colors.white),
        dropdownColor: ColorService.light_brown,
        iconEnabledColor: Colors.white,
        isExpanded: true,
        items: timeOptionsList.timeOptions,
        onChanged: (int? value) {
          timerController.selectedTime.value = value!;
        });
  }
}
