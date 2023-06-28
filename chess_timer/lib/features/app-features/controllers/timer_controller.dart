import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';

class TimerController extends GetxController {
  final CountdownController countdownController1 = CountdownController(autoStart: false);
  final CountdownController countdownController2 = CountdownController(autoStart: false);
  RxBool isTimer1Paused = RxBool(false);
  RxBool isTimer2Paused = RxBool(false);
  RxString turn = RxString("");
  RxInt selectedTime = RxInt(300);

  void changeTurn(nextTurn) {
    turn.value = nextTurn;
  }

  void setIsTimer1Resumed() {
    isTimer1Paused.value = false;
    countdownController1.start();
  }

  void setIsTimer2Resumed() {
    isTimer2Paused.value = false;
    countdownController2.start();
  }

  void setIsTimer1Paused() {
    isTimer1Paused.value = true;
    countdownController1.pause();
  }

  void setIsTimer2Paused() {
    isTimer2Paused.value = true;
    countdownController2.pause();
  }

  void onTimersPause() {
    setIsTimer1Paused();
    setIsTimer2Paused();
  }

  void onTimersResume() {
    if (turn.value == "black") {
      countdownController2.resume();
      isTimer2Paused.value = false;
    } else {
      countdownController1.resume();
      isTimer1Paused.value = false;
    }
  }

  void onTimersRestart() {
    countdownController1.restart();
    countdownController2.restart();
    countdownController1.pause();
    countdownController2.pause();
    isTimer1Paused.value = false;
    isTimer2Paused.value = false;
    changeTurn("");
  }
}
