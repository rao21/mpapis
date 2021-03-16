import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:mpapis/controllers/dataBase.dart';
import 'package:mpapis/model/dishes_model.dart';
import 'package:mysql1/mysql1.dart';

class Menu extends ResourceController {
  @Operation.post()
  Future<Response> setFav() async {
    final MySqlConnection _con =
        await MySqlConnection.connect(DataBaseConfig().getMyDbConnection());
    final Map<String, dynamic> body = await request.body.decode();
    final Results _result = await _con.query(
        'UPDATE dishes SET isFav=${body['isFav'] == true ? 1 : 0} WHERE id=${body['id']}');
    return Response.noContent();
  }

  @Operation.get()
  Future<Response> getMenu() async {
    final MySqlConnection _con =
        await MySqlConnection.connect(DataBaseConfig().getMyDbConnection());
    final Results results = await _con.query('Select *from dishes');
    final _resObj = Dishes().parseResponse(results);
    if (_resObj == null) {
      return Response.notFound();
    }
    return Response.ok(_resObj);
  }
}
