String doubleToTime(double value) {
  if (value < 60) {
    return value.toInt().toString();
  } else {
    int hours = (value / 60).floor();
    int minutes = (value % 60).toInt();
    String hoursString = hours.toString().padLeft(2, '0');
    String minutesString = minutes.toString().padLeft(2, '0');
    return '$hoursString:$minutesString';
  }
}
