import 'dart:io';

class AppHttpException extends HttpException {
  final int statusCode;
  AppHttpException(this.statusCode, String message) : super(message);
}