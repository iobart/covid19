import 'dart:developer';
import 'package:http/http.dart';

/// Helper method that calls a http service and returns the response
Future<Response?> apiCall(Future<Response> serviceCall,
    {String? requestBody}) async {
  try {
    final Response call = await serviceCall;
    _printConnectionData(call, requestBody: requestBody);
    return call;
  } catch (error) {
    print(error);
    return null;
  }
}

/// Prints the important data of an http [Response] in the log
/// as a help for developers.
void _printConnectionData(Response response, {String? requestBody}) {
  final request = response.request;
  log("------------------------------Request--------------------------------");
  log("Request URL: ${request?.url}");
  log("Request Method: ${request?.method}");
  log("Request Headers: ${request?.headers}");
  log("Request Body: ${requestBody ?? "No Request Body Sent"}");
  log("------------------------------Response--------------------------------");
  log("Response Code: ${response.statusCode}");
  log("Response Headers: ${response.headers}");
  log("Response Body: ${response.body}");
}
