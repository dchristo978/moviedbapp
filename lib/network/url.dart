class Url {
  static const String apiKey = "df19306849591d5d79cd5b6dbd74ef4a";
  static const String bearerAuthorization = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZjE5MzA2ODQ5NTkxZDVkNzljZDViNmRiZDc0ZWY0YSIsInN1YiI6IjYwOGQxMzAzNWI0ZmVkMDA1OTdiMGIxYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.j59LTBSxgaZgWKqP8sHx6noG5oHWr2XyFmM0iG-OfoY";
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/original';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w185';

  static const String languageENUS = '?language=en-US';
  static const String genre = '/genre/movie/list?language=en';
  static const String listMovies = '/movie';
  static const String discoverMovies = '/discover/movie';
  static const String videos = '/videos';
  static const String reviews = '/reviews';

  static const String genreQueryParam = '&with_genres=';
  static const String pageQueryParam = '&page=';
  static const String appendVideoParam = '&append_to_response=videos';
}
