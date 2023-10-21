import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HTTPService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
    // print(_base_url);
  }

  Future<Response?> get(String _path) async {
    //demo:-> _path : /coins/bitcoin
    //_base_url : https://api.coingecko.com/api/v3
    try {
      String _url = "$_base_url$_path";
      // dio.get("",queryParameters: {"id": 1});
      // dio.get("",options: Options(headers: {"API_KEY": ""}));
      Response _response = await dio.get(_url);
      return _response;
    } catch (e) {
      print('HTTP Service: Unable to perform a get request');
      print(e);
    }
  }
}
