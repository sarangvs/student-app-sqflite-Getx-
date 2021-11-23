
class Students {
  int? id;
  String studentNamedb;
  String studentClassdb;
  String studentDivdb;
  String studentAgedb;
  String studentGenderdb;
  String studentAddressdb;

  Students(
      {this.id,
      required this.studentNamedb,
      required this.studentClassdb,
      required this.studentDivdb,
      required this.studentAgedb,
      required this.studentGenderdb,
      required this.studentAddressdb});


  Students.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        studentNamedb = res['studentNamedb'],
        studentClassdb = res['studentClassdb'],
        studentDivdb = res['studentDivdb'],
        studentAgedb = res['studentAgedb'],
        studentGenderdb = res['studentGenderdb'],
        studentAddressdb = res['studentAddressdb'];

  Map<String,dynamic> toMapForDB(){
    return {
      'id':id,
      'studentNamedb':studentNamedb,
      'studentClassdb':studentClassdb,
      'studentDivdb':studentDivdb,
      'studentAgedb':studentAgedb,
      'studentGenderdb':studentGenderdb,
      'studentAddressdb':studentAddressdb,
    };
  }


}
