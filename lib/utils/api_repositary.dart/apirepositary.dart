import 'package:http/http.dart' as http;
import 'package:thence_mechine_test/utils/api_provider/apiprovider.dart';

class Apirepository {
  final Apiprovider apiprovider = Apiprovider();
  Future<http.Response> homescreenRepository() async {
    return apiprovider.homescreenlist();
  }
}
