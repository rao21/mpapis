import 'harness/app.dart';

Future main() async {
  final harness = Harness()..install();

  test("test my route", () async {
    expectResponse(await harness.agent.get("/example"), 200,
        body: {"name": "Raos"});
  });
}
