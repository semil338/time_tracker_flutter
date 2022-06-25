import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';

void main() {
  group("to map", () {
    test("valid name and ratePerHour", () {
      final job = Job(
        name: "name",
        ratePerHour: 12,
        id: "abc",
      );
      expect(job.toMap(), {"name": "name", "ratePerHour": 12});
    });
  });
  group("from map", () {
    test("null value", () {
      final job = Job.fromMap(null, "abc");
      expect(job, null);
    });

    test("job with all properties", () {
      final job = Job.fromMap(
        {"name": "name", "ratePerHour": 12},
        "abc",
      );
      // expect(job.name, "name");
      // expect(job.ratePerHour, 12);
      // expect(job.id, "abc");
      expect(job, Job(id: "abc", name: "name", ratePerHour: 12));
    });
    test("missing", () {
      final job = Job.fromMap(
        {"ratePerHour": 12},
        "abc",
      );
      // expect(job.name, "name");
      // expect(job.ratePerHour, 12);
      // expect(job.id, "abc");
      expect(job, null);
    });
  });
}
