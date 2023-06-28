import 'package:chess_timer/features/app-features/controllers/timer_controller.dart';
import 'package:chess_timer/screens/home-screen/widgets/time-options-dropdown/time_options_dropdown.dart';
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
                    if (timerController.hasTimerNotStarted.value) {
                      () {};
                    } else {
                      if (timerController.isTimer1Paused.value && timerController.isTimer2Paused.value) {
                        timerController.onTimersResume();
                      } else {
                        timerController.onTimersPause();
                      }
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
                  child: TimeOptionsDropDown(timerController: timerController),
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
