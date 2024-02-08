
import 'package:covid19/core/data/models/state_current_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_current_model_dto.g.dart';

@JsonSerializable()
class StateCurrentModelDto {
  int? date;
  String? state;
  int? positive;
  int? probableCases;
  int? negative;
  int? pending;
  String? totalTestResultsSource;
  int? totalTestResults;
  int? hospitalizedCurrently;
  int? hospitalizedCumulative;
  int? inIcuCurrently;
  int? inIcuCumulative;
  int? onVentilatorCurrently;
  int? onVentilatorCumulative;
  int? recovered;
  String? lastUpdateEt;
  DateTime? dateModified;
  String? checkTimeEt;
  int? death;
  int? hospitalized;
  int? hospitalizedDischarged;
  DateTime? dateChecked;
  int? totalTestsViral;
  int? positiveTestsViral;
  int? negativeTestsViral;
  int? positiveCasesViral;
  int? deathConfirmed;
  int? deathProbable;
  int? totalTestEncountersViral;
  int? totalTestsPeopleViral;
  int? totalTestsAntibody;
  int? positiveTestsAntibody;
  int? negativeTestsAntibody;
  int? totalTestsPeopleAntibody;
  int? positiveTestsPeopleAntibody;
  int? negativeTestsPeopleAntibody;
  int? totalTestsPeopleAntigen;
  int? positiveTestsPeopleAntigen;
  int? totalTestsAntigen;
  int? positiveTestsAntigen;
  String? fips;
  int? positiveIncrease;
  int? negativeIncrease;
  int? total;
  int? totalTestResultsIncrease;
  int? posNeg;
  dynamic dataQualityGrade;
  int? deathIncrease;
  int? hospitalizedIncrease;
  String? hash;
  int? commercialScore;
  int? negativeRegularScore;
  int? negativeScore;
  int? positiveScore;
  int? score;
  String? grade;

  StateCurrentModelDto({
    this.date,
    this.state,
    this.positive,
    this.probableCases,
    this.negative,
    this.pending,
    this.totalTestResultsSource,
    this.totalTestResults,
    this.hospitalizedCurrently,
    this.hospitalizedCumulative,
    this.inIcuCurrently,
    this.inIcuCumulative,
    this.onVentilatorCurrently,
    this.onVentilatorCumulative,
    this.recovered,
    this.lastUpdateEt,
    this.dateModified,
    this.checkTimeEt,
    this.death,
    this.hospitalized,
    this.hospitalizedDischarged,
    this.dateChecked,
    this.totalTestsViral,
    this.positiveTestsViral,
    this.negativeTestsViral,
    this.positiveCasesViral,
    this.deathConfirmed,
    this.deathProbable,
    this.totalTestEncountersViral,
    this.totalTestsPeopleViral,
    this.totalTestsAntibody,
    this.positiveTestsAntibody,
    this.negativeTestsAntibody,
    this.totalTestsPeopleAntibody,
    this.positiveTestsPeopleAntibody,
    this.negativeTestsPeopleAntibody,
    this.totalTestsPeopleAntigen,
    this.positiveTestsPeopleAntigen,
    this.totalTestsAntigen,
    this.positiveTestsAntigen,
    this.fips,
    this.positiveIncrease,
    this.negativeIncrease,
    this.total,
    this.totalTestResultsIncrease,
    this.posNeg,
    this.dataQualityGrade,
    this.deathIncrease,
    this.hospitalizedIncrease,
    this.hash,
    this.commercialScore,
    this.negativeRegularScore,
    this.negativeScore,
    this.positiveScore,
    this.score,
    this.grade,
  });
  factory StateCurrentModelDto.fromModel({required StateCurrentModel model}){
    return StateCurrentModelDto(
      date: model.date,
      state: model.state,
      positive: model.positive,
      probableCases: model.probableCases,
      negative: model.negative,
      pending: model.pending,
      totalTestResultsSource: model.totalTestResultsSource,
      totalTestResults: model.totalTestResults,
      hospitalizedCurrently: model.hospitalizedCurrently,
      hospitalizedCumulative: model.hospitalizedCumulative,
      inIcuCurrently: model.inIcuCurrently,
      inIcuCumulative: model.inIcuCumulative,
      onVentilatorCurrently: model.onVentilatorCurrently,
      onVentilatorCumulative: model.onVentilatorCumulative,
      recovered: model.recovered,
      lastUpdateEt: model.lastUpdateEt,
      dateModified: model.dateModified,
      checkTimeEt: model.checkTimeEt,
      death: model.death,
      hospitalized: model.hospitalized,
      hospitalizedDischarged: model.hospitalizedDischarged,
      dateChecked: model.dateChecked,
      totalTestsViral: model.totalTestsViral,
      positiveTestsViral: model.positiveTestsViral,
      negativeTestsViral: model.negativeTestsViral,
      positiveCasesViral: model.positiveCasesViral,
      deathConfirmed: model.deathConfirmed,
      deathProbable: model.deathProbable,
      totalTestEncountersViral: model.totalTestEncountersViral,
      totalTestsPeopleViral: model.totalTestsPeopleViral,
      totalTestsAntibody: model.totalTestsAntibody,
      positiveTestsAntibody: model.positiveTestsAntibody,
      negativeTestsAntibody: model.negativeTestsAntibody,
      totalTestsPeopleAntibody: model.totalTestsPeopleAntibody,
      positiveTestsPeopleAntibody: model.positiveTestsPeopleAntibody,
      negativeTestsPeopleAntibody: model.negativeTestsPeopleAntibody,
      totalTestsPeopleAntigen: model.totalTestsPeopleAntigen,
      positiveTestsPeopleAntigen: model.positiveTestsPeopleAntigen,
      totalTestsAntigen: model.totalTestsAntigen,
      positiveTestsAntigen: model.positiveTestsAntigen,
      fips: model.fips,
      positiveIncrease: model.positiveIncrease,
      negativeIncrease: model.negativeIncrease,
      total: model.total,
      totalTestResultsIncrease: model.totalTestResultsIncrease,
      posNeg: model.posNeg,
      dataQualityGrade: model.dataQualityGrade,
      deathIncrease: model.deathIncrease,
      hospitalizedIncrease: model.hospitalizedIncrease,
      hash: model.hash,
      commercialScore: model.commercialScore,
      negativeRegularScore: model.negativeRegularScore,
      negativeScore: model.negativeScore,
      positiveScore: model.positiveScore,
      score: model.score,
      grade: model.grade,);
  }

factory StateCurrentModelDto.fromJson(Map<String, dynamic> json) =>
    _$StateCurrentModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$StateCurrentModelDtoToJson(this);

}
