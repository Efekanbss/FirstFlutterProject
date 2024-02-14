
import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';



class StudentAdd extends StatefulWidget{
   List<Student> students;
   StudentAdd(this.students );

  @override
  State<StudentAdd> createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
 late List<Student> students;

  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  StudentAdd(List<Student> students ) {
    this.students = students;
    // TODO: implement StudentAdd
    throw UnimplementedError();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children:<Widget> [
               buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),

            ],

          ),
        )

      )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci adı",hintText: "Engin"),

    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Aldığı not",hintText: "65"),

    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci soyadı",hintText: "Demiroğ"),

    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        child:Text("Kaydet"),
      onPressed:(){
        if(formKey.currentState != null){
          formKey.currentState?.save();
          students.add(student);
          saveStudent();
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}