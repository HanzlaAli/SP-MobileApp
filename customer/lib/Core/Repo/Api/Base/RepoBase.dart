// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RepoBase {
  String apiUrl = 'http://132.148.73.196:81/api/';

  Future<http.Response> post(
      {required String url, var body, String? token}) async {
    http.Response response = body != null
        ? token != null
            ? await http.post(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader: "Bearer $token"
                },
                body: json.encode(body),
              )
            : await http.post(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                },
                body: json.encode(body),
              )
        : await http.post(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer $token"
            },
            Uri.parse(apiUrl + url),
          );
    return response;
  }

  Future<http.Response> put(
      {required String url, var body, String? token}) async {
    http.Response response = body != null
        ? token != null
            ? await http.put(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader: "Bearer $token"
                },
                body: json.encode(body),
              )
            : await http.put(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                },
                body: json.encode(body),
              )
        : await http.put(
            Uri.parse(apiUrl + url),
          );
    return response;
  }

  Future<http.Response> get(
      {required String url, var body, String? token}) async {
    http.Response response = body != null || token != null
        ? token != null
            ? await http.get(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader: "Bearer $token"
                },
              )
            : await http.get(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                },
              )
        : await http.get(
            Uri.parse(apiUrl + url),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          );
    return response;
  }

  Future<http.Response> delete(
      {required String url, required var body, String? token}) async {
    http.Response response = body != null
        ? token != null
            ? await http.delete(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader: "Bearer $token"
                },
                body: json.encode(body),
              )
            : await http.delete(
                Uri.parse(apiUrl + url),
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                },
                body: json.encode(body),
              )
        : await http.delete(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Bearer $token"
            },
            Uri.parse(apiUrl + url),
          );
    return response;
  }
}
