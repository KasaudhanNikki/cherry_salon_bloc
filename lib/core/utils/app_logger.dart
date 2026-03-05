import 'dart:developer' as console;

class AppLogger {
  static void info(String message) {
    console.log("[INFO] $message");
  }

  static void error(String message, [dynamic error]) {
    console.log("[ERROR] $message");
    if (error != null) print(error);
  }

  static void debug(String message) {
    assert(() {
      console.log("[DEBUG] $message");
      return true;
    }());
  }

  static void warning(String message) {
    console.log("[WARNING] $message");
  }
}