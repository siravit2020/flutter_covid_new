import 'dart:collection';

import 'package:bloc/bloc.dart';

import 'package:flutter_covid/models/case_model.dart';
import 'package:flutter_covid/models/general_model.dart';
import 'package:flutter_covid/models/today_model.dart';
import 'package:flutter_covid/services/api_service.dart';
import 'package:meta/meta.dart';

part 'covid19_state.dart';

class Covid19Cubit extends Cubit<Covid19State> {
  Covid19Cubit() : super(Covid19Initial());

  void fetchData() async{
    final service = Covid19Service();
    var today = service.getTodayModel();
      final infoCase = await service.getThailandInfoCase();

      var i = sortData(infoCase);
      TodayModel r = await today.then((value) => value);

      emit(FetchData(r, i));
  }

  General sortData(CaseModel value) {
    int male = 0;
    int female = 0;
    List<double> _listAge = [];
    var av = 0.0;
    Map<String, int> _statCountry = {};
    SplayTreeMap _stateCountryFinal;
    List<String> _nameCountry = [];
    var t = provinceEnValues.reverse;
    value.data.forEach((element) {
      if (element.genderEn == GenderEn.MALE) male++;
      if (element.genderEn == GenderEn.FEMALE) female++;
      var age = element.age;
      if (age != 0.0 && age != null) {
        _listAge.add(age);
        av = av + age;
      }

      String key = t[element.provinceEn];

      print(t[element.provinceEn]);
      if (_statCountry.containsKey(key)) {
        _statCountry.update(key, (value) => value + 1);
      } else {
        _statCountry[key] = 1;
      }
    });
    var max = _listAge.reduce((curr, next) => curr > next ? curr : next);
    var min = _listAge.reduce((curr, next) => curr < next ? curr : next);
    var avg = av ~/ _listAge.length;
    print(_statCountry.toString());
    _stateCountryFinal =
        SplayTreeMap.from(_statCountry, (key1, key2) => _statCountry[key2].compareTo(_statCountry[key1]));
    _stateCountryFinal.forEach((key, value) {
      _nameCountry.add(key.toString().split('.').last);
    });
    print(_nameCountry.length);
    return General(max, min, avg, value.updateDate, male, female, _stateCountryFinal, _nameCountry);
  }

 
}
