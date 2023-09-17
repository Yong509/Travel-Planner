class HttpConstants {
  static const statusOk = 200;
  static const api_base_url = "https://api.mapbox.com/";
  static final tokenHeader = {
    'Authorization':
        "Bearer eyJ1Ijoia2Vya3dpdCIsImEiOiJjbG1sbDE0bjEwYjd4MnN0bnkzeWJuY2hyIn0.OEg3-6uzcjfF8r1MhKWIEw",
  };
  static final responseHeader = {
    'content-type': 'application/json; charset=utf-8',
  };
  static Map<String, String> getBearerTokenString(String accessToken) => {
        'Authorization': accessToken,
      };

  static const authorizationKey = 'Authorization';
}
