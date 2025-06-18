class EndPoints {
    // static const String baseUrl = 'https://test.tasesy.com';
  static const String baseUrl = 'https://reqres.in/api';
  // static const String baseUrl = 'https://t.rhmany.com';
  static const String users = '/users';

  static String imagePath(String imgPath) => '$baseUrl$imgPath';

  static const String checkTokenPath = '/api/me';


  // auth path
  static const String loginPath = '/api/login';

}
