import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resource<T> {
  final String? url;
  T Function(Response response)? parse;

  Resource({this.url, this.parse});
}
