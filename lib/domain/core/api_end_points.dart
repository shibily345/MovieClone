import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/infrastructure/apikey.dart';

class ApiEndponts {
  static const Downloads = "$Baseurl/trending/all/day?api_key=$apiKey";
  static const Search =
      '$Baseurl/search/movie?api_key=$apiKey&language=en-US&query=';
  static const hotNewTvMovie =
      '$Baseurl/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate#';
  static const hotNewTv =
      '$Baseurl/discover/tv?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate#';
}
