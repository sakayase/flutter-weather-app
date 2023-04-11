class Env {
  Env({
    required this.weatherApiKey,
    required this.apiUrl,
  });

  String weatherApiKey;
  String apiUrl;
}

Env env = Env(
  weatherApiKey: '',
  apiUrl: '',
);
