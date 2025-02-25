// ignore_for_file: file_names

import '../../Core/Services/SharedPrefrenceService.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';

class SharedPrefrenceController {
  final _sharedPrefrencesService = SharedPreferenceService();

  final isAppOpen = "isAppOpened";
  final token = "token";
  final refreshToken = "refreshToken";
  final userId = "userId";
  final tokenExpirationDate = "ExpirationDate";
  final email = "email";
  final password = "password";
  final theme = "app-theme";

  Future<void> isAppOpenedSave(bool value) async {
    await _sharedPrefrencesService.saveBool(isAppOpen, value);
  }

  Future<void> deleteAllData() async {
    await _sharedPrefrencesService.deleteString(token);
    await _sharedPrefrencesService.deleteString(refreshToken);
    await _sharedPrefrencesService.deleteString(userId);
    await _sharedPrefrencesService.deleteString(tokenExpirationDate);
  }

  Future<bool?> getIsAppOpened() async {
    return await _sharedPrefrencesService.getBool(isAppOpen);
  }

  Future<void> saveTheme(Theme value) async {
    await _sharedPrefrencesService.saveString(theme, value.name);
  }

  Future<int?> getTheme() async {
    return await _sharedPrefrencesService.getInt(theme);
  }

  Future<void> tokenSave(String value) async {
    await _sharedPrefrencesService.saveString(token, value);
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

  Future<void> refreshTokenSave(String value) async {
    await _sharedPrefrencesService.saveString(refreshToken, value);
  }

  Future<String?> getRefreshToken() async {
    return await _sharedPrefrencesService.getString(refreshToken);
  }

  Future<String?> getTokenExpiration() async {
    return await _sharedPrefrencesService.getString(tokenExpirationDate);
  }
}
