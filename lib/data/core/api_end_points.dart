import 'package:open_box/config/strings.dart';
import 'package:open_box/infrastructure/api_key.dart';

class ApiEndPoints {
  static const trending = "$kHostUrl/trending/all/day?api_key=$apiKey";
  static const newReleases =
      "$kHostUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=1";
  // static const apiBaseUrl = 'http://192.168.43.244:5000';
  static const apiBaseUrl = kApiUrl;

  static const userAuth = '$apiBaseUrl/auth';
  static const user = '$apiBaseUrl/user';
  static const post = '$apiBaseUrl/post';
  static const upLoad = '$apiBaseUrl/upload';
  static const chat = '$apiBaseUrl/chat';
  static const messege = '$apiBaseUrl/messege';
  static const room = '$apiBaseUrl/room';
}
