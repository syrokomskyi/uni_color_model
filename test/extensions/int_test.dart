import 'package:uni_color_model/uni_color_model.dart';
import 'package:test/test.dart';

void main() {
  group('channelFromIntDepth, correct values', () {
    const b = 0x6fde0a1b2c;
    // bin 0110111111011110000010100001101100101100

    test('2 bits', () {
      // bin 011011111101111000001010000110 11 00 10 11 00
      expect(b.channelFromIntDepth(0, 2), int.parse('11', radix: 2));
      expect(b.channelFromIntDepth(1, 2), int.parse('00', radix: 2));
      expect(b.channelFromIntDepth(2, 2), int.parse('10', radix: 2));
      expect(b.channelFromIntDepth(3, 2), int.parse('11', radix: 2));
      expect(b.channelFromIntDepth(4, 2), int.parse('00', radix: 2));
    });

    test('4 bits', () {
      expect(b.channelFromIntDepth(0, 4), 0xa);
      expect(b.channelFromIntDepth(1, 4), 0x1);
      expect(b.channelFromIntDepth(2, 4), 0xb);
      expect(b.channelFromIntDepth(3, 4), 0x2);
      expect(b.channelFromIntDepth(4, 4), 0xc);
    });

    test('8 bits', () {
      expect(b.channelFromIntDepth(0, 8), 0x6f);
      expect(b.channelFromIntDepth(1, 8), 0xde);
      expect(b.channelFromIntDepth(2, 8), 0x0a);
      expect(b.channelFromIntDepth(3, 8), 0x1b);
      expect(b.channelFromIntDepth(4, 8), 0x2c);
    });

    test('10 bits', () {
      // bin 0000000000 0110111111 0111100000 1010000110 1100101100
      expect(b.channelFromIntDepth(0, 10), int.parse('0000000000', radix: 2));
      expect(b.channelFromIntDepth(1, 10), int.parse('0110111111', radix: 2));
      expect(b.channelFromIntDepth(2, 10), int.parse('0111100000', radix: 2));
      expect(b.channelFromIntDepth(3, 10), int.parse('1010000110', radix: 2));
      expect(b.channelFromIntDepth(4, 10), int.parse('1100101100', radix: 2));
    });
  });

  group('channelFromIntDepths, correct values', () {
    const b = 0x6fde0a1b2c;

    test('5:6 bits, reverse', () {
      // bin 01101111110111100000101000011 01100 101100
      const depths = [5, 6];
      expect(
        b.channelFromIntDepths(0, depths),
        int.parse('01100', radix: 2),
      );
      expect(
        b.channelFromIntDepths(1, depths),
        int.parse('101100', radix: 2),
      );
    });

    test('3:4:5:6 bits, reverse', () {
      // bin 0110111111011110000010 100 0011 01100 101100
      const depths = [3, 4, 5, 6];
      expect(
        b.channelFromIntDepths(0, depths),
        int.parse('100', radix: 2),
      );
      expect(
        b.channelFromIntDepths(1, depths),
        int.parse('0011', radix: 2),
      );
      expect(
        b.channelFromIntDepths(2, depths),
        int.parse('01100', radix: 2),
      );
      expect(
        b.channelFromIntDepths(3, depths),
        int.parse('101100', radix: 2),
      );
    });

    /* TODO
    test('5:6 bits, no reverse', () {
      // bin 01101111110111100000101000011 011001 01100
      const depths = [5, 6];
      expect(
        b.channelFromIntDepths(0, depths, reverse: false),
        int.parse('01100', radix: 2),
      );
      expect(
        b.channelFromIntDepths(1, depths, reverse: false),
        int.parse('011001', radix: 2),
      );
    });
    */
  });

  group('unpackFromIntDepth, correct values', () {
    const b = 0x6fde0a1b2c;
    // bin 0110111111011110000010100001101100101100

    test('2 bits', () {
      // bin 011011111101111000001010000110 11 00 10 11 00
      expect(
        b.unpackFromIntDepth(2),
        [
          int.parse('11', radix: 2),
          int.parse('00', radix: 2),
          int.parse('10', radix: 2),
          int.parse('11', radix: 2),
          int.parse('00', radix: 2),
        ],
      );
    });

    test('4 bits', () {
      expect(b.unpackFromIntDepth(4), [0xa, 0x1, 0xb, 0x2, 0xc]);
    });

    test('8 bits', () {
      expect(b.unpackFromIntDepth(8), [0x6f, 0xde, 0x0a, 0x1b, 0x2c]);
    });

    test('10 bits', () {
      // bin 0000000000 0110111111 0111100000 1010000110 1100101100
      expect(
        b.unpackFromIntDepth(10),
        [
          int.parse('0000000000', radix: 2),
          int.parse('0110111111', radix: 2),
          int.parse('0111100000', radix: 2),
          int.parse('1010000110', radix: 2),
          int.parse('1100101100', radix: 2),
        ],
      );
    });
  });

  group('unpackFromIntDepths, correct values', () {
    const b = 0x6fde0a1b2c;

    test('5:6 bits, reverse', () {
      // bin 01101111110111100000101000011 01100 101100
      const depths = [5, 6];
      expect(
        b.unpackFromIntDepths(depths),
        [
          int.parse('01100', radix: 2),
          int.parse('101100', radix: 2),
        ],
      );
    });

    test('3:4:5:6 bits, reverse', () {
      // bin 0110111111011110000010 100 0011 01100 101100
      const depths = [3, 4, 5, 6];
      expect(
        b.unpackFromIntDepths(depths),
        [
          int.parse('100', radix: 2),
          int.parse('0011', radix: 2),
          int.parse('01100', radix: 2),
          int.parse('101100', radix: 2),
        ],
      );
    });

    /* TODO
    test('5:6 bits, no reverse', () {
      // bin 01101111110111100000101000011 011001 01100
      const depths = [5, 6];
      expect(
        b.unpackFromIntDepths(depths, reverse: false),
        [
          int.parse('01100', radix: 2),
          int.parse('011001', radix: 2),
        ],
      );
    });
    */
  });

  group('unpackFromInt8, correct values', () {
    test('zero value', () {
      expect(0x00.unpackFromInt8, <int>[]);
    });

    test('1 element', () {
      expect(0xde.unpackFromInt8, [0xde]);
    });

    test('2 elements', () {
      expect(0xde0a.unpackFromInt8, [0xde, 0x0a]);
    });

    test('3 elements', () {
      expect(0xde0a1b.unpackFromInt8, [0xde, 0x0a, 0x1b]);
    });

    test('4 elements', () {
      expect(0xde0a1b2c.unpackFromInt8, [0xde, 0x0a, 0x1b, 0x2c]);
    });

    test('5 elements', () {
      expect(0x6fde0a1b2c.unpackFromInt8, [0x6f, 0xde, 0x0a, 0x1b, 0x2c]);
    });
  });

  group('fillWithOnesRight, correct values', () {
    test('fill ones', () {
      expect(fillWithOnesRight(0), 0x00);
      expect(fillWithOnesRight(1), 0x01);
      expect(fillWithOnesRight(2), 0x03);
      expect(fillWithOnesRight(4), 0x0f);
      expect(fillWithOnesRight(8), 0xff);
      expect(fillWithOnesRight(16), 0xffff);
      expect(fillWithOnesRight(24), 0xffffff);
      expect(fillWithOnesRight(32), 0xffffffff);
    });
  });
}
