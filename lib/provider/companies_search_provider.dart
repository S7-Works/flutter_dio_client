import 'package:dio/dio.dart';
import 'package:dio_client/dio_client.dart';
import 'package:flavor/model/company_data.dart';
import 'package:flavor/utils/flavor_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCompanyProvider =
    StateNotifierProvider<GetCompanies, List<CompanyData>>((ref) {
  return GetCompanies(ref.read);
});

class GetCompanies extends StateNotifier<List<CompanyData>> {
  final Reader read;
  GetCompanies(this.read) : super([]);

  fetchCompanies(String value) async {
    final searchUrl = "${FlavorConfig.instance.values.searchUrl}?query=$value";
    var dioClient = DioClientAuthorization(searchUrl);

    List<CompanyData> _users = [];

    Response? res;

    res = await dioClient.get(searchUrl);

    final List list = res.data;

    _users = list.map((e) => CompanyData.fromJson(e)).toList();
    state = _users;
  }

  clear() {
    state = [];
  }
}
