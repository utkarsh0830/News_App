import 'package:http/http.dart' as http;
import 'package:news_app/common/constants.dart';

class ApiService {
  var client = http.Client();
  String endpoint = Constants.API_BASE_URL + Constants.API_PREFIX;
  String apiKey = Constants.API_KEY;

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Accept": "application/json"
  };

  /// Fetch top headlines only from India
  Future<http.Response> getTopHeadlines() {
    return client.get(
      Uri.parse('$endpoint/top-headlines?country=in&apiKey=$apiKey'),
      headers: headers,
    );
  }

  /// Fetch India-related news using keyword filtering
  Future<http.Response> getEverything(String keyword, int page) {
    return client.get(
      Uri.parse('$endpoint/everything?q=$keyword+India&language=en&sortBy=publishedAt&page=$page&apiKey=$apiKey'),
      headers: headers,
    );
  }
}
