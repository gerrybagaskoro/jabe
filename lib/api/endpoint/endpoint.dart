class ApiConstants {
  static const String baseUrl = 'http://applaporan.mobileprojp.com';
  static const String apiUrl = '$baseUrl/api';

  // Auth endpoints
  static const String login = '$apiUrl/login';
  static const String register = '$apiUrl/register';
  static const String logout = '$apiUrl/logout';

  // Report endpoints
  static const String reports = '$apiUrl/reports';
  static const String reportStatistics = '$apiUrl/report-statistics';

  static String getReportById(int id) => '$reports/$id';
  static String updateReport(int id) => '$reports/$id';
  static String deleteReport(int id) => '$reports/$id';
}
