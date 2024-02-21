import 'package:shared_preferences/shared_preferences.dart';

const String _kToken = 'token';
const String _kUserName = 'userName';
const String _kLang = 'lang';
const String _kIdentityVerifiedState = 'IdentityVerifiedState';


class AppPreferences {

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<bool> saveIdentityVerifiedState(int identityVerifiedState)async{
    return _sharedPreferences.setInt(_kIdentityVerifiedState, identityVerifiedState);
  }


  int? getIdentityVerifiedState(){
    return _sharedPreferences.getInt(_kIdentityVerifiedState);
  }

  Future<bool> saveToken(String token)async{
    return _sharedPreferences.setString(_kToken, token);
  }


  String? getToken(){
    return _sharedPreferences.getString(_kToken);
  }


  Future<bool> removeToken()async{
    return await _sharedPreferences.remove(_kToken);
  }


  void saveUserName(String userName)async{
     await _sharedPreferences.setString(_kUserName, userName);
  }

  String? getUserName(){
    return _sharedPreferences.getString(_kUserName);
  }

  void saveLang(String lang)async{
    await _sharedPreferences.setString(_kLang, lang);
  }
  String getLang(){
    return _sharedPreferences.getString(_kLang)??'ar';
  }
 void clearUserName()async{
  await _sharedPreferences.remove(_kUserName);
 }


}