class HttpConstants {
  static const statusOk = 200;
  static const api_base_url = "https://api.mapbox.com/";

  static final responseHeader = {
    'content-type': 'application/json; charset=utf-8',
  };
  static Map<String, String> getBearerTokenString(String accessToken) => {
        'Authorization': accessToken,
      };

  static const authorizationKey = 'Authorization';
}
