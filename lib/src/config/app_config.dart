class AppConfig {
  const AppConfig._();

  static const String web3FormsAccessKey = String.fromEnvironment(
    'WEB3FORMS_KEY',
    defaultValue: '5842af23-16c1-4ff9-9021-2e73375c93c2',
  );
}
