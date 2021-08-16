import 'package:dio/dio.dart';
import 'package:flutter_covid/models/case_model.dart';
import 'package:flutter_covid/models/today_model.dart';

class Covid19Service{
   Future<TodayModel> getTodayModel() async {
    final response = await Dio().get('https://covid19.th-stat.com/api/open/today');
    return TodayModel.fromJson(response.data);
  }

  Future<CaseModel> getThailandInfoCase() async {
    final response = await Dio().get('https://covid19.th-stat.com/api/open/cases');
    return CaseModel.fromJson(response.data);
  }
}