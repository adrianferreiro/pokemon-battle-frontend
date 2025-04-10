// lib/core/error/exceptions.dart

class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Server error occurred'});

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  CacheException({this.message = 'Cache error occurred'});

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = 'Network connection error'});

  @override
  String toString() => message;
}
