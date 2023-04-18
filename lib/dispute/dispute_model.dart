// To parse this JSON data, do
//
//     final disputeDataModel = disputeDataModelFromJson(jsonString);

import 'dart:convert';

List<DisputeDataModel> disputeDataModelFromJson(String str) => List<DisputeDataModel>.from(json.decode(str).map((x) => DisputeDataModel.fromJson(x)));

String disputeDataModelToJson(List<DisputeDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DisputeDataModel {
    DisputeDataModel({
        this.disputeId,
        this.demeritId,
        this.offence,
        this.reason,
        this.points,
        this.hall,
        this.resolutionStatus,
        this.studentName,
        this.porterName,
        this.matriculationNumber,
        this.level,
        this.department,
        this.dateAwarded,
        this.dateDisputed,
    });

    int? disputeId;
    int? demeritId;
    String? offence;
    String? reason;
    int? points;
    String? hall;
    String? resolutionStatus;
    String? studentName;
    String? porterName;
    String? matriculationNumber;
    int? level;
    String? department;
    DateTime? dateAwarded;
    DateTime? dateDisputed;

    factory DisputeDataModel.fromJson(Map<String, dynamic> json) => DisputeDataModel(
        disputeId: json["disputeId"],
        demeritId: json["demeritId"],
        offence: json["offence"],
        reason: json["reason"],
        points: json["points"],
        hall: json["hall"],
        resolutionStatus: json["resolutionStatus"],
        studentName: json["studentName"],
        porterName: json["porterName"],
        matriculationNumber: json["matriculationNumber"],
        level: json["level"],
        department: json["department"],
        dateAwarded: json["dateAwarded"] == null ? null : DateTime.parse(json["dateAwarded"]),
        dateDisputed: json["dateDisputed"] == null ? null : DateTime.parse(json["dateDisputed"]),
    );

    Map<String, dynamic> toJson() => {
        "disputeId": disputeId,
        "demeritId": demeritId,
        "offence": offence,
        "reason": reason,
        "points": points,
        "hall": hall,
        "resolutionStatus": resolutionStatus,
        "studentName": studentName,
        "porterName": porterName,
        "matriculationNumber": matriculationNumber,
        "level": level,
        "department": department,
        "dateAwarded": "${dateAwarded!.year.toString().padLeft(4, '0')}-${dateAwarded!.month.toString().padLeft(2, '0')}-${dateAwarded!.day.toString().padLeft(2, '0')}",
        "dateDisputed": "${dateDisputed!.year.toString().padLeft(4, '0')}-${dateDisputed!.month.toString().padLeft(2, '0')}-${dateDisputed!.day.toString().padLeft(2, '0')}",
    };
}
