class OfficeVO{
  int id = 0;
  String officeName = "";
  int patientNo= 0;
  String time = "";
  List<String> profileUrl = List.empty();

  OfficeVO(
      this.id, this.officeName, this.patientNo, this.time, this.profileUrl);
}