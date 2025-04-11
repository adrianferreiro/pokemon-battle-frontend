import 'dart:io';

class Environment {
  static String apiUrl =
      Platform.isAndroid
          //TODO:
          ? 'http://192.168.16.23:3000'
          : 'http://localhost:3000';
}
