import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    // Adicionando opções e interceptores para o Dio
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://5f7cba02834b5c0016b058aa.mockapi.io/api',
          connectTimeout: const Duration(seconds: 10), // Timeout de conexão
          receiveTimeout: const Duration(seconds: 10), // Timeout de resposta
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      )..interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            // Adicionando logs ou modificações na request
            print('Request: ${options.uri}');
            return handler.next(options); // Continua com a requisição
          },
          onResponse: (response, handler) {
            // Modificações no retorno da resposta
            print('Response: ${response.statusCode}');
            return handler.next(response); // Continua com a resposta
          },
          onError: (DioError error, handler) {
            // Tratamento de erros
            print('Error: ${error.message}');
            return handler.next(error); // Passa o erro adiante
          },
        )),
    );
  }
}
