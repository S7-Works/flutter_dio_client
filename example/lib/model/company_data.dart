import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_data.freezed.dart';
part 'company_data.g.dart';



@freezed
class CompanyData with _$CompanyData {
  const factory CompanyData({
    @Default('') String name,
    @Default('') String domain,
    @Default('') String logo,
  }) = _CompanyData;

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);
}
