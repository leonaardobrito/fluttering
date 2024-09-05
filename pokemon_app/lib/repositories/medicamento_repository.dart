import 'package:dio/dio.dart';
import 'package:pokemon_app/models/pagination_filter.dart';
import 'package:pokemon_app/models/medicamento_model.dart';

class UserRepository {
  Dio _dio;

  UserRepository(
    this._dio,
  );

  Future<List<MedicamentoModel>> findAll(PaginationFilter filter) {
    return _dio.get('/medicamentos', queryParameters: {
      'page': filter.page,
      'limit': filter.limit,
    }).then(
      (res) => res?.data
          ?.map<MedicamentoModel>(
            (u) => MedicamentoModel.fromMap(u),
          )
          ?.toList(),
    );
  }
}
