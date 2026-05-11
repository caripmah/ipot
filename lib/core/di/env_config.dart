class EnvConfig {
  EnvConfig._();

  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.ipot.example.com',
  );
}
