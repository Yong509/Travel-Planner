import 'package:http/http.dart';
import '../constants/http_constant.dart';
import '../utils/text_util.dart';

class HttpClientService {
  factory HttpClientService() {
    return HttpClientService.internal(Client());
  }

  HttpClientService.internal(this.client);

  final Client client;
  String? accessToken;

  void setAccessToken(String token) {
    accessToken = token;
  }

  Future<Response> get(Uri url) async {
    final response = await client.get(url);
    return response;
  }

  Future<Response> getWithParams(Uri url) async {
    final response = await client.get(url);
    return convertResponseFormat(response);
  }

  Future<void> getWithHeader(Uri url, Map<String, String> headers,
      {bool omitAccessToken = false}) async {
    if (!omitAccessToken) {
      addAccessToken(headers);
    }
    final response = await client.get(url, headers: headers);
    convertResponseFormat(response);
  }

  Future<Response> post(Uri url, Map<String, String> headers, String body,
      {bool omitAccessToken = false}) async {
    if (!omitAccessToken) {
      addAccessToken(headers);
    }
    final response = await client.post(url, headers: headers, body: body);
    return convertResponseFormat(response);
  }

  Future<Response> put(Uri url, Map<String, String> headers, String body,
      {bool omitAccessToken = false}) async {
    if (!omitAccessToken) {
      addAccessToken(headers);
    }
    final response = await client.put(url, headers: headers, body: body);
    return convertResponseFormat(response);
  }

  Future<Response> patch(
    Uri url,
    Map<String, String> headers,
    String? body, {
    bool omitAccessToken = false,
  }) async {
    if (!omitAccessToken) {
      addAccessToken(headers);
    }
    final response = await client.patch(url, headers: headers, body: body);
    return convertResponseFormat(response);
  }

  void addAccessToken(Map<String, String> headers) {
    if (!headers.containsKey(HttpConstants.authorizationKey)) {
      headers[HttpConstants.authorizationKey] =
          HttpConstants.getBearerTokenString(accessToken ?? '').toString();
    }
  }

  Response convertResponseFormat(Response response) {
    final newResponse = Response(
      TextUtil.utf8convert(response.body),
      response.statusCode,
      headers: HttpConstants.responseHeader,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
    );
    return newResponse;
  }
}
