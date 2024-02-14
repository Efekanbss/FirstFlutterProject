import 'package:flutter/material.dart';
import 'package:temel_widget/screens/student_add.dart';

import 'models/student.dart';


void main() {
  runApp( MaterialApp(
    home:MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0,"","",0);

  List <Student> students = [new Student.withId(1,"Engin", "Demiroğ", 25),
    new Student.withId(2,"Kerem", "Varış", 65),
    new Student.withId(3,"Halil", "Korkmaz", 45)];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(message),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: (){
                        setState(() {
                          selectedStudent = students[index];
                          print(selectedStudent.firstName);
                        });

                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://www.shutterstock.com/shutterstock/photos/2071252046/display_1500/stock-photo-portrait-of-cheerful-male-international-indian-student-with-backpack-learning-accessories-standing-2071252046.jpg"),
                      ),
                      title: Text(students[index].firstName+" "+ students[index].lastName),
                      subtitle: Text("Sınavdan aldığı not: "+students[index].grade.toString()+ " ["+students[index].getStatus+" ]"),
                      trailing: buildStatusIcon(students[index].grade)
                    );
                  },
                )),
            Text("Seçili öğrenci: "+ selectedStudent.firstName),
            Row(
              children:<Widget> [
                Flexible(
                  fit: FlexFit.tight,
                  flex:0,
                  child: ElevatedButton(

                      child:  Row(

                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 3,),
                          (Text("Yeni Öğrenci")),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                      }
                    ),

                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex:0,
                  child: ElevatedButton(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.update),
                          SizedBox(width: 3,),
                          Text("Güncelle"),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                      onPressed: (){
                        var mesaj = "Güncellendi";
                        mesajGoster(context, mesaj);
                      }
                  ),

                ),Flexible(
                  fit: FlexFit.tight,
                  flex:1,
                  child: ElevatedButton(

                      child: Row(

                        children: [
                          Icon(Icons.delete),
                          SizedBox(width:4,),
                          (Text("Sil")),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.yellow),
                      onPressed: (){
                        setState(() {
                          students.remove(selectedStudent);

                        });
                        var mesaj = "Silindi: "+selectedStudent.firstName;
                        mesajGoster(context, mesaj);
                      }
                  ),

                )
              ],
            ),
          ],
        )

    );
  }



  void mesajGoster(BuildContext context,String mesaj){
    var alert = AlertDialog(
      title: Text("İşlem sonucu"),
      content: Text(mesaj),
    );
    showDialog(
        context: context, builder: (BuildContext context)=> alert);
  }

  buildStatusIcon(int grade) {

    if (grade >= 50) {
      return Icon(Icons.done);
    }
    else if (grade >= 40) {
      return Icon(Icons.album);
    }
    else {
      return Icon(Icons.clear);
    }
  }
}

