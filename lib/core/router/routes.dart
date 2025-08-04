enum APP_PAGES { 
  splash, 
  loader, 
  quote, 
  login, 
  forgotPassword, 
  register, 
  home, 
  welcome,
  assessments,
  transition
}

abstract class Routes {
  static const String splash = "/";
  static const String loader = "/loader";
  static const String quote = "/quote";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String forgotPassword = "/forgotPassword";
  static const String register = "/register";
  static const String home = "/home";
  static const String assessments = "/assessments";
  static const String transition = "/transition";
}

extension AppPageExtension on APP_PAGES {
  String get toName => name.toUpperCase();

  String get toPath {
    switch (this) {
      case APP_PAGES.splash:
        return Routes.splash;
      case APP_PAGES.loader:
        return Routes.loader;
      case APP_PAGES.quote:
        return Routes.quote;
      case APP_PAGES.welcome:
        return Routes.welcome;
      case APP_PAGES.login:
        return Routes.login;
      case APP_PAGES.forgotPassword:
        return Routes.forgotPassword;
      case APP_PAGES.register:
        return Routes.register;
      case APP_PAGES.home:
        return Routes.home;
      case APP_PAGES.assessments:
        return Routes.assessments;
      case APP_PAGES.transition:
        return Routes.transition;
    }
  }
}
