abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(var data, String url);
  Future<dynamic> patchApi(var data, String url);
  Future<dynamic> deleteApi(String url);
}
