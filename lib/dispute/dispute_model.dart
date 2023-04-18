class DisputeDataModel {
  DisputeDataModel({
    required this.disputeId,
    required this.demeritId,
    required this.offence,
    required this.reason,
    required this.points,
    required this.hall,
    required this.resolutionStatus,
    required this.studentName,
    required this.porterName,
    required this.matriculationNumber,
    required this.level,
    required this.department,
    required this.dateAwarded,
    required this.dateDisputed,
  });
  late final int disputeId;
  late final int demeritId;
  late final String offence;
  late final String reason;
  late final int points;
  late final String hall;
  late final String resolutionStatus;
  late final String studentName;
  late final String porterName;
  late final String matriculationNumber;
  late final int level;
  late final String department;
  late final String dateAwarded;
  late final String dateDisputed;
  
  DisputeDataModel.fromJson(Map<String, dynamic> json){
    disputeId = json['disputeId'];
    demeritId = json['demeritId'];
    offence = json['offence'];
    reason = json['reason'];
    points = json['points'];
    hall = json['hall'];
    resolutionStatus = json['resolutionStatus'];
    studentName = json['studentName'];
    porterName = json['porterName'];
    matriculationNumber = json['matriculationNumber'];
    level = json['level'];
    department = json['department'];
    dateAwarded = json['dateAwarded'];
    dateDisputed = json['dateDisputed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['disputeId'] = disputeId;
    _data['demeritId'] = demeritId;
    _data['offence'] = offence;
    _data['reason'] = reason;
    _data['points'] = points;
    _data['hall'] = hall;
    _data['resolutionStatus'] = resolutionStatus;
    _data['studentName'] = studentName;
    _data['porterName'] = porterName;
    _data['matriculationNumber'] = matriculationNumber;
    _data['level'] = level;
    _data['department'] = department;
    _data['dateAwarded'] = dateAwarded;
    _data['dateDisputed'] = dateDisputed;
    return _data;
  }
}