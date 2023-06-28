import 'package:chess_timer/features/app-features/controllers/timer_controller.dart';
import 'package:chess_timer/screens/home-screen/widgets/timer-buttons/timer_buttons.dart';
import 'package:chess_timer/services/color_service.dart';
import 'package:chess_timer/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

class HomeScreen extends GetView<TimerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.put(TimerController());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (timerController.isTimer1Paused.value) {
                  () {};
                } else {
                  timerController.setIsTimer2Resumed();
                  timerController.setIsTimer1Paused();
                  timerController.changeTurn("black");
                }
              },
              child: Obx(
                () => Container(
                  color: controller.turn.value == "white" ? ColorService.board_white : ColorService.board_black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Center(
                          child: Countdown(
                            controller: timerController.countdownController1,
                            seconds: timerController.selectedTime.toInt(),
                            build: (BuildContext context, double time) => Text(
                              doubleToTime(time).toString(),
                              style: controller.turn.value == "white"
                                  ? Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black)
                                  : Theme.of(context).textTheme.bodyLarge,
                            ),
                            interval: const Duration(milliseconds: 1000),
                            onFinished: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const TimerButtons(),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (timerController.isTimer2Paused.value) {
                  () {};
                } else {
                  timerController.setIsTimer1Resumed();
                  timerController.setIsTimer2Paused();
                  timerController.changeTurn("white");
                }
              },
              child: Obx(
                () => Container(
                  color: controller.turn.value == "black" ? ColorService.board_white : ColorService.board_black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Center(
                          child: Countdown(
                            controller: timerController.countdownController2,
                            seconds: timerController.selectedTime.toInt(),
                            build: (BuildContext context, double time) => Text(doubleToTime(time).toString(),
                                style: controller.turn.value == "black"
                                    ? Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black)
                                    : Theme.of(context).textTheme.bodyLarge),
                            interval: const Duration(milliseconds: 1000),
                            onFinished: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
