// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    UserDataModel({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.matriculationNumber,
        this.level,
        this.department,
        this.demeritPoints,
        this.phoneNumber,
        this.hall,
        this.profileImageUrl,
        this.role,
        this.accessToken,
        this.refreshToken,
    });

    int? id;
    String? email;
    String? firstName;
    String? lastName;
    String? matriculationNumber;
    int? level;
    String? department;
    int? demeritPoints;
    dynamic phoneNumber;
    String? hall;
    String? profileImageUrl;
    String? role;
    String? accessToken;
    String? refreshToken;

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        matriculationNumber: json["matriculationNumber"],
        level: json["level"],
        department: json["department"],
        demeritPoints: json["demeritPoints"],
        phoneNumber: json["phoneNumber"],
        hall: json["hall"],
        profileImageUrl: json["profileImageURL"],
        role: json["role"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "matriculationNumber": matriculationNumber,
        "level": level,
        "department": department,
        "demeritPoints": demeritPoints,
        "phoneNumber": phoneNumber,
        "hall": hall,
        "profileImageURL": profileImageUrl,
        "role": role,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}
