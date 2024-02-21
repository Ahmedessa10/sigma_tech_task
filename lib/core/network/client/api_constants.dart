import '../../service_locator/sl.dart';
import 'app_preferences.dart';

class ApiConstants {


  Map<String, String> headers() {
    final lang = sl<AppPreferences>().getLang();
    return  {
      'Accept': 'application/json',
      'lang': lang,
    };
  }
}