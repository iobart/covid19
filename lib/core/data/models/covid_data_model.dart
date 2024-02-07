import 'package:covid19/core/data/dtos/covid_data_model_dto.dart';

class CovidDataModel{
  int? date;
  int? states;
  int? positive;
  int? negative;
  int? pending;
  int? hospitalizedCurrently;
  int? hospitalizedCumulative;
  int? inIcuCurrently;
  int? inIcuCumulative;
  int? onVentilatorCurrently;
  int? onVentilatorCumulative;
  String? dateChecked;
  int? death;
  int? hospitalized;
  int? totalTestResults;
  String? lastModified;
  dynamic recovered;
  int? total;
  int? posNeg;
  int? deathIncrease;
  int? hospitalizedIncrease;
  int? negativeIncrease;
  int? positiveIncrease;
  int? totalTestResultsIncrease;
  String? hash;
  CovidDataModel({
    this.date,
    this.states,
    this.positive,
    this.negative,
    this.pending,
    this.hospitalizedCurrently,
    this.hospitalizedCumulative,
    this.inIcuCurrently,
    this.inIcuCumulative,
    this.onVentilatorCurrently,
    this.onVentilatorCumulative,
    this.dateChecked,
    this.death,
    this.hospitalized,
    this.totalTestResults,
    this.lastModified,
    this.recovered,
    this.total,
    this.posNeg,
    this.deathIncrease,
    this.hospitalizedIncrease,
    this.negativeIncrease,
    this.positiveIncrease,
    this.totalTestResultsIncrease,
    this.hash,
  });
  factory CovidDataModel.fromCovidDataDtoModel({required CovidDataModelDto model}) {
    return CovidDataModel(
      date: model.date,
      states: model.states,
      positive: model.positive,
      negative: model.negative,
      pending: model.pending,
      hospitalizedCurrently: model.hospitalizedCurrently,
      hospitalizedCumulative: model.hospitalizedCumulative,
      inIcuCurrently: model.inIcuCurrently,
      inIcuCumulative: model.inIcuCumulative,
      onVentilatorCurrently: model.onVentilatorCurrently,
      onVentilatorCumulative: model.onVentilatorCumulative,
      dateChecked: model.dateChecked,
      death: model.death,
      hospitalized: model.hospitalized,
      totalTestResults: model.totalTestResults,
      lastModified: model.lastModified,
      recovered: model.recovered,
      total: model.total,
      posNeg: model.posNeg,
      deathIncrease: model.deathIncrease,
      hospitalizedIncrease: model.hospitalizedIncrease,
      negativeIncrease: model.negativeIncrease,
      positiveIncrease: model.positiveIncrease,
      totalTestResultsIncrease: model.totalTestResultsIncrease,
      hash: model.hash,
    );
  }
}