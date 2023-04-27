
class Course {

  String createdAt;
  String updatedAt;
  int id;
  String name;
  String instructor;
  int grade;

	Course.fromJsonMap(Map<String, dynamic> map): 
		createdAt = map["createdAt"],
		updatedAt = map["updatedAt"],
		id = map["id"],
		name = map["name"],
		instructor = map["instructor"],
		grade = map["grade"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['createdAt'] = createdAt;
		data['updatedAt'] = updatedAt;
		data['id'] = id;
		data['name'] = name;
		data['instructor'] = instructor;
		data['grade'] = grade;
		return data;
	}
}
