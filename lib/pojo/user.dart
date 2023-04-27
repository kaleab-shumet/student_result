
class User {

  String createdAt;
  String updatedAt;
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  int grade;
  String role;

	User.fromJsonMap(Map<String, dynamic> map): 
		createdAt = map["createdAt"],
		updatedAt = map["updatedAt"],
		id = map["id"],
		firstName = map["firstName"],
		lastName = map["lastName"],
		email = map["email"],
		password = map["password"],
		grade = map["grade"],
		role = map["role"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['createdAt'] = createdAt;
		data['updatedAt'] = updatedAt;
		data['id'] = id;
		data['firstName'] = firstName;
		data['lastName'] = lastName;
		data['email'] = email;
		data['password'] = password;
		data['grade'] = grade;
		data['role'] = role;
		return data;
	}
}
