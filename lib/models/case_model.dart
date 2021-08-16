// To parse this JSON data, do
//
//     final caseModel = caseModelFromJson(jsonString);

import 'dart:convert';

CaseModel caseModelFromJson(String str) => CaseModel.fromJson(json.decode(str));

String caseModelToJson(CaseModel data) => json.encode(data.toJson());

class CaseModel {
    CaseModel({
        this.data,
        this.lastData,
        this.updateDate,
        this.source,
        this.devBy,
        this.severBy,
    });

    List<Datum> data;
    DateTime lastData;
    String updateDate;
    String source;
    String devBy;
    String severBy;

    factory CaseModel.fromJson(Map<String, dynamic> json) => CaseModel(
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        lastData: DateTime.parse(json["LastData"]),
        updateDate: json["UpdateDate"],
        source: json["Source"],
        devBy: json["DevBy"],
        severBy: json["SeverBy"],
    );

    Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "LastData": lastData.toIso8601String(),
        "UpdateDate": updateDate,
        "Source": source,
        "DevBy": devBy,
        "SeverBy": severBy,
    };
}

class Datum {
    Datum({
        this.confirmDate,
        this.no,
        this.age,
        this.gender,
        this.genderEn,
        this.nation,
        this.nationEn,
        this.province,
        this.provinceId,
        this.district,
        this.provinceEn,
        this.detail,
        this.statQuarantine,
    });

    DateTime confirmDate;
    String no;
    double age;
    Gender gender;
    GenderEn genderEn;
    Nation nation;
    Nation nationEn;
    Province province;
    int provinceId;
    String district;
    ProvinceEn provinceEn;
    dynamic detail;
    int statQuarantine;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        confirmDate: DateTime.parse(json["ConfirmDate"]),
        no: json["No"] == null ? null : json["No"],
        age: json["Age"] == null ? null : json["Age"].toDouble(),
        gender: genderValues.map[json["Gender"]],
        genderEn: genderEnValues.map[json["GenderEn"]],
        nation: nationValues.map[json["Nation"]],
        nationEn: json["NationEn"] == null ? null : nationValues.map[json["NationEn"]],
        province: provinceValues.map[json["Province"]],
        provinceId: json["ProvinceId"],
        district: json["District"],
        provinceEn: provinceEnValues.map[json["ProvinceEn"]],
        detail: json["Detail"],
        statQuarantine: json["StatQuarantine"],
    );

    Map<String, dynamic> toJson() => {
        "ConfirmDate": confirmDate.toIso8601String(),
        "No": no == null ? null : no,
        "Age": age == null ? null : age,
        "Gender": genderValues.reverse[gender],
        "GenderEn": genderEnValues.reverse[genderEn],
        "Nation": nationValues.reverse[nation],
        "NationEn": nationEn == null ? null : nationValues.reverse[nationEn],
        "Province": provinceValues.reverse[province],
        "ProvinceId": provinceId,
        "District": district,
        "ProvinceEn": provinceEnValues.reverse[provinceEn],
        "Detail": detail,
        "StatQuarantine": statQuarantine,
    };
}

enum Gender { EMPTY, GENDER, PURPLE }

final genderValues = EnumValues({
    "ไม่ระบุเพศ": Gender.EMPTY,
    "หญิง": Gender.GENDER,
    "ชาย": Gender.PURPLE
});

enum GenderEn { UNKNOWN, FEMALE, MALE }

final genderEnValues = EnumValues({
    "Female": GenderEn.FEMALE,
    "Male": GenderEn.MALE,
    "Unknown": GenderEn.UNKNOWN
});

enum Nation { EMPTY, THAILAND, CAMBODIA, JAPAN, CANADA, INDIA, PAKISTAN, NETHERLANDS, BURMA, AUSTRALIA, GREECE, UNITED_STATESOF_AMERICA, TAIWAN, IRELAND, QATAR, UNITED_KINGDOM, CHINA, INDONESIA, VIETNAM, SOMALIA, NATION, LAOS, HUNGARY, SINGAPORE, UGANDA, RUSSIA, KUWAIT, ETHIOPIA, FRANCE, KAZAKHSTAN, SWITZERLAND, TURKEY, CZECHIA, CAMEROON, GERMANY, ITALY, SLOVENIA, BANGLADESH, HONG_KONG, KOREA_SOUTH, UNITED_ARAB_EMIRATES, COLOMBIA, ERITREA, SWEDEN, UKRAINE, DENMARK, NEPAL, CROATIA, YEMEN, PURPLE, SUDAN, AFGHANISTAN, ARGENTINA, BELARUS, BRAZIL, ROMANIA, JORDAN, PHILIPPINES, KENYA, LIBYA, BULGARIA, NIGERIA, ESTONIA, EGYPT, OMAN, SYRIA, NORWAY, AMERICAN, DEUTSCH, BELGIUM, SPAIN, ITALIAN, MEXICO, MALDIVES, ISRAEL, AZERBAIJAN, IRAN, LITHUANIA, BAHRAIN, PORTUGUESE, MACEDONIA, LAOTIAN, ALBANIA, UZBEKISTAN, SERBIA, FINLAND, FLUFFY, TENTACLED, MALAYSIA, MALI, PALESTINE, TUNISIA, LIBERIA, INDIA_THAILAND, PORTUGAL, NEW_ZEALAND, UNKNOWN, BURMESE, KAZAKHSTANI, SWISS, NATION_SPAIN, BRITISH }

final nationValues = EnumValues({
    "Afghanistan": Nation.AFGHANISTAN,
    "Albania": Nation.ALBANIA,
    "American": Nation.AMERICAN,
    "Argentina": Nation.ARGENTINA,
    "Australia": Nation.AUSTRALIA,
    "Azerbaijan": Nation.AZERBAIJAN,
    "Bahrain": Nation.BAHRAIN,
    "Bangladesh": Nation.BANGLADESH,
    "Belarus": Nation.BELARUS,
    "Belgium": Nation.BELGIUM,
    "Brazil": Nation.BRAZIL,
    "British": Nation.BRITISH,
    "Bulgaria": Nation.BULGARIA,
    "Burma": Nation.BURMA,
    "Burmese": Nation.BURMESE,
    "Cambodia": Nation.CAMBODIA,
    "Cameroon": Nation.CAMEROON,
    "Canada": Nation.CANADA,
    "China": Nation.CHINA,
    "Colombia": Nation.COLOMBIA,
    "Croatia": Nation.CROATIA,
    "Czechia": Nation.CZECHIA,
    "Denmark": Nation.DENMARK,
    "deutsch": Nation.DEUTSCH,
    "Egypt": Nation.EGYPT,
    "ไม่ทราบ": Nation.EMPTY,
    "Eritrea": Nation.ERITREA,
    "Estonia": Nation.ESTONIA,
    "Ethiopia": Nation.ETHIOPIA,
    "Finland": Nation.FINLAND,
    "ต่างด้าว": Nation.FLUFFY,
    "France": Nation.FRANCE,
    "Germany": Nation.GERMANY,
    "Greece": Nation.GREECE,
    "HongKong": Nation.HONG_KONG,
    "Hungary": Nation.HUNGARY,
    "India": Nation.INDIA,
    "India-Thailand": Nation.INDIA_THAILAND,
    "Indonesia": Nation.INDONESIA,
    "Iran": Nation.IRAN,
    "Ireland": Nation.IRELAND,
    "Israel": Nation.ISRAEL,
    "Italian": Nation.ITALIAN,
    "Italy": Nation.ITALY,
    "Japan": Nation.JAPAN,
    "Jordan": Nation.JORDAN,
    "Kazakhstan": Nation.KAZAKHSTAN,
    "Kazakhstani": Nation.KAZAKHSTANI,
    "Kenya": Nation.KENYA,
    "Korea,South": Nation.KOREA_SOUTH,
    "Kuwait": Nation.KUWAIT,
    "Laos": Nation.LAOS,
    "Laotian": Nation.LAOTIAN,
    "Liberia": Nation.LIBERIA,
    "Libya": Nation.LIBYA,
    "Lithuania": Nation.LITHUANIA,
    "Macedonia": Nation.MACEDONIA,
    "Malaysia": Nation.MALAYSIA,
    "Maldives": Nation.MALDIVES,
    "Mali": Nation.MALI,
    "Mexico": Nation.MEXICO,
    "ไทยใหญ่": Nation.NATION,
    "Spain": Nation.NATION_SPAIN,
    "Nepal": Nation.NEPAL,
    "Netherlands": Nation.NETHERLANDS,
    "NewZealand": Nation.NEW_ZEALAND,
    "Nigeria": Nation.NIGERIA,
    "Norway": Nation.NORWAY,
    "Oman": Nation.OMAN,
    "Pakistan": Nation.PAKISTAN,
    "Palestine": Nation.PALESTINE,
    "Philippines": Nation.PHILIPPINES,
    "Portugal": Nation.PORTUGAL,
    "Portuguese": Nation.PORTUGUESE,
    "ไทใหญ่": Nation.PURPLE,
    "Qatar": Nation.QATAR,
    "Romania": Nation.ROMANIA,
    "Russia": Nation.RUSSIA,
    "Serbia": Nation.SERBIA,
    "Singapore": Nation.SINGAPORE,
    "Slovenia": Nation.SLOVENIA,
    "Somalia": Nation.SOMALIA,
    "spain": Nation.SPAIN,
    "Sudan": Nation.SUDAN,
    "Sweden": Nation.SWEDEN,
    "Swiss": Nation.SWISS,
    "Switzerland": Nation.SWITZERLAND,
    "Syria": Nation.SYRIA,
    "Taiwan": Nation.TAIWAN,
    "สหราชอาณาจักร": Nation.TENTACLED,
    "Thailand": Nation.THAILAND,
    "Tunisia": Nation.TUNISIA,
    "Turkey": Nation.TURKEY,
    "Uganda": Nation.UGANDA,
    "Ukraine": Nation.UKRAINE,
    "UnitedArabEmirates": Nation.UNITED_ARAB_EMIRATES,
    "UnitedKingdom": Nation.UNITED_KINGDOM,
    "UnitedStatesofAmerica": Nation.UNITED_STATESOF_AMERICA,
    "Unknown": Nation.UNKNOWN,
    "Uzbekistan": Nation.UZBEKISTAN,
    "Vietnam": Nation.VIETNAM,
    "Yemen": Nation.YEMEN
});

enum Province { EMPTY, PROVINCE, PURPLE, FLUFFY, TENTACLED, STICKY, INDIGO, INDECENT, HILARIOUS, AMBITIOUS, CUNNING, MAGENTA, FRISKY, MISCHIEVOUS, BRAGGADOCIOUS, THE_1, THE_2, THE_3, THE_4, THE_5, THE_6, THE_7, THE_8, THE_9, THE_10, THE_11, THE_12, THE_13, THE_14, THE_15, THE_16, THE_17, THE_18, THE_19, THE_20, THE_21, THE_22, THE_23, THE_24, THE_25, THE_26, THE_27, THE_28, THE_29, THE_30, THE_31, THE_32, THE_33, THE_34, THE_35, THE_36, THE_37, THE_38, THE_39, THE_40, THE_41, THE_42, THE_43, THE_44, THE_45, THE_46, THE_47, THE_48, THE_49, THE_50, THE_51, THE_52, THE_53, THE_54, THE_55, THE_56, THE_57, THE_58, THE_59, THE_60, THE_61, THE_62 }

final provinceValues = EnumValues({
    "สิงห์บุรี": Province.AMBITIOUS,
    "พิษณุโลก": Province.BRAGGADOCIOUS,
    "อ่างทอง": Province.CUNNING,
    "สมุทรสาคร": Province.EMPTY,
    "สมุทรปราการ": Province.FLUFFY,
    "ตรัง": Province.FRISKY,
    "นนทบุรี": Province.HILARIOUS,
    "นครราชสีมา": Province.INDECENT,
    "นราธิวาส": Province.INDIGO,
    "ปทุมธานี": Province.MAGENTA,
    "ตาก": Province.MISCHIEVOUS,
    "ระยอง": Province.PROVINCE,
    "ชลบุรี": Province.PURPLE,
    "กรุงเทพมหานคร": Province.STICKY,
    "ฉะเชิงเทรา": Province.TENTACLED,
    "เชียงใหม่": Province.THE_1,
    "จันทบุรี": Province.THE_10,
    "นครสวรรค์": Province.THE_11,
    "อุบลราชธานี": Province.THE_12,
    "กาญจนบุรี": Province.THE_13,
    "สระแก้ว": Province.THE_14,
    "ปราจีนบุรี": Province.THE_15,
    "ตราด": Province.THE_16,
    "นครศรีธรรมราช": Province.THE_17,
    "ราชบุรี": Province.THE_18,
    "สระบุรี": Province.THE_19,
    "เพชรบุรี": Province.THE_2,
    "เลย": Province.THE_20,
    "นครปฐม": Province.THE_21,
    "หนองบัวลำภู": Province.THE_22,
    "บุรีรัมย์": Province.THE_23,
    "สุราษฎร์ธานี": Province.THE_24,
    "ลำพูน": Province.THE_25,
    "สุรินทร์": Province.THE_26,
    "พิจิตร": Province.THE_27,
    "น่าน": Province.THE_28,
    "ประจวบคีรีขันธ์": Province.THE_29,
    "สมุทรสงคราม": Province.THE_3,
    "ชัยนาท": Province.THE_30,
    "ลำปาง": Province.THE_31,
    "อำนาจเจริญ": Province.THE_32,
    "ไม่พบข้อมูล": Province.THE_33,
    "มหาสารคาม": Province.THE_34,
    "นครนายก": Province.THE_35,
    "ระนอง": Province.THE_36,
    "อุตรดิตถ์": Province.THE_37,
    "สุโขทัย": Province.THE_38,
    "กระบี่": Province.THE_39,
    "หนองคาย": Province.THE_4,
    "สตูล": Province.THE_40,
    "ชัยภูมิ": Province.THE_41,
    "สงขลา": Province.THE_42,
    "เชียงราย": Province.THE_43,
    "ภูเก็ต": Province.THE_44,
    "อุดรธานี": Province.THE_45,
    "กำแพงเพชร": Province.THE_46,
    "เพชรบูรณ์": Province.THE_47,
    "ยะลา": Province.THE_48,
    "พะเยา": Province.THE_49,
    "ลพบุรี": Province.THE_5,
    "ปัตตานี": Province.THE_50,
    "ชุมพร": Province.THE_51,
    "พังงา": Province.THE_52,
    "นครพนม": Province.THE_53,
    "พัทลุง": Province.THE_54,
    "สกลนคร": Province.THE_55,
    "กาฬสินธุ์": Province.THE_56,
    "ศรีสะเกษ": Province.THE_57,
    "แม่ฮ่องสอน": Province.THE_58,
    "มุกดาหาร": Province.THE_59,
    "พระนครศรีอยุธยา": Province.THE_6,
    "อุทัยธานี": Province.THE_60,
    "ยโสธร": Province.THE_61,
    "แพร่": Province.THE_62,
    "ขอนแก่น": Province.THE_7,
    "สุพรรณบุรี": Province.THE_8,
    "ร้อยเอ็ด": Province.THE_9
});

enum ProvinceEn { SAMUT_SAKHON, RAYONG, CHONBURI, SAMUT_PRAKAN, CHACHOENGSAO, BANGKOK, NARATHIWAT, NAKHON_RATCHASIMA, NONTHABURI, SING_BURI, ANG_THONG, PATHUM_THANI, TRANG, TAK, PHITSANULOK, CHIANG_MAI, PHETCHABURI, SAMUT_SONGKHRAM, NONG_KHAI, LOPBURI, PHRA_NAKHON_SI_AYUTTHAYA, KHON_KAEN, SUPHAN_BURI, ROI_ET, CHANTHABURI, NAKHON_SAWAN, UBON_RATCHATHANI, KANCHANABURI, SA_KAEO, PRACHINBURI, TRAT, NAKHON_SI_THAMMARAT, RATCHABURI, SARABURI, LOEI, NAKHON_PATHOM, NONG_BUA_LAMPHU, BURIRAM, SURAT_THANI, LAMPHUN, SURIN, PHICHIT, NAN, PRACHUAP_KHIRI_KHAN, CHAINAT, LAMPANG, AMNAT_CHAROEN, UNKNOWN, MAHA_SARAKHAM, NAKHON_NAYOK, RANONG, UTTARADIT, SUKHOTHAI, KRABI, SATUN, CHAIYAPHUM, SONGKHLA, CHIANG_RAI, PHUKET, UDON_THANI, KAMPHAENG_PHET, PHETCHABUN, YALA, PHAYAO, PATTANI, CHUMPHON, PHANG_NGA, NAKHON_PHANOM, PHATTHALUNG, SAKON_NAKHON, KALASIN, SISAKET, MAE_HONG_SON, MUKDAHAN, UTHAI_THANI, YASOTHON, PHRAE }

final provinceEnValues = EnumValues({
    "Amnat Charoen": ProvinceEn.AMNAT_CHAROEN,
    "Ang Thong": ProvinceEn.ANG_THONG,
    "Bangkok": ProvinceEn.BANGKOK,
    "Buriram": ProvinceEn.BURIRAM,
    "Chachoengsao": ProvinceEn.CHACHOENGSAO,
    "Chainat": ProvinceEn.CHAINAT,
    "Chaiyaphum": ProvinceEn.CHAIYAPHUM,
    "Chanthaburi": ProvinceEn.CHANTHABURI,
    "Chiang Mai": ProvinceEn.CHIANG_MAI,
    "Chiang Rai": ProvinceEn.CHIANG_RAI,
    "Chonburi": ProvinceEn.CHONBURI,
    "Chumphon": ProvinceEn.CHUMPHON,
    "Kalasin": ProvinceEn.KALASIN,
    "Kamphaeng Phet": ProvinceEn.KAMPHAENG_PHET,
    "Kanchanaburi": ProvinceEn.KANCHANABURI,
    "Khon Kaen": ProvinceEn.KHON_KAEN,
    "Krabi": ProvinceEn.KRABI,
    "Lampang": ProvinceEn.LAMPANG,
    "Lamphun": ProvinceEn.LAMPHUN,
    "Loei": ProvinceEn.LOEI,
    "Lopburi": ProvinceEn.LOPBURI,
    "Mae Hong Son": ProvinceEn.MAE_HONG_SON,
    "Maha Sarakham": ProvinceEn.MAHA_SARAKHAM,
    "Mukdahan": ProvinceEn.MUKDAHAN,
    "Nakhon Nayok": ProvinceEn.NAKHON_NAYOK,
    "Nakhon Pathom": ProvinceEn.NAKHON_PATHOM,
    "Nakhon Phanom": ProvinceEn.NAKHON_PHANOM,
    "Nakhon Ratchasima": ProvinceEn.NAKHON_RATCHASIMA,
    "Nakhon Sawan": ProvinceEn.NAKHON_SAWAN,
    "Nakhon Si Thammarat": ProvinceEn.NAKHON_SI_THAMMARAT,
    "Nan": ProvinceEn.NAN,
    "Narathiwat": ProvinceEn.NARATHIWAT,
    "Nong Bua Lamphu": ProvinceEn.NONG_BUA_LAMPHU,
    "Nong Khai": ProvinceEn.NONG_KHAI,
    "Nonthaburi": ProvinceEn.NONTHABURI,
    "Pathum Thani": ProvinceEn.PATHUM_THANI,
    "Pattani": ProvinceEn.PATTANI,
    "Phang Nga": ProvinceEn.PHANG_NGA,
    "Phatthalung": ProvinceEn.PHATTHALUNG,
    "Phayao": ProvinceEn.PHAYAO,
    "Phetchabun": ProvinceEn.PHETCHABUN,
    "Phetchaburi": ProvinceEn.PHETCHABURI,
    "Phichit": ProvinceEn.PHICHIT,
    "Phitsanulok": ProvinceEn.PHITSANULOK,
    "Phrae": ProvinceEn.PHRAE,
    "Phra Nakhon Si Ayutthaya": ProvinceEn.PHRA_NAKHON_SI_AYUTTHAYA,
    "Phuket": ProvinceEn.PHUKET,
    "Prachinburi": ProvinceEn.PRACHINBURI,
    "Prachuap Khiri Khan": ProvinceEn.PRACHUAP_KHIRI_KHAN,
    "Ranong": ProvinceEn.RANONG,
    "Ratchaburi": ProvinceEn.RATCHABURI,
    "Rayong": ProvinceEn.RAYONG,
    "Roi Et": ProvinceEn.ROI_ET,
    "Sakon Nakhon": ProvinceEn.SAKON_NAKHON,
    "Samut Prakan": ProvinceEn.SAMUT_PRAKAN,
    "Samut Sakhon": ProvinceEn.SAMUT_SAKHON,
    "Samut Songkhram": ProvinceEn.SAMUT_SONGKHRAM,
    "Saraburi": ProvinceEn.SARABURI,
    "Satun": ProvinceEn.SATUN,
    "Sa Kaeo": ProvinceEn.SA_KAEO,
    "Sing Buri": ProvinceEn.SING_BURI,
    "Sisaket": ProvinceEn.SISAKET,
    "Songkhla": ProvinceEn.SONGKHLA,
    "Sukhothai": ProvinceEn.SUKHOTHAI,
    "Suphan Buri": ProvinceEn.SUPHAN_BURI,
    "Surat Thani": ProvinceEn.SURAT_THANI,
    "Surin": ProvinceEn.SURIN,
    "Tak": ProvinceEn.TAK,
    "Trang": ProvinceEn.TRANG,
    "Trat": ProvinceEn.TRAT,
    "Ubon Ratchathani": ProvinceEn.UBON_RATCHATHANI,
    "Udon Thani": ProvinceEn.UDON_THANI,
    "Unknown": ProvinceEn.UNKNOWN,
    "Uthai Thani": ProvinceEn.UTHAI_THANI,
    "Uttaradit": ProvinceEn.UTTARADIT,
    "Yala": ProvinceEn.YALA,
    "Yasothon": ProvinceEn.YASOTHON
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

class CaseTest {
  List<Data> data;
  String lastData;
  String updateDate;
  String source;
  String devBy;
  String severBy;

  CaseTest(
      {this.data,
      this.lastData,
      this.updateDate,
      this.source,
      this.devBy,
      this.severBy});

  CaseTest.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    lastData = json['LastData'];
    updateDate = json['UpdateDate'];
    source = json['Source'];
    devBy = json['DevBy'];
    severBy = json['SeverBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['LastData'] = this.lastData;
    data['UpdateDate'] = this.updateDate;
    data['Source'] = this.source;
    data['DevBy'] = this.devBy;
    data['SeverBy'] = this.severBy;
    return data;
  }
}

class Data {
  String confirmDate;
  String no;
  double age;
  String gender;
  String genderEn;
  String nation;
  String nationEn;
  String province;
  int provinceId;
  String district;
  String provinceEn;
  Null detail;
  int statQuarantine;

  Data(
      {this.confirmDate,
      this.no,
      this.age,
      this.gender,
      this.genderEn,
      this.nation,
      this.nationEn,
      this.province,
      this.provinceId,
      this.district,
      this.provinceEn,
      this.detail,
      this.statQuarantine});

  Data.fromJson(Map<String, dynamic> json) {
    confirmDate = json['ConfirmDate'];
    no = json['No'];
    age = json['Age'];
    gender = json['Gender'];
    genderEn = json['GenderEn'];
    nation = json['Nation'];
    nationEn = json['NationEn'];
    province = json['Province'];
    provinceId = json['ProvinceId'];
    district = json['District'];
    provinceEn = json['ProvinceEn'];
    detail = json['Detail'];
    statQuarantine = json['StatQuarantine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ConfirmDate'] = this.confirmDate;
    data['No'] = this.no;
    data['Age'] = this.age;
    data['Gender'] = this.gender;
    data['GenderEn'] = this.genderEn;
    data['Nation'] = this.nation;
    data['NationEn'] = this.nationEn;
    data['Province'] = this.province;
    data['ProvinceId'] = this.provinceId;
    data['District'] = this.district;
    data['ProvinceEn'] = this.provinceEn;
    data['Detail'] = this.detail;
    data['StatQuarantine'] = this.statQuarantine;
    return data;
  }
}
