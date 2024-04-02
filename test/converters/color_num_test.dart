import 'package:uni_color_model/uni_color_model.dart';
import 'package:test/test.dart';

void main() {
  final c = RgbInt8Color.rgb(0x0a, 0x1b, 0x2c);

  group('RgbInt8Color -> ARGB', () {
    test('argbInt8Color', () {
      expect(
          c.argbInt8Color,
          const ArgbInt8Color(
            channel0: 0xff,
            channel1: 0x0a,
            channel2: 0x1b,
            channel3: 0x2c,
          ));
    });

    test('argbInt8ListIntBits', () {
      expect(
        c.argbInt8ListIntBits,
        [
          0xff,
          0x0a,
          0x1b,
          0x2c,
        ],
      );
    });

    test('argbInt8StringIntHex', () {
      expect(c.argbInt8StringIntHex, 'ff0a1b2c');
    });
  });
}
