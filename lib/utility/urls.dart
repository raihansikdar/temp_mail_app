class Urls{
  Urls._();
  static const String _baseUrl = 'https://api.mail.tm';
  static const String domainUrl = "$_baseUrl/domains?page=1";
  static const String createAccountUrl = "$_baseUrl/accounts";
  static const String tokenUrl = "$_baseUrl/token";
  static const String messageUrl = "$_baseUrl/messages?page=1";
}