
class Student{
    late String firstName;
   late  int id;
    late String lastName ;
    late int grade ;

  Student.withId(int id,String firstName,String lastName,int grade){
    this.grade = grade;
    this.id = id;
    this.lastName = lastName;
    this.firstName = firstName;

  }
  Student(String firstName,String lastName,int grade){
    this.grade = grade;
    this.lastName = lastName;
    this.firstName = firstName;

  }
  Student.withoutInfo(){

  }

  String get getfirstName{
    return "OGR- "+this.firstName;
  }
  void set setfirstName(String value){
    this.firstName = value;
  }
  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    }
    else if (this.grade >= 40) {
      message = "Büte kaldı";
    }
    else {
      message = "Kaldı";
    }
    return message;
  }


  }
