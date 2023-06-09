
import 'package:dio/dio.dart';
import 'package:dio_clients/dio_clients.dart';
import 'package:example/model/company_data.dart';
import 'package:example/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCompanyProvider =
    StateNotifierProvider<GetCompanies, List<CompanyData>>((ref) {
  return GetCompanies(ref);
});

class GetCompanies extends StateNotifier<List<CompanyData>> {
  final Ref ref;
  GetCompanies(this.ref) : super([]);

  fetchCompanies(String value) async {
    final searchUrl = "${Constants.searchUrl}?query=$value";
    var dioClient = DioClientNoAuthorization(searchUrl);

    List<CompanyData> users = [];

    Response? res;

    res = await dioClient.get(searchUrl);

    final List list = res.data;

    users = list.map((e) => CompanyData.fromJson(e)).toList();
    state = users;
  }

  clear() {
    state = [];
  }
}
