
import 'package:dio/dio.dart';
enum RequstType{
  GET,
  POST
}
 class HttpRequstManager  {


   //定义一个单列
  static Dio?  _dioShareInstance;

  static Dio _getDio(){

    _dioShareInstance??= Dio();

    return _dioShareInstance!;
  }
  //返回我们自己的Response
  static Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await _sendRequest(RequstType.GET, url,
        queryParameters: queryParameters);
  }

  static Future<Response> post(String url,
      {Map<String, dynamic>? queryParameters, dynamic data}) async {
    return await _sendRequest(RequstType.POST, url,
        queryParameters: queryParameters, data: data);
  }

  static Future _sendRequest(RequstType type,String url,{Map<String ,dynamic>? queryParameters,dynamic data}) async {

    try{
      switch(type){
        case RequstType.GET:
          return await  HttpRequstManager._getDio().get(url,queryParameters: queryParameters);

        case RequstType.POST:
          return await HttpRequstManager._getDio()
              .post(url, queryParameters: queryParameters, data: data);
        default:
          throw Exception('请求方式错误');
      }

    } on DioError catch(error){
      print(error.message);
    } on Exception catch(error){
      print(error.toString());
    }


    return null;
  }

}
enum HttpMethod { GET, POST }

class HttpManager {
  //创建Dio单例对象
  static Dio? _dioInstance;

  static Dio _getDioInstance() {
    _dioInstance ??= Dio();
    return _dioInstance!;
  }

  //返回我们自己的Response
  static Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await _sendRequest(HttpMethod.GET, url,
        queryParameters: queryParameters);
  }

  static Future<Response> post(String url,
      {Map<String, dynamic>? queryParameters, dynamic data}) async {
    return await _sendRequest(HttpMethod.POST, url,
        queryParameters: queryParameters, data: data);
  }

  static Future _sendRequest(HttpMethod method, String url,
      {Map<String, dynamic>? queryParameters, dynamic data}) async {
    try {
      switch (method) {
        case HttpMethod.GET:
          return await HttpManager._getDioInstance()
              .get(url, queryParameters: queryParameters);
        case HttpMethod.POST:
          return await HttpManager._getDioInstance()
              .post(url, queryParameters: queryParameters, data: data);
        default:
          throw Exception('请求方式错误');
      }
    } on DioError catch (e) {
      print(e.message);
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }
}