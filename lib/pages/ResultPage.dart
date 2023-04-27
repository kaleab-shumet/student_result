import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_result/pojo/SingleResult.dart';

import '../component/StudentInfo.dart';
import '../component/SubjectComponent.dart';
import '../pojo/User.dart';


class ResultPage extends StatefulWidget {
  final String token;




  const ResultPage({super.key, required this.token});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _loading = true;

  late Future<List<SingleResult>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = _fetchData();
  }

  Future<List<SingleResult>> _fetchData() async {
    print("_fetchData");
    print(widget.token);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${widget.token}"
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            "https://school-management-production-75a6.up.railway.app/api/student/results"));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data feteched correctly ....",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0);

      final resultJson = jsonDecode(await response.stream.bytesToString());

      final dataList = resultJson["data"] as List;

      List<SingleResult> results = dataList.map((e) => SingleResult.fromJsonMap(e)).toList();
      return results;
    } else {
      Fluttertoast.showToast(
          msg: "Error occured ...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0);

      print(response.reasonPhrase);

      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),

      body: Center(
        child: FutureBuilder<List<SingleResult>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return ListView.builder(
                itemCount: snapshot.data!.length + 1,
                itemBuilder: (BuildContext context, int index) {

                  if(index == 0){
                    return StudentInfo(title: "Student Information", firstName: snapshot.data![index].user.firstName, lastName: snapshot.data![index].user.lastName, email: snapshot.data![index].user.email, grade: snapshot.data![index].user.grade.toString());
                  }

                  return SubjectComponent(
                    subjectName: snapshot.data![index-1].course.name,
                    testOne: snapshot.data![index-1].testOne.toStringAsPrecision(2),
                    assignmentOne: snapshot.data![index-1].assignmentOne.toStringAsPrecision(2),
                    testTwo: snapshot.data![index-1].testTwo.toStringAsPrecision(2),
                    assignmentTwo: snapshot.data![index-1].assignmentTwo.toStringAsPrecision(2),
                    finalExam: snapshot.data![index-1].finalExam.toStringAsPrecision(2),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
        )
      ),
    );
  }
}
