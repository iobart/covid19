
import 'package:covid19/core/data/models/state_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_info_model_dto.g.dart';

@JsonSerializable()
class StateInfoModelDto {
  String? state;
  String? notes;
  String? covid19Site;
  String? covid19SiteSecondary;
  String? covid19SiteTertiary;
  String? covid19SiteQuaternary;
  String? covid19SiteQuinary;
  String? twitter;
  String? covid19SiteOld;
  String? covidTrackingProjectPreferredTotalTestUnits;
  String? covidTrackingProjectPreferredTotalTestField;
  String? totalTestResultsField;
  String? pui;
  bool? pum;
  String? name;
  String? fips;

  StateInfoModelDto({
    this.state,
    this.notes,
    this.covid19Site,
    this.covid19SiteSecondary,
    this.covid19SiteTertiary,
    this.covid19SiteQuaternary,
    this.covid19SiteQuinary,
    this.twitter,
    this.covid19SiteOld,
    this.covidTrackingProjectPreferredTotalTestUnits,
    this.covidTrackingProjectPreferredTotalTestField,
    this.totalTestResultsField,
    this.pui,
    this.pum,
    this.name,
    this.fips,
  });

  factory StateInfoModelDto.fromModel({required StateInfoModel model}) {
    return StateInfoModelDto(
      state: model.state,
      notes: model.notes,
      covid19Site: model.covid19Site,
      covid19SiteSecondary: model.covid19SiteSecondary,
      covid19SiteTertiary: model.covid19SiteTertiary,
      covid19SiteQuaternary: model.covid19SiteQuaternary,
      covid19SiteQuinary: model.covid19SiteQuinary,
      twitter: model.twitter,
      covid19SiteOld: model.covid19SiteOld,
      covidTrackingProjectPreferredTotalTestUnits: model.covidTrackingProjectPreferredTotalTestUnits,
      covidTrackingProjectPreferredTotalTestField: model.covidTrackingProjectPreferredTotalTestField,
      totalTestResultsField: model.totalTestResultsField,
      pui: model.pui,
      pum: model.pum,
      name: model.name,
      fips: model.fips,
    );
  }

factory StateInfoModelDto.fromJson(Map<String, dynamic> json) => _$StateInfoModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$StateInfoModelDtoToJson(this);
}
