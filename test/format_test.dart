import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/app/home/job_entries/format.dart';

void main() {
  group("day GB-local", () {
    // setUp(() async {
    //   Intl.defaultLocale = 'en_GB';
    //   await initializeDateFormatting(Intl.defaultLocale, "");
    // });
    test("Monday", () {
      expect(
        Format.dayOfWeek(DateTime(2021, 07, 31)),
        "Sat",
      );
    });
    test("2021-08-1", () {
      expect(
        Format.dayOfWeek(DateTime(2021, 08, 1)),
        "Sun",
      );
    });
  });
  group("date GB-local", () {
    // setUp(() async {
    //   Intl.defaultLocale = 'en_GB';
    //   await initializeDateFormatting(Intl.defaultLocale, "");
    // });
    test("2021-07-31", () {
      expect(
        Format.date(DateTime(2021, 07, 31)),
        "Jul 31, 2021",
      );
    });
    test("2021-08-1", () {
      expect(
        Format.date(DateTime(2021, 08, 1)),
        "Aug 1, 2021",
      );
    });
  });
  group("hours", () {
    test("positive", () {
      expect(Format.hours(10), "10h");
    });
    test("zero", () {
      expect(Format.hours(0), "0h");
    });
    test("negative", () {
      expect(Format.hours(-10), "0h");
    });
    test("decimal", () {
      expect(Format.hours(4.5), "4.5h");
    });
  });
  group("currency", () {
    test("positive", () {
      expect(Format.currency(10), "\$10");
    });
    test("zero", () {
      expect(Format.currency(0), "");
    });
    test("negative", () {
      expect(Format.currency(-10), "-\$10");
    });
    test("decimal", () {
      expect(Format.hours(4.5), "4.5h");
    });
  });
}
