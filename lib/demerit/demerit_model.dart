// To parse this JSON data, do
//
//     final demeritDataModel = demeritDataModelFromJson(jsonString);

import 'dart:convert';

List<DemeritDataModel> demeritDataModelFromJson(String str) => List<DemeritDataModel>.from(json.decode(str).map((x) => DemeritDataModel.fromJson(x)));

String demeritDataModelToJson(List<DemeritDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemeritDataModel {
    DemeritDataModel({
        this.id,
        this.offence,
        this.points,
        this.hall,
        this.status,
        this.studentName,
        this.matriculationNumber,
        this.level,
        this.department,
        this.date,
        this.porterName,
    });

    int? id;
    String? offence;
    int? points;
    Hall? hall;
    Status? status;
    StudentName? studentName;
    MatriculationNumber? matriculationNumber;
    int? level;
    Department? department;
    DateTime? date;
    PorterName? porterName;

    factory DemeritDataModel.fromJson(Map<String, dynamic> json) => DemeritDataModel(
        id: json["id"],
        offence: json["offence"],
        points: json["points"],
        hall: hallValues.map[json["hall"]]!,
        status: statusValues.map[json["status"]]!,
        studentName: studentNameValues.map[json["studentName"]]!,
        matriculationNumber: matriculationNumberValues.map[json["matriculationNumber"]]!,
        level: json["level"],
        department: departmentValues.map[json["department"]]!,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        porterName: porterNameValues.map[json["porterName"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "offence": offence,
        "points": points,
        "hall": hallValues.reverse[hall],
        "status": statusValues.reverse[status],
        "studentName": studentNameValues.reverse[studentName],
        "matriculationNumber": matriculationNumberValues.reverse[matriculationNumber],
        "level": level,
        "department": departmentValues.reverse[department],
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "porterName": porterNameValues.reverse[porterName],
    };
}

enum Department { SE }

final departmentValues = EnumValues({
    "SE": Department.SE
});

enum Hall { SAMUEL_AKANDE }

final hallValues = EnumValues({
    "Samuel Akande": Hall.SAMUEL_AKANDE
});

enum MatriculationNumber { THE_192096 }

final matriculationNumberValues = EnumValues({
    "19/2096": MatriculationNumber.THE_192096
});

enum PorterName { JABU_OKORO }

final porterNameValues = EnumValues({
    "Jabu Okoro": PorterName.JABU_OKORO
});

enum Status { ACTIVE, DELETED, RESOLVED }

final statusValues = EnumValues({
    "ACTIVE": Status.ACTIVE,
    "DELETED": Status.DELETED,
    "RESOLVED": Status.RESOLVED
});

enum StudentName { CHUMA_NWAIGBO }

final studentNameValues = EnumValues({
    "Chuma Nwaigbo": StudentName.CHUMA_NWAIGBO
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
