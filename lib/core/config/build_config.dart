class BuildConfig {
  static String appName = "Leuk MT";
  static String appVersion = "1.0.0";
  static String apiBaseUrl = "";
  static String env = "DEV"; // Default environment

  // setter for apiBaseUrl
  static void setApiBaseUrl(String baseUrl) {
    apiBaseUrl = baseUrl;
  }

  // setter for env
  static void setEnv(String environment) {
    env = environment;
  }
}
