import 'package:logger/logger.dart';

class FlavorLogger {
  static  log(var item) {
    var logger = Logger();
    return logger.d(item);
  }
}