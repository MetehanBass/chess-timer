import 'package:chess_timer/features/app-features/controllers/timer_controller.dart';
import 'package:chess_timer/services/color_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerButtons extends GetView<TimerController> {
  const TimerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TimerController timerController = Get.put(TimerController());

    List<DropdownMenuItem<int>> timeOptions = [
      const DropdownMenuItem(value: 60, child: Text("1 min")),
      const DropdownMenuItem(value: 180, child: Text("3 min")),
      const DropdownMenuItem(value: 300, child: Text("5 min")),
      const DropdownMenuItem(value: 600, child: Text("10 min")),
      const DropdownMenuItem(value: 1800, child: Text("30 min")),
    ];

    return Container(
      color: ColorService.light_brown,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Obx(
                () => IconButton(
                  onPressed: () {
                    if (timerController.isTimer1Paused.value && timerController.isTimer2Paused.value) {
                      timerController.onTimersResume();
                    } else {
                      timerController.onTimersPause();
                    }
                  },
                  icon: timerController.isTimer1Paused.value && timerController.isTimer2Paused.value
                      ? const Icon(Icons.play_arrow)
                      : const Icon(Icons.pause),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Obx(
                () => Visibility(
                  visible: timerController.hasTimerNotStarted.value,
                  child: DropdownButton(
                      value: timerController.selectedTime.value,
                      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: ColorService.light_brown,
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      items: timeOptions,
                      onChanged: (int? value) {
                        timerController.selectedTime.value = value!;
                      }),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  timerController.onTimersRestart();
                },
                icon: const Icon(Icons.replay),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
