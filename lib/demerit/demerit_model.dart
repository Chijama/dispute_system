class DemeritDataModel {
  DemeritDataModel({
    required this.id,
    required this.offence,
    required this.points,
    required this.hall,
    required this.status,
    required this.studentName,
    required this.matriculationNumber,
    required this.level,
    required this.department,
    required this.date,
    required this.porterName,
  });
  late final int id;
  late final String offence;
  late final int points;
  late final String hall;
  late final String status;
  late final String studentName;
  late final String matriculationNumber;
  late final int level;
  late final String department;
  late final dynamic date;
  late final String porterName;
  
  DemeritDataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    offence = json['offence'];
    points = json['points'];
    hall = json['hall'];
    status = json['status'];
    studentName = json['studentName'];
    matriculationNumber = json['matriculationNumber'];
    level = json['level'];
    department = json['department'];
    date = json['date'];
    porterName = json['porterName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['offence'] = offence;
    _data['points'] = points;
    _data['hall'] = hall;
    _data['status'] = status;
    _data['studentName'] = studentName;
    _data['matriculationNumber'] = matriculationNumber;
    _data['level'] = level;
    _data['department'] = department;
    _data['date'] = date;
    _data['porterName'] = porterName;
    return _data;
  }
}