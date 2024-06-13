import 'dart:convert';

class UserModel {
	String? type;
	String? title;
	int? status;
	String? traceId;

	UserModel({this.type, this.title, this.status, this.traceId});

	factory UserModel.fromUser(Map<String, dynamic> data) => UserModel(
				type: data['type'] as String?,
				title: data['title'] as String?,
				status: data['status'] as int?,
				traceId: data['traceId'] as String?,
			);

	Map<String, dynamic> toUser() => {
				'type': type,
				'title': title,
				'status': status,
				'traceId': traceId,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory UserModel.fromJson(String data) {
		return UserModel.fromUser(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toUser());
}
