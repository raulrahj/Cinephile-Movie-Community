import 'package:open_box/config/strings.dart';
import 'package:open_box/infrastructure/api_key.dart';

class ApiEndPoints {
  static const trending = "$kHostUrl/trending/all/day?api_key=$apiKey";
  static const newReleases = "$kHostUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=1";
  static const apiBaseUrl ='http://192.168.1.105:5000';
}
