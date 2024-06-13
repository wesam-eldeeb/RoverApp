import 'dart:convert';

class User {
	String? userId;
	String? userPicture;
	String? firstName;
	String? lastName;
	String? password;
	String? email;
	String? phone;
	int? gender;
	int? type;

	User({
		this.userId, 
		this.userPicture, 
		this.firstName, 
		this.lastName, 
		this.password, 
		this.email, 
		this.phone, 
		this.gender, 
		this.type, 
	});

	factory User.fromUser(Map<String, dynamic> data) => User(
				userId: data['userId'] as String?,
				userPicture: data['user_Picture'] as String?,
				firstName: data['first_Name'] as String?,
				lastName: data['last_Name'] as String?,
				password: data['password'] as String?,
				email: data['email'] as String?,
				phone: data['phone'] as String?,
				gender: data['gender'] as int?,
				type: data['type'] as int?,
			);

	Map<String, dynamic> toUser() => {
				'userId': userId,
				'user_Picture': userPicture,
				'first_Name': firstName,
				'last_Name': lastName,
				'password': password,
				'email': email,
				'phone': phone,
				'gender': gender,
				'type': type,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromUser(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toUser());
}
