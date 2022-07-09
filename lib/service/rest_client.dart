import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:with_api/model/zip_code.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://viacep.com.br/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/ws/{cep}/json')
  Future<ZipCode> getCep(@Path('cep') String cep);
}
