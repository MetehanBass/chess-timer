import 'dart:developer';

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
    return Container(
      color: ColorService.light_pink,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => IconButton(
                onPressed: () {
                  if (timerController.isTimer1Paused.value && timerController.isTimer2Paused.value) {
                    timerController.onTimersResume();
                  } else {
                    timerController.onTimersPause();
                  }
                },
                icon: timerController.isTimer1Paused.value && timerController.isTimer2Paused.value ? Icon(Icons.play_arrow) : Icon(Icons.pause),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                timerController.onTimersRestart();
              },
              icon: Icon(Icons.replay),
            ),
          ],
        ),
      ),
    );
  }
}
