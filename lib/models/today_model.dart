// To parse this JSON data, do
//
//     final todayModel = todayModelFromJson(jsonString);

import 'dart:convert';

TodayModel todayModelFromJson(String str) => TodayModel.fromJson(json.decode(str));

String todayModelToJson(TodayModel data) => json.encode(data.toJson());

class TodayModel {
    TodayModel({
        this.confirmed,
        this.recovered,
        this.hospitalized,
        this.deaths,
        this.newConfirmed,
        this.newRecovered,
        this.newHospitalized,
        this.newDeaths,
        this.updateDate,
        this.source,
        this.devBy,
        this.severBy,
    });

    int confirmed;
    int recovered;
    int hospitalized;
    int deaths;
    int newConfirmed;
    int newRecovered;
    int newHospitalized;
    int newDeaths;
    String updateDate;
    String source;
    String devBy;
    String severBy;

    factory TodayModel.fromJson(Map<String, dynamic> json) => TodayModel(
        confirmed: json["Confirmed"],
        recovered: json["Recovered"],
        hospitalized: json["Hospitalized"],
        deaths: json["Deaths"],
        newConfirmed: json["NewConfirmed"],
        newRecovered: json["NewRecovered"],
        newHospitalized: json["NewHospitalized"],
        newDeaths: json["NewDeaths"],
        updateDate: json["UpdateDate"],
        source: json["Source"],
        devBy: json["DevBy"],
        severBy: json["SeverBy"],
    );

    Map<String, dynamic> toJson() => {
        "Confirmed": confirmed,
        "Recovered": recovered,
        "Hospitalized": hospitalized,
        "Deaths": deaths,
        "NewConfirmed": newConfirmed,
        "NewRecovered": newRecovered,
        "NewHospitalized": newHospitalized,
        "NewDeaths": newDeaths,
        "UpdateDate": updateDate,
        "Source": source,
        "DevBy": devBy,
        "SeverBy": severBy,
    };
}
