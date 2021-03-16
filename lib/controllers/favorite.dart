import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:mpapis/controllers/dataBase.dart';
import 'package:mpapis/model/dishes_model.dart';
import 'package:mysql1/mysql1.dart';

class Favourite extends ResourceController {
  @Operation.get()
  Future<Response> getFavMenu() async {
    final MySqlConnection _con =
        await MySqlConnection.connect(DataBaseConfig().getMyDbConnection());
    final Results results =
        await _con.query('Select *from dishes where isfav = 1');
    final _resObj = Dishes().parseResponse(results);
    if (_resObj == null) {
      return Response.notFound();
    }
    return Response.ok(_resObj);
  }
}
