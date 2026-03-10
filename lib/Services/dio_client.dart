// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'app_exceptions.dart';

// class DioClient {
//   static const int TIME_OUT_DURATION = 50;
//   // var storage = GetStorage();
//   //GET
//   Future<dynamic> get(String api) async {
//     var uri = Uri.parse(api);
//     try {
//       Dio dio = Dio();
//       // var token = await storage.read('token');
//       // if (token != null) {
//       //   dio.options.headers['Authorization'] = 'Bearer $token';
//       // }
//       var response = await dio
//           .get(api)
//           .timeout(const Duration(seconds: TIME_OUT_DURATION));
//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection', uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(
//           'API not responded in time', uri.toString());
//     }
//   }

//   //POST
//   Future<dynamic> post(
//       [String api = '', dynamic payloadObj, bool? multiForm]) async {
//     var uri = Uri.parse(api);
//     var payload = multiForm == true ? payloadObj : json.encode(payloadObj);
//     try {
//       Dio dio = Dio();
//       // var token = storage.read('token');
//       // if (token != null) {
//       //   dio.options.headers['Authorization'] = 'Bearer $token';
//       // }
//       var response = await dio
//           .post(api, data: payload)
//           .timeout(const Duration(seconds: TIME_OUT_DURATION));
//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection', uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(
//           'API not responded in time', uri.toString());
//     }
//   }

//   dynamic _processResponse(response) {
//     switch (response.statusCode) {
//       case 200:
//         return response;
//       case 201:
//         return response;
//       case 400:
//         throw BadRequestException(
//             utf8.decode(response.bodyBytes), response.request!.url.toString());
//       case 401:
//         throw UnAuthorizedException(
//             utf8.decode(response.bodyBytes), response.request!.url.toString());
//       case 403:
//         throw UnAuthorizedException(
//             utf8.decode(response.bodyBytes), response.request!.url.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occured with code : ${response.statusCode}',
//             response.request!.url.toString());
//     }
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

class HttpService {
  static const int TIMEOUT_DURATION = 50; // Timeout in seconds
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// Set custom headers (e.g., Authorization token)
  void setHeaders(Map<String, String> headers) {
    _headers.addAll(headers);
  }

  /// Generic GET request
  Future<dynamic> get(String url, {Map<String, String>? queryParams}) async {
    Uri uri = Uri.parse(url).replace(queryParameters: queryParams);
    try {
      http.Response response = await http
          .get(uri, headers: _headers)
          .timeout(const Duration(seconds: TIMEOUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responding', uri.toString());
    }
  }

  /// Generic POST request
  Future<dynamic> post(String url,
      {dynamic body, bool isFormData = false}) async {
    Uri uri = Uri.parse(url);
    var encodedBody = isFormData ? body : json.encode(body);

    try {
      http.Response response = await http
          .post(uri, headers: _headers, body: encodedBody)
          .timeout(const Duration(seconds: TIMEOUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      print("No Internet connection");
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      print("API not responding");
      throw ApiNotRespondingException('API not responding', uri.toString());
    }
  }

  /// Generic PUT request
  Future<dynamic> put(String url, {dynamic body}) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http
          .put(uri, headers: _headers, body: json.encode(body))
          .timeout(const Duration(seconds: TIMEOUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responding', uri.toString());
    }
  }

  /// Generic DELETE request
  Future<dynamic> delete(String url) async {
    Uri uri = Uri.parse(url);

    try {
      http.Response response = await http
          .delete(uri, headers: _headers)
          .timeout(const Duration(seconds: TIMEOUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responding', uri.toString());
    }
  }

  /// Upload File (Multipart Request)
  Future<dynamic> uploadFile(String url, String filePath,
      {String fieldName = 'file', Map<String, String>? fields}) async {
    Uri uri = Uri.parse(url);

    try {
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(_headers);

      if (fields != null) {
        request.fields.addAll(fields);
      }

      request.files.add(await http.MultipartFile.fromPath(fieldName, filePath));

      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responding', uri.toString());
    }
  }

  /// Process Response
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(
            response.body, response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            response.body, response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code: ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
