class EndPoints {
  const EndPoints._();
  static const String baseUrl = 'https://dummyjson.com/';
  static String getUsers(int id) => 'users?limit=$id';
}
