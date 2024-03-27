import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/response_articles.dart';

class Client {
  static Future<List<Article>> fetchArticles() async {
    const url = "https://2354a69f0278466c999027a948d88e2f.api.mockbin.io/";
    // const url =
    //     "https://newsapi.org/v2/everything?q=Indonesia&sources?country=id&apiKey=0693d729a5ae44a5bab8245a27c27589";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      ResponseArticles responseArticles =
          ResponseArticles.fromJson(responseBody);
      return responseArticles.articles;
    } else {
      throw Exception("Failed to load articles");
    }
  }
}
