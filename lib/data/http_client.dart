import 'dart:io';

import 'package:dio/dio.dart';

Dio httpClient = Dio(BaseOptions(baseUrl: 'https://restcountries.com/v3.1/'))
  ..interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        String message;
        final code = error.response?.statusCode;
        switch (code) {
          case 400:
            message = 'Bad Requast';
            break;
          case 404:
            message = 'Country Not Found';
            break;
          case 500:
            message = 'Server Error';
            break;

          default:
            message = 'Unexpected Error';
        }
        handler.reject(
          DioException(requestOptions: error.requestOptions, message: message),
        );
      },
    ),
  );
