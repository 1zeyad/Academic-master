abstract class ApiService {
  Future<dynamic> get(String Url,
      {String? token, Object? data, Map<String, dynamic>? queryparms});

  Future<dynamic> post(String Url,
      {String? token, Object? data, Map<String, dynamic>? queryparms});

  Future<dynamic> patch(String Url,
      {String? token, Object? data, Map<String, dynamic>? queryparms});

  Future<dynamic> delete(String Url,
      {String? token, Object? data, Map<String, dynamic>? queryparms});

  Future<dynamic> put(String Url,
      {String? token, Object? data, Map<String, dynamic>? queryparms});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


}
