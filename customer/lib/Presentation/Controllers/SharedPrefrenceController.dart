// ignore_for_file: file_names

import '../../Core/Services/SharedPrefrencesService.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';

class SharedPrefrenceController {
  final _sharedPrefrencesService = SharedPreferenceService();

  final isAppOpen = "isAppOpened";
  final token = "token";
  final userId = "userId";
  final tokenExpirationDate = "ExpirationDate";
  final email = "email";
  final password = "password";
  final refreshToken = "refreshToken";
  final theme = "app-theme";

  Future<void> deleteAllData() async {
    await _sharedPrefrencesService.deleteString(token);
    await _sharedPrefrencesService.deleteString(refreshToken);
    await _sharedPrefrencesService.deleteString(userId);
    await _sharedPrefrencesService.deleteString(tokenExpirationDate);
 
  }

  Future<void> isAppOpenedSave(bool value) async {
    await _sharedPrefrencesService.saveBool(isAppOpen, value);
  }

  Future<void> saveTheme(Theme value) async {
    await _sharedPrefrencesService.saveString(theme, value.name);
  }

  Future<int?> getTheme() async {
    return await _sharedPrefrencesService.getInt(theme);
  }

  Future<bool?> getIsAppOpened() async {
    return await _sharedPrefrencesService.getBool(isAppOpen);
  }

  Future<void> rememberMeSave(String emailValue, String passwordValue) async {
    await _sharedPrefrencesService.saveString(email, emailValue);
    await _sharedPrefrencesService.saveString(password, passwordValue);
  }

  Future<dynamic> getRememberMe() async {
    String? userEmail = await _sharedPrefrencesService.getString(email);
    String? userPassword = await _sharedPrefrencesService.getString(password);
    return {"email": userEmail, "password": userPassword};
  }

  Future<void> tokenSave(String value) async {
    await _sharedPrefrencesService.saveString(token, value);
  }

  Future<void> userIdSave(int value) async {
    await _sharedPrefrencesService.saveInt(userId, value);
  }

  Future<void> tokenDelete() async {
    await _sharedPrefrencesService.deleteString(token);
  }

  Future<void> tokenExpirationDelete() async {
    await _sharedPrefrencesService.deleteString(tokenExpirationDate);
  }

  Future<String?> getToken() async {
    return await _sharedPrefrencesService.getString(token);
  }

  Future<int?> getUserId() async {
    return await _sharedPrefrencesService.getInt(userId);
  }

  Future<void> tokenExpirationSave(String value) async {
    await _sharedPrefrencesService.saveString(tokenExpirationDate, value);
  }

  Future<String?> getTokenExpiration() async {
    return await _sharedPrefrencesService.getString(tokenExpirationDate);
  }

  Future<void> refreshTokenSave(String value) async {
    await _sharedPrefrencesService.saveString(refreshToken, value);
  }

  Future<String?> getRefreshToken() async {
    return await _sharedPrefrencesService.getString(refreshToken);
  }
}
