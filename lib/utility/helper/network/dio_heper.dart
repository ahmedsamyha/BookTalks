import 'package:dio/dio.dart';

import '../../constants/text_constants.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get(
      {required String endPoint,
      required String lang,
      required String token}) async {
    var response = await dio.get('${AppText.baseApiUrl}$endPoint',
        options: Options(headers: {
          'lang': lang,
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required String lang,
    required String token,
    required dynamic data,
  }) async {
    var response = await dio.post(
      '${AppText.baseApiUrl}$endPoint',
      data: data,
      options: Options(
        headers: {
          'lang': lang,
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      ),
    );
    return response.data;
  }
}
