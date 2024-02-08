import 'package:covid19/core/data/dtos/state_info_model_dto.dart';

class StateInfoModel {
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

  StateInfoModel({
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

  factory StateInfoModel.fromStateInfoModelDto({required StateInfoModelDto dto}) {
    return StateInfoModel(
      state: dto.state,
      notes: dto.notes,
      covid19Site: dto.covid19Site,
      covid19SiteSecondary: dto.covid19SiteSecondary,
      covid19SiteTertiary: dto.covid19SiteTertiary,
      covid19SiteQuaternary: dto.covid19SiteQuaternary,
      covid19SiteQuinary: dto.covid19SiteQuinary,
      twitter: dto.twitter,
      covid19SiteOld: dto.covid19SiteOld,
      covidTrackingProjectPreferredTotalTestUnits: dto.covidTrackingProjectPreferredTotalTestUnits,
      covidTrackingProjectPreferredTotalTestField: dto.covidTrackingProjectPreferredTotalTestField,
      totalTestResultsField: dto.totalTestResultsField,
      pui: dto.pui,
      pum: dto.pum,
      name: dto.name,
      fips: dto.fips,
    );
  }
}
