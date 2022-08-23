class RoundToDigets {
  double roundtotwodigets(double value) {
    value = value * 100;
    int newValue = value.round();

    value = newValue / 100;
    return value;
  }
}
