class ServiceConstants {
  // API Config
  static final String _apiURL = 'http://ec2-34-244-31-212.eu-west-1.compute.amazonaws.com:9003';
  static final String _mockURL = 'http://10.0.2.2:9003';
  static final String _apiVersion = '/v1';
  static final String _requestURL = _apiURL + _apiVersion;

  // Endpoints
  // Authentication
  static String loginEndpoint = _requestURL + "/login";
  static String logoutEndpoint = _requestURL + "/logout";

  // Person
  static String _personBaseURL = _requestURL + "/person";
  static String getPersonByUserIdEndpoint = _personBaseURL + "/getPersonByUserId";
}
