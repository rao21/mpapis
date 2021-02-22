import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:mpapis/modelResponse/speakers.dart';

class Speakers extends ResourceController {
  @Operation.get()
  Future<Response> getAllSpeakers() async {
    return Response.ok(talksSpeaker.data);
  }

  @Operation.delete()
  Future<Response> deleteUser() async {
    return Response.ok({"code": "User Deleted Successfully"});
  }
}
