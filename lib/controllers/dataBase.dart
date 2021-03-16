import 'package:mysql1/mysql1.dart';

class DataBaseConfig {
  // ignore: missing_return
  ConnectionSettings getMyDbConnection() {
    const _host = 'localhost';
    const _port = 3306;
    const _user = 'root';
    const _pwd = 'root';
    const _db = 'restaurant';
    try {
      print("Initialize DB Connection");
      final settings = ConnectionSettings(
          host: _host, port: _port, user: _user, password: _pwd, db: _db);
      print("SuccesFully Connect DB");
      return settings;
    } catch (exception) {
      print("Error In Connection DB");
      print(exception.toString());
    }
  }
}
