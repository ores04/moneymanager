import 'package:flutter_test/flutter_test.dart';
import 'package:manager/math/round.dart';

void main() {
  late RoundToDigets sut;

  setUp(() {
    sut = RoundToDigets();
  });

  test("test Round to 2 digets", () {
    final num = sut.roundtotwodigets(2.354);
    expect(num, 2.35);
  });
}
