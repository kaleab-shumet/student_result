import 'package:student_result/pojo/user.dart';
import 'package:student_result/pojo/course.dart';

class SingleResult {

  String createdAt;
  String updatedAt;
  int id;
  User user;
  Course course;
  double testOne;
  double assignmentOne;
  double testTwo;
  double assignmentTwo;
  double finalExam;
  int grade;

	SingleResult.fromJsonMap(Map<String, dynamic> map): 
		createdAt = map["createdAt"],
		updatedAt = map["updatedAt"],
		id = map["id"],
		user = User.fromJsonMap(map["user"]),
		course = Course.fromJsonMap(map["course"]),
		testOne = map["testOne"],
		assignmentOne = map["assignmentOne"],
		testTwo = map["testTwo"],
		assignmentTwo = map["assignmentTwo"],
		finalExam = map["finalExam"],
		grade = map["grade"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['createdAt'] = createdAt;
		data['updatedAt'] = updatedAt;
		data['id'] = id;
		data['user'] = user == null ? null : user.toJson();
		data['course'] = course == null ? null : course.toJson();
		data['testOne'] = testOne;
		data['assignmentOne'] = assignmentOne;
		data['testTwo'] = testTwo;
		data['assignmentTwo'] = assignmentTwo;
		data['finalExam'] = finalExam;
		data['grade'] = grade;
		return data;
	}
}
