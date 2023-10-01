import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioFetcherProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger());
  return dio;
});
